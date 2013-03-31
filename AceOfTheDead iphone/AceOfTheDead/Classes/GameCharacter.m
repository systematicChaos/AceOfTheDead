//
//  GameCharacter.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/24/12.
//
//

#import "GameCharacter.h"
@implementation GameCharacter
@synthesize characterHealth;
@synthesize characterState;
@synthesize characterDirection;
@synthesize delegate;
@synthesize dictCharacterAnimationsFramesHolder;

-(void) dealloc
{
    [super dealloc];
}


-(void)checkAndClampSpritePosition
{
    CGPoint currentSpritePosition = [self position];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        // Clamp for the iPad
        if (currentSpritePosition.x < 30.0f)
        {
            [self setPosition:ccp(30.0f, currentSpritePosition.y)];
        }
        else if (currentSpritePosition.x > 1000.0f)
        {
            [self setPosition:ccp(1000.0f, currentSpritePosition.y)];
        }
    }
    else
    {
        // Clamp for iPhone, iPhone 4, or iPod touch
        if (currentSpritePosition.x < 24.0f)
        {
            [self setPosition:ccp(24.0f, currentSpritePosition.y)];
        }
        else if (currentSpritePosition.x > 456.0f)
        {
            [self setPosition:ccp(456.0f, currentSpritePosition.y)];
        }
    }
}
-(void)setMovingTrajectory:(CCArray*)withArrTrajectoryToMove
{
    
}
@end