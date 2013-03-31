//
//  TouchLayer.m
//  AceOfTheDead
//
//  Created by torasike on 26.01.13.
//
//

#import "TouchLayer.h"

@implementation TouchLayer

-(id)init {
    self = [super init];
    if (self != nil) {
        CCSprite *background =[CCSprite spriteWithFile:@"menu-small_3gs.jpg"];
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [background setPosition:CGPointMake(screenSize.width*0.5, screenSize.height*0.5)];
        [self addChild:background];
        [self displayTouchMenu];
        
    }
    return self;
}

-(void)playScene:(CCMenuItemImage*)itemPassedIn {
    if ([itemPassedIn tag] == 1) {
        CCLOG(@"Tag 1 found, Scene 1");
        [[GameManager sharedGameManager] runSceneWithID:kMainMenuScene];
    } else {
        CCLOG(@"Tag was: %d", [itemPassedIn tag]);
        CCLOG(@"Placeholder for next chapters");
    }
}
-(void)displayTouchMenu {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    // Touch Menu
    
    CCMenuItemImage *playGameButton = [CCMenuItemImage
                                       itemFromNormalImage:@"button_continue.png"
                                       selectedImage:@"button_continue.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(playScene:)];
    [playGameButton setTag:1];
    
    touchToContinueMenu = [CCMenu menuWithItems:playGameButton,nil];
    
    [touchToContinueMenu alignItemsVerticallyWithPadding:
     screenSize.height * 0.059f];
    [touchToContinueMenu setPosition:CGPointMake(screenSize.width * 0.42f,screenSize.height * 0.25f)];
    [touchToContinueMenu setAnchorPoint:ccp(0, 0)];
    [touchToContinueMenu setScale:0.9];
    
    CCScaleTo *to1 = [CCScaleTo actionWithDuration:0.7 scaleX:1.1 scaleY:1.1];
    CCScaleTo *to0 = [CCScaleTo actionWithDuration:0.7 scaleX:0.9 scaleY:0.9];
    CCSequence *seq = [CCSequence actions:to1, to0, nil];
    CCRepeatForever *repeatSeq = [CCRepeatForever actionWithAction:seq];
    [touchToContinueMenu runAction:repeatSeq];
    
    CCSprite * logoImage = [CCSprite spriteWithFile:@"logo.png"];
    [logoImage setPosition:(CGPointMake(screenSize.width * 0.28f,screenSize.height * 0.75f))];
    /*[logoImage setScaleX:(0.1)];
    [logoImage setScaleY:(0.1)];
    [logoImage runAction:[CCScaleTo actionWithDuration:1.2 scaleX:1.0 scaleY:1.0]];*/
    
    [self addChild:logoImage z:0];
    [self addChild:touchToContinueMenu z:0 tag:kMainMenuTagValue];
}



@end
