//
//  FoodLayer.m
//  ZombieThief
//
//  Created by look at me on 12/21/12.
//
//

#import "FoodLayer.h"

@implementation FoodLayer
-(id) init
{
    self = [super init];
    if (self != nil)
    {
        CCSprite *foodImage;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            foodImage = [CCSprite spriteWithFile:@"level2BGIphone.png"];
        }
        else
        {
            foodImage = [CCSprite spriteWithFile:@"level2BGIphone.png"];
            //backgroundImage = [CCSprite spriteWithFile:@"zombie1.png"];
        }
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        [foodImage setPosition:CGPointMake(screenSize.width*0.5, screenSize.height*0.5)];
        
        [self addChild:foodImage z:0 tag:0];
    }
    return self;
    
    
}
@end
