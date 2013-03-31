//
//  BacgroundLayer.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/16/12.
//
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer
-(id) init
{
    self = [super init];
    if (self != nil)
    {
        CCSprite *backgroundImage;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            backgroundImage = [CCSprite spriteWithFile:@"level2BGIpad.png"];
        }
        else
        {
            backgroundImage = [CCSprite spriteWithFile:@"level02_1_480.jpg"];
            //backgroundImage = [CCSprite spriteWithFile:@"zombie1.png"];
        }
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        [backgroundImage setPosition:CGPointMake(screenSize.width*0.5, screenSize.height*0.5)];
        
        [self addChild:backgroundImage z:0 tag:0];
    }
    return self;
    
    
}
@end
