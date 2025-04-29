#!/usr/bin/env bash

. ../../demo-magic.sh -d

################################
# Setup
################################

set -e

rm -rf main

mkdir main
cd main
git init
git config user.name "Alex Mayer"
git config user.email amayer@example.com
git config pager.log false

cat <<EOF > main.go
package main

import "fmt"

func main() {
	fmt.Println("Hello, World!")
}
EOF

git add main.go
git commit --message 'Initial Commit'

if [ "$1" = "--reset" ]; then
  exit
fi

# hide the evidence
clear

################################
# Demo
################################

pe 'cat main.go'
pe 'sed -i "s/World/Demo Magic/" main.go'
pe 'cat main.go'
pe 'git add main.go'
pe 'git commit --message "World -> Demo Magic"'
pe 'git log'

# run program if go is installed
if command -v go > /dev/null; then
  pe 'go run main.go'
fi

pe ''
