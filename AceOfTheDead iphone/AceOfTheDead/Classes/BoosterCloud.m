//
//  BoosterCloud.m
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/15/13.
//
//

#import "BoosterCloud.h"

@implementation BoosterCloud

@synthesize animBoosterCloud;

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        [self setAnimBoosterCloud:[[self loadPlistForAnimationWithName:
                                    @"boosterCloud" andClassName:@"boosterCloud"
                                                          andDirection:@"default"] objectForKey: LABEL_ANIMATION] ];

            }
    
    
    return self;
}

-(void) showCloudAnimation
{
    id action = nil;
    action = [CCAnimate actionWithAnimation:animBoosterCloud
                       restoreOriginalFrame:NO];
    
    action = [CCRepeat actionWithAction:action times:1];
//    [self runAction:action];

}

@end
