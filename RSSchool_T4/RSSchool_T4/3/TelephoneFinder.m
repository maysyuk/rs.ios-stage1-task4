#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {

    NSArray<NSString *> *validNumbers = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"0"];
    NSMutableArray *numbersNextTo = [[[NSMutableArray alloc] initWithCapacity:10] autorelease];
    [numbersNextTo insertObject:[[@[@"8"] mutableCopy] autorelease] atIndex:0];
    [numbersNextTo insertObject:[[@[@"2", @"4"] mutableCopy] autorelease] atIndex:1];
    [numbersNextTo insertObject:[[@[@"1", @"3", @"5"] mutableCopy] autorelease] atIndex:2];
    [numbersNextTo insertObject:[[@[@"2", @"6"] mutableCopy] autorelease] atIndex:3];
    [numbersNextTo insertObject:[[@[@"1", @"5", @"7"] mutableCopy] autorelease] atIndex:4];
    [numbersNextTo insertObject:[[@[@"2", @"4", @"6", @"8"] mutableCopy] autorelease] atIndex:5];
    [numbersNextTo insertObject:[[@[@"3", @"5", @"9"] mutableCopy] autorelease] atIndex:6];
    [numbersNextTo insertObject:[[@[@"4", @"8"] mutableCopy] autorelease] atIndex:7];
    [numbersNextTo insertObject:[[@[@"0", @"5", @"7", @"9"] mutableCopy] autorelease] atIndex:8];
    [numbersNextTo insertObject:[[@[@"6", @"8"] mutableCopy] autorelease] atIndex:9];

    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int i = 0; i < [number length]; i++) {
        unichar digit = [number characterAtIndex:i];
        NSString *d = [NSString stringWithFormat:@"%C", digit];
        if ([validNumbers containsObject:d]) {
            NSArray *neighbors = numbersNextTo[d.intValue];
            for (NSString *string in neighbors) {
                [result addObject:[number stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:string]];
            }
        } else {
            return nil;
        }

    }

    return [result autorelease];
}

@end
