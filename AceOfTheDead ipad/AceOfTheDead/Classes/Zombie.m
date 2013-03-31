//
//  Zombie.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/27/12.
//
//

#import "Zombie.h"

@implementation Zombie


// Standing, Breathing, Walking
@synthesize breathingAnim;
@synthesize breathingMalletAnim;
@synthesize walkingAnim;
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

@synthesize animFighting;

@synthesize walkingMalletAnim;
// Crouching, Standing Up, Jumping
@synthesize crouchingAnim;
@synthesize crouchingMalletAnim;
@synthesize standingUpAnim;
@synthesize standingUpMalletAnim;
@synthesize jumpingAnim;
@synthesize jumpingMalletAnim;
@synthesize afterJumpingAnim;
@synthesize afterJumpingMalletAnim;
// Punching
@synthesize rightPunchAnim;
@synthesize leftPunchAnim;
@synthesize malletPunchAnim;
// Taking Damage and Death
@synthesize phaserShockAnim;
@synthesize deathAnim;

@synthesize currentActiveAnimation;

@synthesize smoothAnimationSequense;

- (void) dealloc {
    [breathingAnim release];
    [animFighting release];
    [breathingMalletAnim release];
    [walkingAnim release];
    [walkingMalletAnim release];
    [crouchingAnim release];
    [crouchingMalletAnim release];
    [standingUpAnim release];
    [standingUpMalletAnim release];
    [jumpingAnim release];
    [jumpingMalletAnim release];
    [afterJumpingAnim release];
    [afterJumpingMalletAnim release];
    [rightPunchAnim release];
    [leftPunchAnim release];
    [malletPunchAnim release];
    [phaserShockAnim release];
    [deathAnim release];
    [super dealloc];
}

-(void)checkAndClampSpritePosition
{
    [super checkAndClampSpritePosition];
}

-(void)changeDirection:(NSString*)newDirection
{
//    CCLOG(@"Zombie::CchangeDirection::numberOfRunning actions on start: %i", [self numberOfRunningActions]);
    id action = nil;
    id smoothAction = nil;
    CCAnimation *tmpPreviousAnimation = nil;
    
    if ([self characterDirection] == newDirection)
    {
        return;
    }
    
    if ([self getActionByTag:2] || [self getActionByTag:4])
    {
        tmpPreviousAnimation = [[CCAnimation alloc] initWithFrames:[currentActiveAnimation frames]
                               delayPerUnit:[currentActiveAnimation delayPerUnit]];
    }
    
    [self setCharacterDirection:newDirection];
    
    if(newDirection == ksDirectionDownDownDown)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownDownDown
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingDownDownDown];
    }
    else if (newDirection == ksDirectionDownDownRight) {
        action = [CCAnimate actionWithAnimation:animWalkingDownDownRight
                           restoreOriginalFrame:NO];
        
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingDownDownRight];
    }
    else if (newDirection ==  ksDirectionDownRightRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownRightRight
                               restoreOriginalFrame:NO];
        
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingDownRightRight];
    }
    else if (newDirection ==  ksDirectionDownDownLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownDownLeft
                               restoreOriginalFrame:NO];
        
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingDownDownLeft];
    }
    else if (newDirection ==  ksDirectionDownLeftLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingDownLeftLeft
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingDownLeftLeft];
    }
    else if (newDirection ==  ksDirectionRightRightRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingRightRightRight
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingRightRightRight];
    }
    else if (newDirection ==  ksDirectionLeftLeftLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingLeftLeftLeft
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingLeftLeftLeft];
    }
    else if (newDirection ==  ksDirectionUpLeftLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpLeftLeft
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingUpLeftLeft];
    }
    else if (newDirection ==  ksDirectionUpUpLeft)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpUpLeft
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingUpUpLeft];
    }
    else if (newDirection ==  ksDirectionUpUpUp)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpUpUp
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingUpUpUp];
    }
    else if (newDirection ==  ksDirectionUpUpRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpUpRight
                               restoreOriginalFrame:NO];
        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingUpUpRight];
    }
    else if (newDirection ==  ksDirectionUpRightRight)
    {
        action = [CCAnimate actionWithAnimation:animWalkingUpRightRight
                               restoreOriginalFrame:NO];

        action = [CCRepeat actionWithAction:action times:3];
        
        [self setCurrentActiveAnimation : animWalkingUpRightRight];
    }
    
    if (action != nil) {

        if ([self getActionByTag:2])
        {
            [self stopActionByTag:2];
        }
        
        if ([self getActionByTag:3])
        {
//            [self stopActionByTag:3];
        }
        
        if ([self getActionByTag:4])
        {
            [self stopActionByTag:4];
        }
//        CCLOG(@"Zombie::CchangeDirection::numberOfRunning actions on before running action: %i", [self numberOfRunningActions]);
        if (currentActiveAnimation != nil && self.numberOfRunningActions >= 1)
        {
            smoothAction = [self buildFramesForAnimationSmoothing: [self displayedFrame]
                                          betweenCurrentDirection: tmpPreviousAnimation
                                                 andNextDirection: newDirection];
        }
        
        if (smoothAction != nil)
        {
            smoothAction = [CCAnimate actionWithAnimation:smoothAction
                                     restoreOriginalFrame:NO];
            
            [smoothAction setTag:3];
        }

        [action setTag:2];
        currentAnimationAction = action;

        
        
        
//        CCLOG(@"Zombie::CchangeDirection::numberOfRunning actions on before running action: %i", [self numberOfRunningActions]);
        if (smoothAction == nil)
        {
            [self runAction:action];
        }
        else
        {
            smoothAnimationSequense = [CCSequence actions:smoothAction, action, nil];
            
            [smoothAnimationSequense setTag:4];
            
            [self runAction:smoothAnimationSequense];
        }

        

//        CCLOG(@"Zombie::CchangeDirection::numberOfRunning actions on after running action: %i", [self numberOfRunningActions]);
    }
}

#pragma mark -
-(void)changeState:(CharacterStates)newState
{
    
    id action = nil;
    [self setCharacterState:newState];
    switch (newState) {
        case kStateIdle:
           // [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]
             //                      spriteFrameByName:@"zombieWalkDown01.png"]];
            break;
        case kStateWalking:
            action = [CCAnimate actionWithAnimation:animWalkingDownDownDown// walkingAnim
                               restoreOriginalFrame:NO];
            
//            [self setCurrentActiveAnimation : animWalkingDownDownDown];
            
            action = [CCRepeat actionWithAction:action times:3];
            break;
        case kStateFighting:
            action = [CCAnimate actionWithAnimation:animFighting
                               restoreOriginalFrame:NO];
            action = [CCRepeat actionWithAction:action times:3];
            
            [self schedule:@selector(timerUpdate:) interval:2];
            break;
        case kStateStanding:
            [self stopActionByTag:2];
            [self stopActionByTag:1];
            break;
        case kStateBreathing:
            action = [CCAnimate actionWithAnimation:walkingAnim
                               restoreOriginalFrame:NO];
            break;
        case kStateSpawning:
            action = [CCAnimate actionWithAnimation:walkingAnim
                               restoreOriginalFrame:NO];
            break;
        case kStateScared:
            action = [CCAnimate actionWithAnimation:walkingAnim
                               restoreOriginalFrame:NO];
            break;
        case kStateDancing:
            action = [CCAnimate actionWithAnimation:walkingAnim
                               restoreOriginalFrame:NO];
            break;
        case kStateDead:
            action = [CCAnimate actionWithAnimation:walkingAnim
                               restoreOriginalFrame:NO];
            break;
        default:
            break;
    }
    if (action != nil) {
        [action setTag:2];
        currentAnimationAction = action;
        [self runAction:action];
    }
}

-(void) timerUpdate:(ccTime)delta
{
    [self unschedule:@selector(timerUpdate:)];
    [[GameManager sharedGameManager] runSceneWithID:kResultsScene];
}

#pragma mark -
-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObjects {
    
//    CCLOG(@"Zombie::updateStateWithDeltaTime::x %f", self.position.x);
//        CCLOG(@"Zombie::updateStateWithDeltaTime::y %f", self.position.y);

    if (self.position.x > 428 && self.position.y > 218)
    {
            [[GameManager sharedGameManager] runSceneWithID:kVictoryScene];
    }
    if (self.characterState == kStateDead)
        return; // Nothing to do if the Zombie is dead
    
    CGRect myBoundingBox = [self adjustedBoundingBox];

    for (GameCharacter *character in listOfGameObjects)
    {
        // This is Ole the Zombie himself
        // No need to check collision with one's self
        if ([character tag] == kZombieSpriteTagValue)
            continue;
        
        
        
        CGRect characterBox = [character adjustedBoundingBox];
        
        if (CGRectIntersectsRect(myBoundingBox, characterBox))
        {
         
            // Remove the PhaserBullet from the scene
            if ([character gameObjectType] == kEnemyTypeWillie)
            {
                                [[character parent] removeChild:character cleanup:NO];
                [self stopAllActions];
                [self changeState: kStateFighting];
                //[self changeState:kStateScared];
//                [character changeState:kStateScared];
            }
            else if ([character gameObjectType] == kPowerUpTypeHealth)
            {
                [[character parent] removeChild:character cleanup:NO];
                [self setCharacterHealth:100.0f];
                [delegate updateHealthBarWithValue:100];
                
                for (GameCharacter *character in listOfGameObjects)
                {
                    if ([character isKindOfClass:[HealthBar class]])
                    {
                        [character updateHealthBarWithHealthValue:100];
                    }
                }
                // Remove the health power-up from the scene
//                [character changeState:kStateDead];
            }
            
            if ([self numberOfRunningActions] == 0)
            {
                // Not playing an animation
                if (self.characterHealth <= 0.0f)
                {
                    [self changeState:kStateDead];
                }
                else if (self.characterState == kStateIdle)
                {
                    millisecondsStayingIdle = millisecondsStayingIdle + deltaTime;
                    if (millisecondsStayingIdle > kZombieIdleTimer)
                    {
                        [self changeState:kStateBreathing];
                    }
                }
            }
        }
    }
}

#pragma mark -
-(CGRect)adjustedBoundingBox {
    // Adjust the bouding box to the size of the sprite
    // without the transparent space
    CGRect zombieBoundingBox = [self boundingBox];
    float xOffset;
    float xCropAmount = zombieBoundingBox.size.width * 0.5482f;
    float yCropAmount = zombieBoundingBox.size.height * 0.095f;
    if ([self flipX] == NO) {
        //  is facing to the rigth, back is on the left
        xOffset = zombieBoundingBox.size.width * 0.1566f;
    } else {
        //  is facing to the left; back is facing right
        xOffset = zombieBoundingBox.size.width * 0.4217f;
    }
    zombieBoundingBox =
    CGRectMake(zombieBoundingBox.origin.x + xOffset,
               zombieBoundingBox.origin.y,
               zombieBoundingBox.size.width - xCropAmount,
               zombieBoundingBox.size.height - yCropAmount);
    return zombieBoundingBox;
}

#pragma mark -
-(void)initAnimations
{
    smoothAnimationSequense = nil;
    currentActiveAnimation  = nil;
    [self setDictCharacterAnimationsFramesHolder:[NSMutableDictionary dictionary]];
    
    [self initWalkingAnimation];
    [self initFightingAnimation];
}

-(void)registerAnimation : (NSString*)    animationToRegister
     andFramesArray      : (CCArray*)     framesArray;
{
//    animationToRegister = sourceAnimation;
    [[self dictCharacterAnimationsFramesHolder] setObject:framesArray forKey:animationToRegister];
}

-(CCAnimation*)buildFramesForAnimationSmoothing: (CCSpriteFrame*)tmpSpriteFrame
                        betweenCurrentDirection: (CCAnimation*) previousAnimation
                               andNextDirection: (NSString*) nextDirection
{
    int *currentFrameNumber;
        
    NSMutableArray *tmpFramesToRemoveArray = nil;

  	tmpFramesToRemoveArray = [[[NSMutableArray alloc] init] autorelease];
    
    NSMutableArray *tmpFramesArray = [previousAnimation frames];
    NSMutableArray *tmpFramesForReturnAnimationArray = [currentActiveAnimation frames].mutableCopy;

    for (int i = 0; i < tmpFramesArray.count; i++) {
        CCAnimationFrame *tmpSpriteFrameLocal = [tmpFramesArray objectAtIndex:i];

        [tmpFramesToRemoveArray addObject:tmpSpriteFrameLocal];

        if (tmpSpriteFrame.rect.origin.x == tmpSpriteFrameLocal.spriteFrame.rect.origin.x &&
           tmpSpriteFrame.rect.origin.y == tmpSpriteFrameLocal.spriteFrame.rect.origin.y)
       {
           currentFrameNumber = &i;
           break;
       }
        
    }

    if (tmpFramesForReturnAnimationArray.count > tmpFramesToRemoveArray.count && tmpFramesToRemoveArray.count > 0)
    {
        [tmpFramesForReturnAnimationArray removeObjectsInRange:NSMakeRange(0, [tmpFramesToRemoveArray count])];        
    }

    CCAnimation *animationToReturn = [[CCAnimation alloc] initWithFrames:tmpFramesForReturnAnimationArray
                                                            delayPerUnit:[currentActiveAnimation delayPerUnit]];
    
    return animationToReturn;
}

-(void)initWalkingAnimation
{
    NSDictionary *tmpDictionary = [self loadPlistForAnimationWithName:
                                   @"walk" andClassName:@"zombieWalk"
                                                         andDirection:ksDirectionUpUpUp];

    [self registerAnimation:ksDirectionUpUpUp
             andFramesArray:[tmpDictionary objectForKey: LABEL_FRAMES_ARRAY]];
    
    [self setAnimWalkingUpUpUp : [tmpDictionary objectForKey: LABEL_ANIMATION] ];
    
     tmpDictionary = [self loadPlistForAnimationWithName:
                                   @"walk" andClassName:@"zombieWalk"
                                                         andDirection:ksDirectionUpUpLeft];
    [self registerAnimation:ksDirectionUpUpLeft
                          andFramesArray:[tmpDictionary objectForKey: LABEL_FRAMES_ARRAY]];

    [self setAnimWalkingUpUpLeft:[tmpDictionary objectForKey: LABEL_ANIMATION] ];
    
    [self setAnimWalkingUpLeftLeft:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionUpLeftLeft] objectForKey: LABEL_ANIMATION] ];
    
    [self setAnimWalkingUpUpRight:[[self loadPlistForAnimationWithName:
                                    @"walk" andClassName:@"zombieWalk"
                                    andDirection:ksDirectionUpUpRight] objectForKey: LABEL_ANIMATION] ];
    
    [self setAnimWalkingUpRightRight:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionUpRightRight] objectForKey: LABEL_ANIMATION] ];
    
    [self setAnimWalkingDownDownDown:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionDownDownDown] objectForKey: LABEL_ANIMATION] ];
    
    [self setAnimWalkingDownDownLeft:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionDownDownLeft] objectForKey: LABEL_ANIMATION] ];
    
    [self setAnimWalkingDownLeftLeft:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionDownLeftLeft] objectForKey: LABEL_ANIMATION] ];

    [self setAnimWalkingLeftLeftLeft:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionLeftLeftLeft] objectForKey: LABEL_ANIMATION] ];

    [self setAnimWalkingDownDownRight:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionDownDownRight] objectForKey: LABEL_ANIMATION] ];

    [self setAnimWalkingDownRightRight:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionDownRightRight] objectForKey: LABEL_ANIMATION] ];

    [self setAnimWalkingRightRightRight:[[self loadPlistForAnimationWithName:
                                       @"walk" andClassName:@"zombieWalk"
                                       andDirection:ksDirectionRightRightRight] objectForKey: LABEL_ANIMATION] ];
}

-(void)initFightingAnimation
{
    [self setAnimFighting:[[self loadPlistForAnimationWithName:
                            @"zombieFight" andClassName:kZombieFightClassName
                            andDirection:@"default"] objectForKey: LABEL_ANIMATION] ];
}


#pragma mark -
-(id) init {
    if( (self=[super init]) ) {
        self.gameObjectType = kZombieType;
        millisecondsStayingIdle = 0.0f;
        [self initAnimations];
        [self changeState:kStateStanding];
    }
    CCRotateBy *rotationAction = [CCRotateBy actionWithDuration:4 angle:180];
//    [self runAction:rotationAction];
    
//    self.setBoundingBox = CGRectMake(0, 0, 200,200);
//    self.contentSize = CGSizeMake(200.0, 200.0);

    return self;
}
@end