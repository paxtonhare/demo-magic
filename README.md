# Demo Magic

demo-magic.sh is a handy shell script that enables you to script repeatable demos in a bash environment so you don't have to type as you present. Rather than trying to type commands when presenting you simply script them and let demo-magic.sh run them for you.

## Features
- Simulates typing. It looks like you are actually typing out commands
- Allows you to actually run commands or pretend to do so.
- Can hide commands from presentation. Useful for behind the scenes stuff that doesn't need to be shown.

## Functions

### pe
Print and Execute. This function will simulate typing whatever you give it. It will then pause until you press a key. After your keypress it will run the command.

```bash
#!/bin/bash

pe "ls -l"
```

### p
Print only. This function will simulate typing whatever you give it. It will not run the command. After typing it will pause until you press a key. After your keypress it will move on to the next instruction in your script.

```bash
#!/bin/bash

p "ls -l"
```

### wait
Waits for the user to press any key.

```bash
#!/bin/bash

wait
```

## Getting Started
Create a shell script and include demo-magic.sh

```bash
#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# hide the evidence
clear

# Put your stuff here
```

Then use the handy functions to run through your demo.

## Command line usage
demo-magic.sh exposes 3 options out of the box to your script.
- -d - disable simulated typing. Useful for debuging
- -h - prints the usage text
- -n - set no default waiting after `p` and `pe` functions

```bash
$ ./my-demo.sh -h

Usage: ./my-demo.sh [options]

  Where options is one or more of:
  -h  Prints Help text
  -d  Debug mode. Disables simulated typing
  -n  No wait

```

## Useful Tricks

### Faking network connections
Network connections during demos are often unreliable. Try and fake whatever commands would rely on a network connection. For example: Instead of trying to install node modules in a node.js application you can fake it. You can install the node_modules at home on your decent network. Then rename the directory and pretend to install it later by symlinking. If you want to be thorough you can capture the output of npm install into a log file then cat it out later to simulate the install.

```bash
#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

# hide the evidence
clear

# this command is typed and executed
pe "cd my-app"

# this command is merely typed. Not executed
p "npm install"

# this command runs behind the scenes
ln -s cached_node_modules node_modules

# cat out a log file that captures a previous successful node modules install
cat node-modules-install.log

# now type and run the command to start your app
pe "node index.js"
```

### No waiting
The -n _no wait_ option can be useful if you want to print and execute multiple commands.

```bash
# include demo-magic
. ~/Desktop/Git/src/demo-magic/demo-magic.sh -n

# add multiple commands
pe 'git status'
pe 'git log --oneline --decorate -n 20'
```bash
However this will oblige you to define your waiting points manually e.g.
```bash
...
# define waiting points
pe 'git status'
pe 'git log --oneline --decorate -n 20'
wait
pe 'git pull'
pe 'git log --oneline --decorate -n 20'
wait
```bash