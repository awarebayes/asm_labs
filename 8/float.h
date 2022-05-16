#ifndef __FLOAT__H_
#define __FLOAT__H_



float fadd(float a, float b)
{
    return a+b;
}

float my_fadd(float a, float b)
{
    float result;
    asm volatile (
        "flds %1\n\t"
        "flds %2\n\t"
        "faddp \n\t"
        "fstps %0\n\t"
        ""
        : "=m" (result)
        : "m"(a), "m"(b)) ;

    return result;
}

float fmul(float a, float b)
{
    return a*b;
}


float my_fmul(float a, float b)
{
    float result;
    asm volatile (
        "flds %1\n\t"
        "flds %2\n\t"
        "fmulp\n\t"
        "fstps %0\n\t"
        ""
        : "=m" (result)
        : "m"(a), "m"(b)) ;

    return result;
}


#endif