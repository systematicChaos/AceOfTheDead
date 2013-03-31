//
//  GameScene.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/16/12.
//
//

#import "GameScene.h"

@implementation GameScene
-(id)init{
    self = [super init];
    if (self != nil)
    {
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild: backgroundLayer z:0];
        
        GameplayLayer *gameplaLayer = [GameplayLayer node];
        [self addChild: gameplaLayer z:5];
        
        
        
        GameplayerMenuLayer *gameplayMenuLayer = [GameplayerMenuLayer node];
     //   [self addChild: gameplayMenuLayer z:8];
    }
    return self;
}
@end
