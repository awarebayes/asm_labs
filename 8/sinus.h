//
// Created by dev on 4/30/22.
//

#ifndef INC_8_SINUS_H
#define INC_8_SINUS_H

#include <math.h>
#include <stdio.h>
#include <time.h>


void c_compare_sin()
{
	printf("[C]\n");
	printf("sin(PI) = %g\n", sin(M_PI));
	printf("sin(PI / 2) = %g\n", sin(M_PI / 2));
	printf("sin(3.14) = %g\n", sin(3.14));
	printf("sin(3.141596) = %g\n\n\n", sin(3.141596));
}

void asm_compare_sin()
{
	printf("Assembly\n");
	double div = 0;

	double res = 0.0;
	double arg = 0.0;
	__asm__(
	"\n\t fldpi"
	"\n\t fsin"
	"\n\t fstp %0"
	: "=mam"(res)
	);
	printf("sin(pi) = %g\n", res);

	res = 0;
	div = 2.0;

	__asm__(
	"\n\t fldpi"
	"\n\t fld %1"
	"\n\t fdivp"
	"\n\t fsin"
	"\n\t fstp %0"
	: "=m"(res) : "m"(div)
	);
	printf("sin(pi / 2) = %g\n", res);

	arg = 3.14;
	__asm__(
	"\n\t fld %1"
	"\n\t fsin"
	"\n\t fstp %0" : "=m" (res)  : "m" (arg)
	);
	printf("sin(3.14) = %g\n", res);

	arg = 3.141596;
	__asm__(
	"\n\t fld %1"
	"\n\t fsin"
	"\n\t fstp %0" : "=m" (res)  : "m" (arg)
	);
	printf("sin(3.141596) = %g\n", res);
}

#endif //INC_8_SINUS_H
