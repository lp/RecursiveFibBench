/*
 *  fibonacci.c
 *  objc_fib
 *
 *  Created by Louis-Philippe on 10-09-16.
 *  Copyright 2010 Modul. All rights reserved.
 *
 */

#import "fibonacci.h"

//NSString* fib(int num)
//{
//	mpz_t n, a, b;
//	mpz_init_set_si(n, num);
//	mpz_init_set_ui(a, 0);
//	mpz_init_set_ui(b, 1);
//	
//	return [NSString stringWithUTF8String:mpz_get_str(NULL, 0, tailfib(n, a, b))];
//}
//
//mpz_t tailfib(mpz_t n, mpz_t a, mpz_t b)
//{
//	if (mpz_cmp_ui(n,0) == 0) {
//		return a;
//	} else {
//		mpz_t ln, lab;
//		mpz_sub_ui(ln, n, 1);
//		mpz_add(lab, a, b);
//		return tailfib(ln, b, lab);
//	}
//}