#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    // leave only numbers
    NSMutableArray<NSNumber *> *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i++) {
        if ([array[i] isKindOfClass:[NSNumber class]]) {
            [arr addObject: array[i]];
        }
    }
    
    if ([arr count] == 0) {
        return 0;
    }

    if (numberOfItems > [arr count]) {
        numberOfItems = [arr count];
    }
    
    int maxProduct = INT_MIN;
    for (int row = 0; row < pow(2, [arr count]); row++) {
        int tmpProduct = 1;
        BOOL flag = false;

        for (int i = 0; i < [arr count]; i++) {
            int maska = 1 << i;
            if ((row & maska) > 0 && [self bitCount: row] == numberOfItems) {
                tmpProduct *= arr[i].intValue;
                flag = true;
            }
        }

        if (flag && tmpProduct > maxProduct) {
            maxProduct = tmpProduct;
        }
    }
    
    return maxProduct;
}

+ (int)bitCount: (int) n {
    unsigned int count = 0;

    while (n) {
        n &= (n - 1);
        count++;
    }

    return count;
}
@end
