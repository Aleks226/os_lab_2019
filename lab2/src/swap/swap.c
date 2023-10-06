#include "swap.h"

void Swap(char *left, char *right)
{
	// ваш код здесь
    // 3
	char temp = *left;
    *left = *right;
    *right = temp;
}
