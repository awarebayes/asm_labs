//
// Created by dev on 4/30/22.
//

#ifndef INC_8_LDOUBLE_H
#define INC_8_LDOUBLE_H

long double ldadd(long double a, long double b)
{
	return a+b;
}

long double my_ldadd(long double a, long double b)
{
	long double result;
	asm volatile (
	"fld %1\n\t"
	"fld %2\n\t"
	"faddp \n\t"
	"fstp %0\n\t"
	""
	: "=m" (result)
	: "m"(a), "m"(b)) ;

	return result;
}

long double ldmul(long double a, long double b)
{
	return a*b;
}


long double my_ldmul(long double a, long double b)
{
	long double result;
	asm volatile (
	"fld %1\n\t"
	"fld %2\n\t"
	"fmulp\n\t"
	"fstp %0\n\t"
	""
	: "=m" (result)
	: "m"(a), "m"(b)) ;

	return result;
}

#endif //INC_8_LDOUBLE_H
