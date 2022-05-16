//
// Created by dev on 4/30/22.
//

#ifndef INC_8_DOUBLE_H
#define INC_8_DOUBLE_H


double dadd(double a, double b)
{
	return a+b;
}

double my_dadd(double a, double b)
{
	double result;
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

double dmul(double a, double b)
{
	return a*b;
}


double my_dmul(double a, double b)
{
	double result;
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

#endif //INC_8_DOUBLE_H
