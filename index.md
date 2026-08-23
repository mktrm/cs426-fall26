---
layout: home
title: CS-426
nav_exclude: true
seo:
  type: Course
  name: ' Computer Security'

toc: true
toc_label : "On this page"
toc_hmin: 2
toc_hmax: 6
---

# {{ site.tagline }}
{: .mb-2 }
{{ site.description }}
{: .fs-6 .fw-300 }


This 3-credits undergraduate course covers the basics of computer security.  We will cover a wide range of topics from both offensive and defensive sides, including systems security and exploitation (e.g., buffer overflows), sandboxing and isolation, side channels, network security, cryptography, privacy and anonymity, and legal and ethical issues. Together, we will learn how to build *secure* computer systems, we will understand security best practices, and we will get to know security failures in existing and emerging computer networks and systems.

By the end of the course, you will have the basic knowledge to reason about common security attacks and defenses, you will become familiar with security engineering best practices, and you will learn how to write better and more secure software, protocols, and systems, and you will have rudimentary skills in security research.
I hope that you will have fun taking this course as much as I will enjoy teaching it!


**Catalog Description:** The course focuses on the principles and foundations of building secure computer systems and on security and privacy challenges in existing and emerging computer networks and systems.
The course compares and analyzes security and privacy threats and architectures from an adversarial standpoint to understand how to build more secure protocols that can withstand ever-adaptive attacks.





## Instructor

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
{% for staffer in instructors %}
{{ staffer }}
{% endfor %}

{% assign teaching_assistants = site.staffers | where: 'role', 'Teaching Assistant' %}
{% assign num_teaching_assistants = teaching_assistants | size %}
{% if num_teaching_assistants != 0 %}
## Teaching Assistants

{% for staffer in teaching_assistants %}
{{ staffer }}
{% endfor %}
{% endif %}

## Lectures
Lectures are M/W from 4:30 pm to 5:45 pm, [Stewart Center 320](https://maps.app.goo.gl/yExs8PtmGn87niA99){:target="_blank"}.

Updated Office Hours on BrightSpace (See [Course Calendar]({{ site.brightspace_calendar }}){:target="_blank"}).

## Prerequisite 
The formal prerequisite is undergraduate level CS 25100 minimum grade of C and undergraduate level CS 25200 minimum grade of C [may be taken concurrently] or undergraduate level ECE 46900 Minimum Grade of C or undergraduate level EE 46900 Minimum Grade of C. However, to complete the assignments in this course, you will need to be able to write code in Python, C, and (some) C++, and have some understanding of x86 assembly, JavaScript, PHP, and SQL. We will not teach these in lecture; you are expected to learn them on your own or ask for help in office hours.


## Textbook
There is no official textbook for the class. Slides will be provided and reading materials for each topic will be posted before the lectures. 
However, the following resources are going to be useful: 

- Security Engineering – Ross Anderson, Third Edition
- Hacking: The Art of Exploitation by Jon Erickson

We try to be clear about what is okay to skim and what will be helpful to read deeply (See [Agenda](#agenda-tentative)).


## Format 
Course format is lectures two days a week. Attendance is not optional. The slides will be available for download before each lecture. See [slides]({{ site.brightspace_content }}/Home). 

During lectures, we will have interactive question and answer activities in the class. We will use [slido](https://app.sli.do/event/bsjQVb1v93k2SzpRYmAsdD) for polls and discussions. 
These are opportunities for you to check your understanding and for us to go back and help explain concepts more thoroughly that may be confusing folks.
These in-lecture polls will **not** be graded for correctness or attendance, and they are **not** the same thing as the [surprise in-class quizzes](#surprise-in-class-quizzes-extra-credit) described under Grading -- those are on paper and they do carry extra credit.


{: .note }
A quick reminder: **Active engagement** and **re-enforcement** are keys to successful and effective learning. Therefore, we will have plenty of activities during lectures. These activities also help you to meet and interact with other students. Moreover, assignments, and grading are designed to help with re-enforcement and active engagement.


## Online Discussion
Discussions, Q&A, peer-to-peer instruction, etc. take place on our [edstem](https://edstem.org/us/courses/102091/discussion){:target="_blank"}. Use the link in [Brightspace]({{ site.brightspace_content }}/viewContent/22431141/View) to join the class on edstem. You are encouraged to post questions, help answer other students' questions, and provide feedback and suggestions to your instruction staff. Constructive criticism is always welcome. 

{: .warning }
While the instruction staff will do their best to answer any question as soon as possible, be aware (and plan ahead) that instruction staff will not be available 24/7. 



## Grading
An ideal assessment should evaluate learning outcomes, thus your grade should not depend on other student's performance in class (i.e., no bell curve).
We will use the following scale for your final grade:

<div class="table-responsive">
<table class="table grade-table">
  <tbody><tr>
    <th>A+<br><small>&gt;96.7</small></th>
    <th>A<br><small>[93,96.7)</small></th>
    <th>A-<br><small>[90,93)</small></th>
    <th>B+<br><small>[86.7,90)</small></th>
    <th>B<br><small>[83.3,86.7)</small></th>
    <th>B-<br><small>[80,83.3)</small></th>
    <th>C+<br><small>[76.7,80)</small></th>
    <th>C<br><small>[70,76.7)</small></th>
    <th>D<br><small>[60,70)</small></th>
    <th>F<br><small>[0,60)</small></th>
  </tr>
</tbody></table>
</div>

{:.warning}
We reserve the right to modify these ranges and the following tentative grading breakdown as the course proceeds. 


### Weekly Check-in (5%)

On each Tuesday (from 2nd week onward), we will release a weekly check-in mini-quiz on BrightSpace. The weekly check-ins must be completed by the class time the following Wednesday. **So, you will have at least 24 hours to complete them.**

You will have 4 late days for weekly check-ins throughout the semester. But note that late days defeat the purpose of these weekly check-in as they want to ensure that you come to class ready. 

These weekly check-ins are primarily for you, to help you stay on track and to check your own understanding. Therefore, **we will not grade them for correctness**. If you complete the weekly check-in quiz, you will earn full points for that week. However, if your raw score on a weekly check-in is low, come to office hours or ask questions on edstem and get help!

### Homework (35%)
These are longer form assignments that include both programming and a non-programming conceptual section.

Homework may be completed **in groups of at most two students**. Working alone is perfectly acceptable and is not graded any differently. If you do work with a partner:

- Both partners must engage with *every* part of the assignment. Splitting the problems so that each of you only ever sees half of them defeats the purpose of the assignment, and it will show up on the exams.
- Submit **one** writeup per group on Gradescope and add your partner to the submission so that you both receive the grade.
- You may change partners between assignments; you are not committing to the same partner for the whole semester.
- Collaboration beyond your own group of two is subject to the [Academic Integrity](#academic-integrity) policy below.

Homework submission will be via the [Gradescope](https://www.gradescope.com/courses/1365033){:target="_blank"}. If you are enrolled in the class you should see the class in your Gradescope account. Regrade requests will also be handled via Gradescope. The window for regrades will be no more than one week after graded homework is returned.

We will have 10-12 homework sets. Generally they will be released on Monday and you will have 1 weeks (with a few exceptions) to submit. See the tentative schedule for more information on the schedule of the homework assignments ([Agenda](#agenda-tentative)). Homework assignments will have equal grades and together they will be 35% of your final grade. 

### Midterm (25%)
This course will have one midterm exam.
The midterm is scheduled for **Wednesday, Oct 14, 6:30PM - 7:30PM** at **RHPH 172**. 

### Final (35%)
The final exam will be cumulative over all of the course content.
The final will be held during the university final exam period, **Dec 14 - Dec 19**. The exact day, time, and room are set by the registrar and will be posted here once the Purdue final exam schedule is released.


### Surprise In-Class Quizzes (Extra Credit)

At **three unannounced points** during the semester, we will hand out a short quiz in the middle of lecture. These are pure **extra credit**: each one is worth **1 percentage point added to your final grade**, for up to **3 points total** on top of the 100% above.

They exist to reward you for showing up. Therefore, there are **no makeups**, and we will not announce the dates in advance. 

Unlike the [slido polls](#format) during lecture, which stay ungraded all semester, these are handed out on paper and they do count -- as extra credit only.

They will cover material from the same lecture, so they also work as a low-stakes check on the recent materials.


## Late Assignments

You get two separate pools of late days for the semester:

| Category | Late days | Most you may spend on one deadline |
|:---------|:----------|:-----------------------------------|
| Homework | 7 | 4 |
| [Weekly check-ins](#weekly-check-in-5) | 4 | 4 |

The pools are independent: check-in late days cannot be spent on homework, and homework late days cannot be spent on check-ins.

**Using a late day carries no penalty.**  There is no percentage deduction, you do not need to ask permission, and you do not need to give us a reason.

The granularity is *days*, not hours: submitting any time in the 24 hours after a deadline spends one full late day, whether you are ten minutes or twenty-three hours late. The per-deadline cap is there so that we can start grading and get feedback back to the class while the material is still fresh.

Late days are a scheduling tool, not an accommodation. If something more serious is going on (serious illness, a family emergency, anything covered by Purdue's absence policies). Contact the Dean of student's office and they will reach out to us.



## Ethics and Authorized Use

This course teaches you how to attack real systems. You will write buffer overflows, build ROP chains, corrupt heaps, forge cross-site requests, and break protocols. We teach these techniques so that you can build and defend systems that withstand them. You cannot defend against an attack you do not understand. But using these techniques at the wrong target could be crimes.

**Apply what you learn here only to systems you own, or that you have explicit permission to test.** For this course, that means:

- the VMs, containers, and target binaries we hand you for the assignments;
- your own machines and your own accounts;
- systems whose owner has given you specific, documented authorization -- a signed engagement, a bug bounty program's published scope, or a lab environment built for the purpose.

Everything else is out of bounds, including Purdue's networks and services, another student's machine or account, the course infrastructure, Gradescope and Brightspace, a company's website "just to look," and whatever answered when you ran a scan from your dorm room. Curiosity is not authorization. Neither is an unlocked door, a weak password, or a URL you were not meant to see.

<!-- {: .danger } -->
Unauthorized access is a violation even when nothing breaks and nothing is taken, and even when the motive was curiosity.
When you are unsure whether a target or a technique is in scope, ask us **before** you try it.


## AI Policy

You **are allowed** to use AI tools (ChatGPT, Claude, Copilot, and friends) on the homework. Learning to work with these tools is a genuinely useful skill, and we would much rather talk openly about how to use them well than pretend they do not exist.

That said, *how* you use them matters enormously, both for your grade and for what you actually walk away with after the class.

### Struggle first

The confused, stuck, *"I have been staring at this for forty minutes"* feeling is not a sign that something has gone wrong. **That feeling is the learning.** It is what forces you to build a real mental model of how a system breaks, instead of a vague sense that it can be broken. Security especially rewards the person who has genuinely wrestled with why a defense fails, and it has little use for the person who has only ever read a correct answer.

An AI tool can hand you that answer in seconds, and in doing so it can quietly take the entire learning process away from you. So embrace the struggle and sit in it for a while. It is the most valuable part of this course.

Concretely: **attempt every problem yourself before you ask a model anything.** When you do reach for AI, reach for it the way you would reach for a TA -- to unblock a specific confusion, to hear a concept explained a different way, to check something you have already written -- and not to produce your answer for you.

{: .danger }
**The concepts in the homework WILL be asked directly on the midterm and the final.** The exams are closed-book, and there is no AI in the exam room. Every homework problem you let a model solve for you is a problem you will meet again, on your own, when it is worth many more points. This is the most common way students hurt their grade in a course like this one: not by cheating, but by outsourcing the practice and then discovering during the exam that they never actually learned the material.

You remain fully responsible for everything you submit, including anything an AI tool wrote for you. "The model told me so" is not a defense for an answer that is incorrect, nonsensical, or copied from someone else's work.


## Academic Integrity
Cheating WILL be taken seriously. It is not fair to honest students to take cheating lightly, nor is it fair to the cheater to let him/her go on thinking that is a reasonable alternative in life. 

The following is not considered cheating:

- discussing the homeworks with other students (with the writeup done separately, later).
- working with your homework partner on all parts of an assignment and submitting a single shared writeup (see [Homework](#homework-35)).


The following is:

- Discussing homework with someone who has already completed the problem, or looking at their completed write-up.
- Using an existing solution to an assigned problem -- from the web, from a previous offering of this class, from a solutions manual, or from another student -- whether you found it yourself or asked a tool to find it for you.
- Receiving, providing, or soliciting assistance from another student during a test.

{: .note }
[AI Policy](#ai-policy) above says a model helping you reason through a problem you are working on is fine, while a model handing you a finished solution to an assigned problem is the same violation as looking that solution up. Everything else above still applies when you are using one.

{: .danger}
Penalties -- anyone copying information or having information copied on a homework, or an exam, or any other violation of class policy, will receive an F in the class and will not be allowed to drop.  They will be reported to their college dean.  If you can prove non-cooperative copying took place, your grade may be restored, but you must prove it to the dean.



## University Policies and Statements 

Please see [Brightspace]({{ site.brightspace_content }}/Home) for complete list of university policies and statements. 



## Agenda (Tentative!)

This is a tentative schedule and we may change it as the course proceeds. 

{% include agenda.html %}


## DISCLAIMER
The details in this syllabus may change (e.g. schedule, grading policy, assignments, etc.). We will update this syllabus in the event of changes as the course progresses. We will send announcements in the case of significant changes. It is your responsibility to check for the course announcements. 

## Credit
This page uses materials from many other instructors including Deian Stefan, Dave Tian, Aniket Kate, Pat Pannuto and Dean Tullsen. 
