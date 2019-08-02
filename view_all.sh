#!/bin/bash

echo
echo All:
./view.sh data/git-time.190803.txt.gz

for y in 2017 2018 2019; do echo; echo $y;zcat data/git-time.190803.txt.gz | grep ^$y | ./view.sh; done
echo
