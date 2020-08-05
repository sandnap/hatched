#!/bin/bash
set -e

rm -f /rails-base/tmp/pids/server.pid

exec "$@"
