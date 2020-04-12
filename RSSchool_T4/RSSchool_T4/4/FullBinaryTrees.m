#import "FullBinaryTrees.h"
#include "Node.h"

@implementation FullBinaryTrees

static NSMutableDictionary *m = nil;
static NSMutableArray *queue = nil;

- (NSString *)stringForNodeCount:(NSInteger)count {

    if (count == 0) {
        return @"[]";
    }

    if (count == 1) {
        return @"[[0]]";
    }

    if (m == nil) {
        m = [[NSMutableDictionary alloc] init];
    }

    if (queue == nil) {
        queue = [[NSMutableArray alloc] init];
    }

    [self fullBinaryTree:count];

    NSMutableString *result = [[NSMutableString alloc] init];
    NSMutableArray<Node *> *nodes = [m objectForKey:@(count)];
    [result appendString:@"["];
    if (nodes != nil && [nodes count] > 0) {
        for (int i = 0; i < [nodes count]; i++) {
            [result appendString:[self print:nodes[i] forCount:count]];
            [result appendString:@","];
        }
        [result replaceCharactersInRange:NSMakeRange([result length] - 1, 1) withString:@"]"]; // replace ending , with ]
    } else {
        [result appendString:@"]"];
    }

    return result;
}

- (NSMutableArray *)fullBinaryTree:(int)count {
    if (count == 1) {
        NSMutableArray<Node *> *temp = [NSMutableArray arrayWithObject:[[Node alloc] initWithValue:0]];
        return temp;
    }
    if ([m objectForKey:@(count)]) {
        return [m objectForKey:@(count)];
    }

    NSMutableArray<Node *> *result = [[NSMutableArray alloc] init];
    int required = count - 1;
    for (int left = 1; left < required; left++) {
        int right = required - left;
        if (left == 2 || right == 2) continue;
        NSMutableArray<Node *> *leftArray = [self fullBinaryTree:left];
        NSMutableArray<Node *> *rightArray = [self fullBinaryTree:right];
        for (int j = 0; j < [leftArray count]; j++) {
            for (int k = 0; k < [rightArray count]; k++) {
                Node *root = [[Node alloc] initWithValue:0];
                root.left = leftArray[j];
                root.right = rightArray[k];
                [result addObject:root];
            }
        }
    }

    [m setObject:result forKey:@(count)];

    return result;
}

- (NSString *)print:(Node *)root forCount:(int)n {
    NSMutableString *result = [[NSMutableString alloc] init];
    [result appendString:@"["];

    [queue removeAllObjects];
    [queue addObject:root];

    while ([queue count] != 0 && n != 0) {
        Node *node = [queue objectAtIndex:0]; // poll
        [queue removeObjectAtIndex:0]; // remove right after poll

        if (node.num != -1) {
            [result appendString:[NSString stringWithFormat:@"%d", node.num]];
            [result appendString:@","];

            if (node.left == nil) {
                [queue addObject:[[Node alloc] initWithValue:-1]]; // push NULL
            } else {
                [queue addObject:node.left]; // push node
            }
            if (node.right == nil) {
                [queue addObject:[[Node alloc] initWithValue:-1]]; // push NULL
            } else {
                [queue addObject:node.right];
            }

            n--;
        } else {
            [result appendString:@"null,"];
        }
    }

    [result replaceCharactersInRange:NSMakeRange([result length] - 1, 1) withString:@"]"]; // replace ending , with ]

    return result;
}
@end
