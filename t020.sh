#!/usr/bin/env bash

# Example: your current git repo is dirty in this case because of untracked files.

set -x
set -e
set -u

r=$(date +%s)
myproject="/tmp/myproject-${r}"
mkdir $myproject && cd $myproject

cat >main.go <<EOF
package main

import "fmt"

func main() {
   fmt.Println("Hello, World!")
}
EOF

go mod init go.company.com/mytest

git init
git add -A
git commit -am Intial

git tag v0.0.1

go build

bump patch

git ls-files . --exclude-standard --others

rm -rf $myproject
