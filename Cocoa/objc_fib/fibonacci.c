/*
 *  fibonacci.c
 *  objc_fib
 *
 *  Created by Louis-Philippe on 10-09-16.
 *  Copyright 2010 Modul. All rights reserved.
 *
 */

#include "fibonacci.h"

unsigned int fib(unsigned int n)
{
	return n < 2 ? n : fib(n-1) + fib(n-2);
}