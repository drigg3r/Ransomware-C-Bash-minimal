# Ransomware-C-Bash-minimal
This variant of a ransomware is mostly made in bash and given a outer shell in Cpp, It encrypts The home dir of the user is encrypted with a randomly generated key twice and it POSTs the key to a specified website where a php script is set up to capture the key

The post.php is a php which you upload on any free host and change the location accordingly in main.c to capture the key

The ransomware encrypts each file in the home dir twice, first with key1 and then key2.

For the decryption, you can go to decrypt folder and read instructions.txt
For any questions you can contact me on drigg3r@yandex.com

*For educational Purposes only
