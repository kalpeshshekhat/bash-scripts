#!/bin/bash

groups=( "$@" )

grparlen="${#groups[@]}"

i=1

while [ "$i" -le "$grparlen" ]
do
        groupadd -g ${groups[1]} ${groups[0]}

        i=$(expr $i + 2)
        shift 2
        groups=( "$@" )
done
