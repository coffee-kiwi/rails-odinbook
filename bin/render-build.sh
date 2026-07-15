#!/usr/bin/env bash

set -o errexit

# Try setting to install imagemagick
apt-get update
apt-get install -y imagemagick


bundle install
bin/rails assets:precompile
bin/rails assets:clean
# bundle add solid_queue
# bin/rails solid_queue:install
# bundle exec rake solid_queue:start
bin/rails db:prepare