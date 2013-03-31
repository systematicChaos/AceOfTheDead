//
//  ResultsLayer.m
//  AceOfTheDead
//
//  Created by torasike on 26.01.13.
//
//

#import "ResultsLayer.h"

@implementation ResultsLayer

-(id)init {
    self = [super init];
    if (self != nil) {
        CCSprite *background =[CCSprite spriteWithFile:@"backgroundLoose.jpg"];
        
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
    if ([itemPassedIn tag] == 2) {
        CCLOG(@"Tag 1 found, Scene 1");
        [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
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
    [playGameButton setPosition:CGPointMake(screenSize.width * 0.23f,screenSize.height * 0.47f)];
    [playGameButton setScale:0.6];
    CCScaleTo *to1 = [CCScaleTo actionWithDuration:0.7 scaleX:0.8 scaleY:0.8];
    CCScaleTo *to0 = [CCScaleTo actionWithDuration:0.7 scaleX:0.6 scaleY:0.6];
    CCSequence *seq = [CCSequence actions:to1, to0, nil];
    CCRepeatForever *repeatSeq = [CCRepeatForever actionWithAction:seq];
    [playGameButton runAction:repeatSeq];
    
    CCMenuItemImage *playGameButton2 = [CCMenuItemImage
                                       itemFromNormalImage:@"button_continue.png"
                                       selectedImage:@"button_continue.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(playScene:)];
    [playGameButton2 setTag:2];
    [playGameButton2 setPosition:CGPointMake(screenSize.width * 0.80f,screenSize.height * 0.47f)];
    [playGameButton2 setScale:0.6];
    CCScaleTo *to2 = [CCScaleTo actionWithDuration:0.7 scaleX:0.8 scaleY:0.8];
    CCScaleTo *to3 = [CCScaleTo actionWithDuration:0.7 scaleX:0.6 scaleY:0.6];
    CCSequence *seq2 = [CCSequence actions:to2, to3, nil];
    CCRepeatForever *repeatSeq2 = [CCRepeatForever actionWithAction:seq2];
    [playGameButton2 runAction:repeatSeq2];   
    
    
    resultsMenu = [CCMenu menuWithItems:playGameButton,playGameButton2,nil];
    [resultsMenu setPosition:CGPointMake(0,0)];

    
    
    [self addChild:resultsMenu z:1 tag:kMainMenuTagValue];
}

@end
