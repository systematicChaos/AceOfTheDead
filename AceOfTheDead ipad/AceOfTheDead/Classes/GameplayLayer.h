//
//  GameplayLayer.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/16/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "CommonProtocols.h"
#import "HealthBar.h"
#import "Zombie.h"
#import "Willie.h"
#import "Health.h"
@interface GameplayLayer : CCLayer <GameplayLayerDelegate> {
    Zombie *zombie;
    Health *food;
    Willie *willie;
    CCSpriteBatchNode *sceneSpriteBatchNode;
    CCArray *arrPathHolder;
    CGPoint *prevPosition;
}

@property (nonatomic, retain) HealthBar *healthBar;

-(void)updateHealthBarWithValue:(int)valueToUpdate;
@end

