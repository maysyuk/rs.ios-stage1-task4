#import <Foundation/Foundation.h>
#include "Node.h"

@implementation Node
 
- (instancetype)initWithValue:(int)value {
 
    self = [super init];
    if (self != nil) {
        self.num = value;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}
 
@end
