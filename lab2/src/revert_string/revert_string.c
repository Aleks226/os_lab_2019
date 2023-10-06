#include "revert_string.h"
#include <string.h>

void RevertString(char *str)
{
	// your code here
	// 10
	char *start = str;
	char *end = start+strlen(str)-1;

	while(start<end)
	{
		char temp = *end;
		*end = *start;
		*start=temp;
		start++;
		end--;
	}
}

