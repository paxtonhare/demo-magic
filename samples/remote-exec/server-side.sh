#!/usr/bin/env bash

#################################
# include the -=magic=-
# you can pass command line args
#
# example:
# to disable simulated typing
# . ../demo-magic.sh -d
#
# pass -h to see all options
#################################

# note that -d is passed to disable simulated typing
# install pv https://www.ivarch.com/programs/pv.shtml onto your remote server
# if you want simulated typing
. ./demo-magic.sh -d


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}(my fancy server)➜ ${CYAN}\W ${COLOR_RESET}"

# text color
# DEMO_CMD_COLOR=$BLACK

# hide the evidence
clear

# put your demo awesomeness here
if [ ! -d "stuff" ]; then
  pe "mkdir stuff"
fi

# print and execute: cd stuff
pe "cd stuff"

# ctl + c support: ctl + c to stop long-running process and continue demo
pe "ping www.google.com"

# print and execute: echo 'hello world' > file.txt
pe "echo 'hello world' > file.txt"

# wait max 3 seconds until user presses
PROMPT_TIMEOUT=3
wait

# print and execute immediately: ls -l
pei "ls -l"
# print and execute immediately: cat file.txt
pei "cat file.txt"

# and reset it to manual mode to wait until user presses enter
PROMPT_TIMEOUT=0

# print only
p "cat \"something you want to pretend to run\""

# run command behind
cd .. && rm -rf stuff

# enters interactive mode and allows newly typed command to be executed
cmd

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
