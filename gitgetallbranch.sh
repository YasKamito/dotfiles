#!/bin/bash

git fetch --all --prune;
for branch in $(git branch -r | grep -v HEAD | grep -v master | awk -F'origin/' '{print $2}'); 
do 
    git branch -D $branch; 
    git checkout -b $branch origin/$branch;
done;
