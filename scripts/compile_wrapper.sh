#!/bin/bash

#ulimit -m $((512 * 1024)) # RSS limit in K
#ulimit -t 5 # CPU time in seconds
#ulimit -v $((2 * 1024 * 1024)) # virtual RAM limit in K

gcc -std=c99 -Wall -Wextra -Wpedantic -Werror -o $2 $1 && ./$2
