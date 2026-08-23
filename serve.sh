#!/usr/bin/env bash
# Serve the site locally with live reload.
#   ./serve.sh            -> http://localhost:4001/cs426-fall26/
#   ./serve.sh --port 4002
# Uses Homebrew ruby@3.3 and the gems installed by `bundle install`
# (BUNDLE_PATH is set in .bundle/config, outside the repo so Jekyll
# does not try to render the gem sources).
set -euo pipefail
cd "$(dirname "$0")"
export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"
exec bundle exec jekyll serve \
  --config _config.yml,_config.dev.yml \
  --livereload \
  --incremental \
  --port 4001 \
  --livereload-port 35730 \
  "$@"
