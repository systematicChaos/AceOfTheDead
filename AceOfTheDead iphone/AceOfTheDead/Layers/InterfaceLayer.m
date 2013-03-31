//
//  InterfaceLayer.m
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/10/13.
//
//

#import "InterfaceLayer.h"

@implementation InterfaceLayer

-(id)init
{
    self = [super init];
    if (self != nil)
    {
        self.isTouchEnabled = YES;
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        boosterIconBG = [CCSprite spriteWithFile:@"booster_bar_small.png"];
        boosterIconBG.position = ccp((screenSize.width - boosterIconBG.contentSize.width*0.5),
                                   (screenSize.height - boosterIconBG.contentSize.height*0.5));

        boosterIcon = [CCSprite spriteWithFile:@"moustache32.png"];
        boosterIcon.position = ccp((screenSize.width - boosterIcon.contentSize.width*0.6),
                                   (screenSize.height - boosterIcon.contentSize.height*0.6));
        
        label = [CCLabelTTF labelWithString:@"0" fontName:@"Arial" fontSize:12];
        label.position=ccp((screenSize.width - 28),
                           (screenSize.height - 10));

        label.color=ccc3(250, 250, 250);
        [label setString:@"3"];
        
        [self addChild:boosterIconBG];
        [self addChild:boosterIcon];
        [self addChild:label];
    }
    return self;
}

- (void)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    
    for (UITouch *touch in touches)
    {
        CGPoint touchLocation = [touch locationInView: [touch view]];
        touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];

//        CGPoint loc =touchLocation;
//        loc.position_.
    }
}
@end
