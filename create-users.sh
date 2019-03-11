#!/bin/bash

users=( "$@" )

arlen="${#users[@]}"

i=1

while [ "$i" -le "$arlen" ]
do
        useradd -u ${users[1]} -g ${users[2]} -c ${users[3]} -m -d ${users[4]} -s ${users[5]} ${users[0]}
	echo -e "${users[0]}\n${users[0]}"|passwd ${users[0]}

        i=$(expr $i + 6)
        shift 6
        users=( "$@" )
done
