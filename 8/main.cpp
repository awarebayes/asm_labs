#include <iostream>
#include <cstdio>
#include <ctime>
#include <cstdlib>
#include <string>
#include "float.h"
#include "double.h"
#include "ldouble.h"
#include "sinus.h"

template<typename T>
void bench(T (*binary)(T a, T b), const std::string &name)
{
	double sum = 0;
	long int n_trials = 1000;
	for (int i = 0; i < n_trials; i++)
	{
		T arg1 = static_cast<T>(rand()) / 42.0;
		T arg2 = static_cast<T>(rand()) / 1337.0;
		clock_t begin = clock();
		binary(arg1, arg2);
		clock_t end = clock();
		sum += (double)(end - begin) / CLOCKS_PER_SEC;
	}
	std::cout << "time for \t" << name << ":\t" << sum / n_trials << "\n";
}

int main()
{
	srand (time(NULL));
	std::cout << "float" << std::endl;
	bench<float>(fadd, "add");
	bench<float>(my_fadd, "my add");
	bench<float>(fmul, "mul");
	bench<float>(my_fmul, "my mul");

	std::cout << "double" << std::endl;
	bench<double>(dadd, "add");
	bench<double>(my_dadd, "my add");
	bench<double>(dmul, "mul");
	bench<double>(my_dmul, "my mul");


	std::cout << "long double" << std::endl;
	bench<long double>(ldadd, "add");
	bench<long double>(my_ldadd, "my add");
	bench<long double>(ldmul, "mul");
	bench<long double>(my_ldmul, "my mul");

	std::cout << "Sinuses\n" << std::endl;

	c_compare_sin();
	asm_compare_sin();
}

