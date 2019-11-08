#!/bin/sh
git ls-files | xargs -L 1 git log -1 --name-only --pretty="%h" |grep -v '^\s*$' | awk '{if(NR%2)ORS=",";else ORS="\n";print}'

