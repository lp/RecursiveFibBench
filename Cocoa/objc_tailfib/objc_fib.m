#import <Foundation/Foundation.h>
#include "gmp.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
	NSUserDefaults *args = [NSUserDefaults standardUserDefaults];
    
	mpz_t n;
	mpz_init(n);
	mpz_fib_ui(n, [[NSNumber numberWithLongLong:[[args stringForKey:@"n"] longLongValue]] unsignedLongValue]);
	printf("%s\n", mpz_get_str(NULL, 0, n));
	
    [pool drain];
    return 0;
}
