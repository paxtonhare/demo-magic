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
# install pv https://www.ivarch.com/programs/pv.shtml onto your local machine
# if you want simulated typing
. ../../demo-magic.sh -d


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
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"

# text color
# DEMO_CMD_COLOR=$BLACK

# hide the evidence
clear

scp -P 2222 ../demo-magic.sh localhost:/config/demo-magic.sh > /dev/null 2>&1
scp -P 2222 ./server-side.sh localhost:/config/server-side.sh > /dev/null 2>&1
p "ssh localhost"
ssh -t -p 2222 localhost ./server-side.sh
