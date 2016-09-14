# Ransomware-Cpp-Bash-minimal
This variant of a ransomware is mostly made in bash and given a outer shell in Cpp, It encrypts The home dir of the user with a randomly generated key and sends the key to a specified websie where a php script is set up to capture the key

The post.php is a php which you upload on any free host and change the location accordingly in main.cpp to capture the key

The ransomware encrypts each file in the home dir twice, first with key1 and then key2.

I will be uploading a mass decrypting script in future, and for any questions you can contact me on drigg3r@yandex.com
