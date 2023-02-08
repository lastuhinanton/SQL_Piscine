#!/bin/bash

# for i in $(seq 0 $2); do
#     file="day"
#     if [[ $i -le 9 ]]; then
#         file="${file}$1_ex0${i}.sql"
#     else
#         file="${file}$1_ex${i}.sql"
#     fi
#     touch $file
# done

for i in $(seq 0 $2); do
    file="day"
    if [[ $i -le 9 ]]; then
        directory="ex0${i}"
        file="${file}$1_ex0${i}.sql"
    else
        directory="ex${i}"
        file="${file}$1_ex${i}.sql"
    fi
    mkdir $directory
    mv $file ./$directory/
done
