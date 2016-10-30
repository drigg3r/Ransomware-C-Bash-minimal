#!/bin/bash

m="key1"
n="key2"

decfile()
{
f=$1
if [[ "$f" == *".aes.aes"* ]] ; then 
j=`echo $f| sed 's/....$//'`
openssl aes-256-cbc -a -d -salt -in $f -out $j -k $n
rm $f
fi
p=`echo $1| sed 's/....$//'`
if [[ ( "$p" == *".aes"* ) && ( "$p" != *".aes.aes"* ) ]]; then
j=`echo $p| sed 's/....$//'`
openssl aes-256-cbc -a -d -salt -in $p -out $j -k $m
rm $p
fi
}

decdir()
{
	cd $1
	for f in * ; do
	if [ -f "$1/$f" ]; then
	decfile "$1/$f"
	elif [ -d "$1/$f" ]; then
	decdir "$1/$f"
	fi
	done
}

m=`echo ~/`
decdir "$m" > /dev/null 2>&1
