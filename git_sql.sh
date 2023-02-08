#!/bin/bash

for file in $(find . -maxdepth 1 | grep -F .sql); do
    git add $file
    git commit -m "add completed task"
    git push
done