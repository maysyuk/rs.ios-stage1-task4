#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    NSMutableArray<NSNumber *> *result = [NSMutableArray arrayWithObject: number];
    
    long goal = 0;

    while ([result count] != 0) {
        long current = [result lastObject].longValue;
        [result removeLastObject];
        goal += pow(current, 2);

        for (long i = current - 1; i > 0; i--) {
            if (goal - (pow(i, 2)) >= 0) {
                goal -= pow(i, 2);
                [result addObject: @(i)];
                if (goal == 0) {
                    return [result sortedArrayUsingSelector: @selector(compare:)];
                }
            }
        }

    }
    
    return nil;
}
@end
