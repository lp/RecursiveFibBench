#import <Foundation/Foundation.h>
#include "fibonacci.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
	NSUserDefaults *args = [NSUserDefaults standardUserDefaults];
    
	for (unsigned int i = 0; i < [args integerForKey:@"n"]; i += 1) {
		printf("%d\n",fib(i));
	}
	
    [pool drain];
    return 0;
}
