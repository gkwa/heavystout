#!/usr/bin/env bash

# Example: code is not in git repo.

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

go build

bump patch

rm -rf $myproject
