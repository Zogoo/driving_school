#!/bin/bash
set -e

rails db:create
rails db:migrate
rails db:seed

# run service
rm -rf /app/tmp/pids/server.pid
rails s -b0 -p 3000