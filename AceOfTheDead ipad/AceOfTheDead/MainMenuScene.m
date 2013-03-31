//
//  MenuLayer.m
//  ZombieThief
//
//  Created by Dmitry Kobeliatsky on 11/8/12.
//
//

#import "MainMenuScene.h"



@implementation MainMenuScene

   
-(id)init {
    self = [super init];
    if (self != nil) {
        mainMenuLayer = [MainMenuLayer node];
        [self addChild:mainMenuLayer];
    }
    return self;
}

@end
