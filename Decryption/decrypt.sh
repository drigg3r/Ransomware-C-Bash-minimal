#!/bin/bash

m=$1
n=$2

for f in * ; do
if [ -f $f ]; then
if [[ "$f" == *".aes.aes"* ]]; then 
k=`echo "$f" |sed 's/....$//'`
openssl aes-256-cbc -d -a -salt -in $f -out $k -k $n
rm $f
fi
fi
done
for f in * ; do
if [ -f $f ]; then
if [[ ( "$f" == *".aes"* ) && ( "$f" != *".aes.aes"* ) ]]; then
k=`echo "$f" |sed 's/....$//'`
openssl aes-256-cbc -a -d -salt -in $f -out $k -k $m
rm $f
fi
fi
done
