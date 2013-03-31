//
//  TheMenu.m
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/11/13.
//
//

#import "TheMenu.h"

@implementation TheMenu 

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        TheItem *item = [[TheItem alloc ]init];
        [item setDelegate:self];
        [item tryDelegate];
    }
    return self;
}

-(void) bibi
    {
        CCLOG(@"bibibi");
    }

@end
