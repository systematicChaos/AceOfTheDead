//
//  Willie.m
//  ZombieThief
//
//  Created by look at me on 12/20/12.
//
//

#import "Willie.h"



@implementation Willie

//@synthesize walkingAnim;
@synthesize transmittingAnim;

@synthesize animWalkingUpUpUp;
@synthesize animWalkingUpUpRight;
@synthesize animWalkingUpRightRight;
@synthesize animWalkingRightRightRight;
@synthesize animWalkingDownRightRight;
@synthesize animWalkingDownDownRight;
@synthesize animWalkingDownDownDown;
@synthesize animWalkingDownDownLeft;
@synthesize animWalkingDownLeftLeft;
@synthesize animWalkingLeftLeftLeft;
@synthesize animWalkingUpLeftLeft;
@synthesize animWalkingUpUpLeft;


- (void) dealloc{
    //    [walkingAnim release];
    //    [transmittingAnim release];
    //    [takingAHitAnim release];
    //    [blowingUpAnim release];
    [super dealloc];
}

-(void)changeState:(CharacterStates)newState {
    [self stopAllActions];
    id action = nil;
    [self setCharacterState:newState];
    switch (newState) {
        case kStateWalking:
            action = [CCAnimate actionWithAnimation:animWalkingDownDownDown// walkingAnim
                               restoreOriginalFrame:NO];
            action = [CCRepeatForever actionWithAction:action];
            break;
            
        case kStateSpawning:
            CCLOG(@"Willie->Starting the Spawning Animation");
            //  action = [CCAnimate actionWithAnimation:walkingAnim
            //                    restoreOriginalFrame:NO];
            break;
        case kStateIdle:
            CCLOG(@"Willie->Changing State to Idle");
            //            action = [CCAnimate actionWithAnimation:transmittingAnim
            //                               restoreOriginalFrame:NO];
            break;
        case kStateDead:
            CCLOG(@"Willie->Changing State to Dead");
            //            action = [CCAnimate actionWithAnimation:blowingUpAnim
            //                               restoreOriginalFrame:NO];
            break;
        default:
            CCLOG(@"Unhandled state %d in RadarDish", newState);
            break;
    }
    if (action != nil) {
        [action setTag:2];
        [self runAction:action];
    }
}

-(CGRect)AdjustedBoundingBox {
    // Shrink the bounding box by 18% on the X axis, and move it to the
    // right by 18% and crop it by 5% on the Y Axis.
    // On the iPad this is 30 pixels on the X axis and
    // 10 pixels from the top (Y Axis)
    CGRect enemyRobotBoundingBox = [self boundingBox];
    float xOffsetAmount = enemyRobotBoundingBox.size.width * 0.18f;
    float yCropAmount = enemyRobotBoundingBox.size.height * 0.05f;
    enemyRobotBoundingBox =
    CGRectMake(enemyRobotBoundingBox.origin.x + xOffsetAmount,
               enemyRobotBoundingBox.origin.y,
               enemyRobotBoundingBox.size.width - xOffsetAmount,
               enemyRobotBoundingBox.size.height - yCropAmount);
    return enemyRobotBoundingBox;
}

-(CGRect)eyesightBoundingBox {
    // Eyesight is 3 robot widths in the direction the robot is facing.
    CGRect robotSightBoundingBox;
    CGRect robotBoundingBox = [self adjustedBoundingBox];
    if ([self flipX]) {
        robotSightBoundingBox = CGRectMake(robotBoundingBox.origin.x,
                                           robotBoundingBox.origin.y,
                                           robotBoundingBox.size.width*3.0f,
                                           robotBoundingBox.size.height);
    } else {
        robotSightBoundingBox =
        CGRectMake(robotBoundingBox.origin.x -
                   (robotBoundingBox.size.width*2.0f),
                   robotBoundingBox.origin.y,
                   robotBoundingBox.size.width*3.0f,
                   robotBoundingBox.size.height);
    }
    return robotSightBoundingBox;
}

-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObjects {
    [self checkAndClampSpritePosition];
    if ((characterState != kStateDead) && (characterHealth <= 0)) {
        [self changeState:kStateDead];
        return;
    }
    zombieCharacter = (GameCharacter*)[[self parent]
                                       getChildByTag:kZombieSpriteTagValue];
    CGRect zombieBoundingBox = [zombieCharacter adjustedBoundingBox];
    CGRect willieBoundingBox = [self adjustedBoundingBox];
    CGRect willieSightBoundingBox = [self eyesightBoundingBox];
    if (CGRectIntersectsRect(zombieBoundingBox, willieBoundingBox))
    {
        isZombieWithinBoundingBox = YES ;
    }
    else
    {
        isZombieWithinBoundingBox = NO ;
    }
    
    if ( CGRectIntersectsRect(zombieBoundingBox, willieSightBoundingBox))
    {
        isZombieWithinSight = YES;
    }
    else
    {
        isZombieWithinSight = NO;
    }
    
    if ((isZombieWithinBoundingBox) &&
        ([zombieCharacter characterState] == kStateFighting))
    {
        return; // Nothing to update further, stop and show damage
    }
    
    //    if ([self numberOfRunningActions] == 0) {
    //        if (characterState == kStateDead) {
    //            // Robot is dead, remove
    //            [self setVisible:NO];
    //            [self removeFromParentAndCleanup:YES];
    //        } else if ([vikingCharacter characterState] == kStateDead) {
    //            // Viking is dead, walk around the scene
    //            [self changeState:kStateWalking];
    //        } else if (isVikingWithinSight) {
    //            [self changeState:kStateAttacking];
    //        }  else {
    //            // Viking alive and out of sight, resume walking
    //            [self changeState:kStateWalking];
    //        }
    //    }
}


-(void)changeDirection:(NSString*)newDirection
{
    CCLOG(@"Willie::CchangeDirection::numberOfRunning actions on start: %i", [self numberOfRunningActions]);
    id action = nil;
    
    if ([self characterDirection] == newDirection)
    {
        return;
    }
    [self setCharacterDirection:newDirection];
    if(newDirection == ksDirectionDownDownDown)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownDownDown
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection == ksDirectionDownDownRight) {
        action = [CCAnimate actionWithAnimation:animWalkingDownDownRight// walkingAnim
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionDownRightRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownRightRight// walkingAnim
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionDownDownLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownDownLeft// walkingAnim
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionDownLeftLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownLeftLeft// walkingAnim
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionRightRightRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingRightRightRight// walkingAnim
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionLeftLeftLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingLeftLeftLeft
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionUpLeftLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpLeftLeft
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionUpUpLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpUpLeft
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionUpUpUp)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpUpUp
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionUpUpRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpUpRight
                           restoreOriginalFrame:NO];
        action = [CCRepeatForever actionWithAction:action];
    }
    else if (newDirection ==  ksDirectionUpRightRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpRightRight
                           restoreOriginalFrame:NO];
        
        action = [CCRepeatForever  actionWithAction:action];
    }
    
    if (action != nil)
    {
        if ([self getActionByTag:2])
        {
            [self stopActionByTag:2];
        }
        
        [action setTag:2];
        
        CCLOG(@"Willie::CchangeDirection::numberOfRunning actions on before running action: %i", [self numberOfRunningActions]);
        [self runAction:action];
        
        CCLOG(@"Willie::CchangeDirection::numberOfRunning actions on after running action: %i", [self numberOfRunningActions]);
    }
}

-(void)initWalkingAnimation
{
    [self setAnimWalkingUpUpUp:[self loadPlistForAnimationWithName:
                                @"walk" andClassName:kWillieWalkClassName
                                                      andDirection:ksDirectionUpUpUp]];
    [self setAnimWalkingLeftLeftLeft:[self loadPlistForAnimationWithName:
                                      @"walk" andClassName:kWillieWalkClassName
                                                            andDirection:ksDirectionLeftLeftLeft]];
    [self setAnimWalkingRightRightRight:[self loadPlistForAnimationWithName:
                                         @"walk" andClassName:kWillieWalkClassName
                                                               andDirection:ksDirectionRightRightRight]];
    [self setAnimWalkingDownDownDown:[self loadPlistForAnimationWithName:
                                      @"walk" andClassName:kWillieWalkClassName
                                                            andDirection:ksDirectionDownDownDown]];
    
    [self setAnimWalkingUpUpRight:[self loadPlistForAnimationWithName:
                                   @"walk" andClassName:@"zombieWalk"
                                                         andDirection:ksDirectionUpUpRight]];
    [self setAnimWalkingUpRightRight:[self loadPlistForAnimationWithName:
                                      @"walk" andClassName:kWillieWalkClassName
                                                            andDirection:ksDirectionUpRightRight]];
    [self setAnimWalkingUpUpLeft:[self loadPlistForAnimationWithName:
                                  @"walk" andClassName:@"zombieWalk"
                                                        andDirection:ksDirectionUpUpLeft]];
    [self setAnimWalkingUpLeftLeft:[self loadPlistForAnimationWithName:
                                    @"walk" andClassName:kWillieWalkClassName
                                                          andDirection:ksDirectionUpLeftLeft]];
    
    [self setAnimWalkingDownDownRight:[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                                             andDirection:ksDirectionDownDownRight]];
    [self setAnimWalkingDownRightRight:[self loadPlistForAnimationWithName:
                                        @"walk" andClassName:kWillieWalkClassName
                                                              andDirection:ksDirectionDownRightRight]];
    [self setAnimWalkingDownDownLeft:[self loadPlistForAnimationWithName:
                                      @"walk" andClassName:@"zombieWalk"
                                                            andDirection:ksDirectionDownDownLeft]];
    [self setAnimWalkingDownLeftLeft:[self loadPlistForAnimationWithName:
                                      @"walk" andClassName:kWillieWalkClassName
                                                            andDirection:ksDirectionDownLeftLeft]];
}

#pragma mark -
-(void)initAnimations
{
    [self initWalkingAnimation];
}


#pragma mark -
-(id) init {
    if( (self=[super init]) ) {
        self.gameObjectType = kEnemyTypeWillie;
        millisecondsStayingIdle = 0.0f;
        [self initAnimations];
        [self changeState:kStateWalking];
    }
    return self;
}

@end
