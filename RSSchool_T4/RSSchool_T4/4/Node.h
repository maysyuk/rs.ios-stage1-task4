#import <Foundation/Foundation.h>

@interface Node : NSObject

@property int num;
@property Node *left;
@property Node *right;

- (id)initWithValue:(int)value;

@end
