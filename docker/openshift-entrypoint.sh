#!/bin/bash

# Identify current id as git
sed -i "s/git:x:[^:]*:[^:]*:/git:x:$(id -u):$(id -g):/" /etc/passwd

command="$1"
shift
exec $command "$@"
