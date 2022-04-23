#include <stdio.h>

extern char *my_strcpy(char *dest, char *src);

size_t my_strlen(const char *str)
{
	size_t len;
	asm volatile (".intel_syntax;"
		"mov %%rcx, -1;"
		"mov %%rdi, %1;"
		"cld;" // очистка флагов
		"repnz scasb;"
		// перевод в signed
		"not %%rcx;"
		"dec %%rcx;"
		"mov %0, %%rcx;"
		".att_syntax;"
		: "=r" (len)
		: "r" (str)
		: "rcx", "rdi");
	return len;
}

int main()
{
	char *str = "Hello, World!\n";
	char buf[100];
	size_t len = my_strlen(str);
	printf("Hello world length: %ld\n", len);
	my_strcpy(buf, str);

	printf("Buf has:\n%s\n", buf);

	return 0;
}
