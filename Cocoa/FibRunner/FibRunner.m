//
//  FibRunner.m
//  FibRunner
//
//  Created by Louis-Philippe on 10-09-16.
//  Copyright 2010 Modul. All rights reserved.
//

#import "FibRunner.h"

@implementation FibRunner

+ (NSNumber*)fib:(NSNumber*)n
{
	return [NSNumber numberWithUnsignedInt:fib([n unsignedIntValue])];
}

unsigned int fib(unsigned int n)
{
	return n < 2 ? n : fib(n-1) + fib(n-2);
}

@end
