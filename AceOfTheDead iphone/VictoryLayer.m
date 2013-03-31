//
//  VictoryLayer.m
//  AceOfTheDead
//
//  Created by torasike on 28.01.13.
//
//

#import "VictoryLayer.h"

@implementation VictoryLayer

-(id)init {
    self = [super init];
    if (self != nil) {
        CCSprite *background =[CCSprite spriteWithFile:@"backgroundWeen.jpg"];
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [background setPosition:CGPointMake(screenSize.width*0.5, screenSize.height*0.5)];
        [self addChild:background];
        [self displayTouchMenu];
        
    }
    return self;
}

-(void)playScene:(CCMenuItemImage*)itemPassedIn {
    if ([itemPassedIn tag] == 7) {
        CCLOG(@"Tag 1 found, Scene 1");
        [[GameManager sharedGameManager] runSceneWithID:kMainMenuScene];
    }
}
-(void)displayTouchMenu {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    // Touch Menu
    
    CCMenuItemImage *playGameButton = [CCMenuItemImage
                                       itemFromNormalImage:@"button_back.png"
                                       selectedImage:@"button_back.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(playScene:)];
    [playGameButton setTag:7];
    [playGameButton setPosition:CGPointMake(screenSize.width * 0.07f,screenSize.height * 0.11f)];
    [playGameButton setScale:0.6];
    CCScaleTo *to1 = [CCScaleTo actionWithDuration:0.7 scaleX:0.8 scaleY:0.8];
    CCScaleTo *to0 = [CCScaleTo actionWithDuration:0.7 scaleX:0.6 scaleY:0.6];
    CCSequence *seq = [CCSequence actions:to1, to0, nil];
    CCRepeatForever *repeatSeq = [CCRepeatForever actionWithAction:seq];
    [playGameButton runAction:repeatSeq];  
    
    
    victoryMenu = [CCMenu menuWithItems:playGameButton,nil];
    [victoryMenu setPosition:CGPointMake(0,0)];
    
    
    
    [self addChild:victoryMenu z:1 tag:kMainMenuTagValue];
}

@end
