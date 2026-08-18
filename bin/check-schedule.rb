#!/usr/bin/env ruby
# Validates _data/schedule.yml and prints the computed calendar.
#
#   ruby bin/check-schedule.rb
#
# Catches the mistakes the template cannot: more sessions than meeting days,
# a homework released but never collected or due before it is out, a holiday
# that isn't a class day.
# Exits non-zero on error, so it can be wired into CI.

require 'yaml'
require 'date'

ROOT = File.expand_path('..', __dir__)
sched = YAML.load_file(File.join(ROOT, '_data/schedule.yml'), aliases: true)

errors = []
warnings = []

start  = Date.parse(sched.fetch('start'))
finish = Date.parse(sched.fetch('end'))
meets  = sched.fetch('meets')
holidays = (sched['holidays'] || {}).transform_keys { |k| Date.parse(k.to_s) }
sessions = sched.fetch('sessions')

errors << "start (#{start}) must be a Monday" unless start.wday == 1
errors << "end (#{finish}) is before start (#{start})" if finish < start

# Walk the calendar exactly as _includes/agenda.html does.
days = (start..finish).select { |d| meets.include?(d.wday) }
class_days = days.reject { |d| holidays.key?(d) }

holidays.each do |d, name|
  next if days.include?(d)
  if d < start || d > finish
    warnings << "holiday #{d} (#{name}) falls outside the semester"
  else
    warnings << "holiday #{d} (#{name}) is not a class day, so it changes nothing"
  end
end

if sessions.size > class_days.size
  errors << "#{sessions.size} sessions but only #{class_days.size} class days " \
            "(#{sessions.size - class_days.size} would fall off the end)"
elsif sessions.size < class_days.size
  warnings << "#{class_days.size - sessions.size} class day(s) at the end have no session"
end

# Homework bookkeeping. Dates are absolute here, so they can be wrong in ways
# derived dates never could: out of order, duplicated, off the calendar.
homework = sched['homework'] || []
seen_ids = {}
homework.each_with_index do |h, i|
  label = h['id'] ? "HW#{h['id']}" : "homework ##{i + 1}"
  errors << "#{label}: missing id" unless h['id']
  if h['id']
    errors << "HW#{h['id']}: declared twice" if seen_ids[h['id']]
    seen_ids[h['id']] = true
  end

  out = h['out'] && Date.parse(h['out'].to_s)
  due = h['due'] && Date.parse(h['due'].to_s)
  errors << "#{label}: released but never due" if out && !due
  errors << "#{label}: due but never released" if due && !out
  errors << "#{label}: has neither out nor due" if !out && !due
  errors << "#{label}: due (#{due}) is not after release (#{out})" if out && due && due <= out

  [['out', out], ['due', due]].each do |kind, d|
    next unless d
    if d < start || d > finish
      warnings << "#{label}: #{kind} #{d} (#{d.strftime('%a')}) falls outside the semester"
    elsif holidays.key?(d)
      warnings << "#{label}: #{kind} #{d} (#{d.strftime('%a')}) is #{holidays[d]}"
    elsif !meets.include?(d.wday)
      warnings << "#{label}: #{kind} #{d} (#{d.strftime('%a')}) is not a class day, " \
                  'so it gets a row of its own'
    end
  end
end

errors << 'homework ids are not in chronological order' if
  homework.map { |h| h['id'] } != homework.map { |h| h['id'] }.compact.sort

sessions.each do |s|
  errors << "session '#{s['topic'] || s['note']}' still carries an inline hw: key " \
            '(homework moved to the top-level `homework` list)' if s['hw']
end

# Index homework by the day it lands on, for the printout below.
marks_on = Hash.new { |h, k| h[k] = [] }
homework.each do |h|
  marks_on[Date.parse(h['due'].to_s)] << "HW#{h['id']} due" if h['due']
  marks_on[Date.parse(h['out'].to_s)] << "HW#{h['id']} out" if h['out']
end

sessions.each_with_index do |s, i|
  next if s['topic'] || s['note']
  errors << "session ##{i + 1} has neither a topic nor a note"
end

# Print the schedule the site will render. Days the class does not meet appear
# only when homework lands on them, exactly as the template renders them.
idx = 0
(start..finish).each do |d|
  marks = marks_on[d]
  unless days.include?(d)
    puts format('%-10s      %-38s %s', d.strftime('%a %b %d'), '', marks.join(', ')) if marks.any?
    next
  end
  if (name = holidays[d])
    puts format('%-10s  -- %-38s %s', d.strftime('%a %b %d'), "#{name} (No Class)", marks.join(', '))
    next
  end
  s = sessions[idx]
  if s.nil?
    puts format('%-10s      %-38s %s', d.strftime('%a %b %d'), '', marks.join(', ')) if marks.any?
    next
  end
  idx += 1
  bits = marks.dup
  bits << s.dig('event', 'name') if s['event']
  label = s['topic'] || s['note']
  puts format('%-10s  %2d. %-38s %s', d.strftime('%a %b %d'), idx, label, bits.join(', '))
end

puts
puts "#{sessions.size} sessions over #{class_days.size} class days, " \
     "#{homework.size} homework sets " \
     "(#{start} - #{finish}, #{holidays.size} holidays)"

warnings.each { |w| puts "WARN  #{w}" }
errors.each   { |e| puts "ERROR #{e}" }
abort("\n#{errors.size} error(s)") unless errors.empty?
puts 'OK'
