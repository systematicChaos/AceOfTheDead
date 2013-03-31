//
//  Zombie.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/27/12.
//
//

#import <Foundation/Foundation.h>
#import "GameCharacter.h"
#import "GameManager.h"
#import "HealthBar.h"
#import "BoosterCloud.h"

#import <objc/runtime.h>

typedef enum {
    kLeftHook,
    kRightHook
} LastPunchType;
@interface Zombie: GameCharacter  {
    LastPunchType myLastPunch;
    BOOL isCarryingMallet;
    
    CCSpriteFrame *standingFrame;
    // Standing, breathing, and walking
    CCAnimation *breathingAnim;
    CCAnimation *breathingMalletAnim;
    CCAnimation *walkingAnim;
    CCAnimation *animWalkingUpUpUp;
    CCAnimation *animWalkingUpUpRight;
    CCAnimation *animWalkingUpRightRight;
    CCAnimation *animWalkingRightRightRight;
    CCAnimation *animWalkingDownRightRight;
    CCAnimation *animWalkingDownDownRight;
    CCAnimation *animWalkingDownDownDown;
    CCAnimation *animWalkingDownDownLeft;
    CCAnimation *animWalkingDownLeftLeft;
    CCAnimation *animWalkingLeftLeftLeft;
    CCAnimation *animWalkingUpLeftLeft;
    CCAnimation *animWalkingUpUpLeft;

    CCAnimation *animStandingUpUpUp;
    CCAnimation *animStandingUpUpRight;
    CCAnimation *animStandingUpRightRight;
    CCAnimation *animStandingRightRightRight;
    CCAnimation *animStandingDownRightRight;
    CCAnimation *animStandingDownDownRight;
    CCAnimation *animStandingDownDownDown;
    CCAnimation *animStandingDownDownLeft;
    CCAnimation *animStandingDownLeftLeft;
    CCAnimation *animStandingLeftLeftLeft;
    CCAnimation *animStandingUpLeftLeft;
    CCAnimation *animStandingUpUpLeft;
    
    CCAnimation *animFighting;
    
    CCAnimation *walkingMalletAnim;
    // Crouching, standing up, and Jumping
    CCAnimation *crouchingAnim;
    CCAnimation *crouchingMalletAnim;
    CCAnimation *standingUpAnim;
    CCAnimation *standingUpMalletAnim;
    CCAnimation *jumpingAnim;
    CCAnimation *jumpingMalletAnim;
    CCAnimation *afterJumpingAnim;
    CCAnimation *afterJumpingMalletAnim;
    // Punching
    CCAnimation *rightPunchAnim;
    CCAnimation *leftPunchAnim;
    CCAnimation *malletPunchAnim;
    // Taking Damage and Death
    CCAnimation *phaserShockAnim;
    CCAnimation *deathAnim;
    
    CCAnimation *animBoosterCloud;
   
    CCAnimation *currentActiveAnimation;
    
    CCSequence *smoothAnimationSequense;
    float millisecondsStayingIdle;
}
-(void)initAnimations;
-(void)initWalkingAnimation;
-(void)initFightingAnimation;
-(CCAnimation*)buildFramesForAnimationSmoothing: (CCSpriteFrame*)tmpSpriteFrame
                        betweenCurrentDirection: (CCAnimation*) currentDirection
                               andNextDirection: (NSString*) nextDirection;
-(void)useBoosterWithIcon:(CCSprite*) icon;
-(void)initStandingAnimation;
-(void)initBoosterCloudAnimation;

// Standing, Breathing, Walking
@property (nonatomic, retain) CCAnimation *breathingAnim;
@property (nonatomic, retain) CCAnimation *breathingMalletAnim;
@property (nonatomic, retain) CCAnimation *walkingAnim;
@property (nonatomic, retain) CCAnimation *animWalkingUpUpUp;
@property (nonatomic, retain) CCAnimation *animWalkingUpUpRight;
@property (nonatomic, retain) CCAnimation *animWalkingUpRightRight;
@property (nonatomic, retain) CCAnimation *animWalkingRightRightRight;
@property (nonatomic, retain) CCAnimation *animWalkingDownRightRight;
@property (nonatomic, retain) CCAnimation *animWalkingDownDownRight;
@property (nonatomic, retain) CCAnimation *animWalkingDownDownDown;
@property (nonatomic, retain) CCAnimation *animWalkingDownDownLeft;
@property (nonatomic, retain) CCAnimation *animWalkingDownLeftLeft;
@property (nonatomic, retain) CCAnimation *animWalkingLeftLeftLeft;
@property (nonatomic, retain) CCAnimation *animWalkingUpLeftLeft;
@property (nonatomic, retain) CCAnimation *animWalkingUpUpLeft;

@property (nonatomic, retain) CCAnimation *animStandingUpUpUp;
@property (nonatomic, retain) CCAnimation *animStandingUpUpRight;
@property (nonatomic, retain) CCAnimation *animStandingUpRightRight;
@property (nonatomic, retain) CCAnimation *animStandingRightRightRight;
@property (nonatomic, retain) CCAnimation *animStandingDownRightRight;
@property (nonatomic, retain) CCAnimation *animStandingDownDownRight;
@property (nonatomic, retain) CCAnimation *animStandingDownDownDown;
@property (nonatomic, retain) CCAnimation *animStandingDownDownLeft;
@property (nonatomic, retain) CCAnimation *animStandingDownLeftLeft;
@property (nonatomic, retain) CCAnimation *animStandingLeftLeftLeft;
@property (nonatomic, retain) CCAnimation *animStandingUpLeftLeft;
@property (nonatomic, retain) CCAnimation *animStandingUpUpLeft;

@property (nonatomic, retain) CCAnimation *animFighting;

@property (nonatomic, retain) CCAnimation *animBoosterCloud;

@property (nonatomic, retain) CCAnimation *walkingMalletAnim;
// Crouching, Standing Up, Jumping
@property (nonatomic, retain) CCAnimation *crouchingAnim;
@property (nonatomic, retain) CCAnimation *crouchingMalletAnim;
@property (nonatomic, retain) CCAnimation *standingUpAnim;
@property (nonatomic, retain) CCAnimation *standingUpMalletAnim;
@property (nonatomic, retain) CCAnimation *jumpingAnim;
@property (nonatomic, retain) CCAnimation *jumpingMalletAnim;
@property (nonatomic, retain) CCAnimation *afterJumpingAnim;
@property (nonatomic, retain) CCAnimation *afterJumpingMalletAnim;
// Punching
@property (nonatomic, retain) CCAnimation *rightPunchAnim;
@property (nonatomic, retain) CCAnimation *leftPunchAnim;
@property (nonatomic, retain) CCAnimation *malletPunchAnim;
// Taking Damage and Death
@property (nonatomic, retain) CCAnimation *phaserShockAnim;
@property (nonatomic, retain) CCAnimation *deathAnim;

@property (nonatomic, retain) CCAnimation *currentActiveAnimation;

@property (nonatomic, retain) CCSequence *smoothAnimationSequense;
@end