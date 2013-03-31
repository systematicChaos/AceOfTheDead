//
//  TheItem.m
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/11/13.
//
//

#import "TheItem.h"

@implementation TheItem
@synthesize delegate;
    -(id)init
    {
        self = [super init];
        if (self != nil)
        {
            [_delegate bibi];
        }
        return self;
    }

-(void)tryDelegate
{
    [delegate bibi];
}

@end
