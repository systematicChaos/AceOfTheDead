//
//  Health.m
//  ZombieThief
//
//  Created by look at me on 12/19/12.
//
//

#import "Health.h"

@implementation Health

@synthesize healthAnim;
@synthesize characterHealth;
@synthesize iconHolder;;

-(void) dealloc {
    [healthAnim release];
    [iconHolder release];
    [super dealloc];
}

-(void)changeState:(CharacterStates)newState
{
    if (newState == kStateSpawning)
    {
//        id action = [CCRepeatForever actionWithAction:
//                     [CCAnimate actionWithAnimation:healthAnim
//                               restoreOriginalFrame:NO]];
//        [self runAction:action];
    }
    else
    {
        [self setVisible:NO];// Picked up
        [self removeFromParentAndCleanup:YES];
    }
}
-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObjects
{
    return;
    float groundHeight = screenSize.height * 0.065f;
    if ([self position].y > groundHeight)
    {
        [self setPosition:ccp([self position].x,
                              [self position].y - 5.0f)];
    }

}
                              
-(void)initAnimations
{
    iconHolder = [CCSprite spriteWithFile:@"burger01_20.png"];
//    [self loadPlistForAnimationWithName:@"healthAnim"
//                           andClassName:NSStringFromClass([self class])]];
}
-(id) init
{
    if( (self=[super init]) )
    {
        screenSize = [CCDirector sharedDirector].winSize;
        [self initAnimations];
        [self changeState:kStateSpawning];
        gameObjectType = kPowerUpTypeHealth;
    }
    return self;
}
@end

//  Health.m
//  SpaceViking
//
#import "Health.h"
