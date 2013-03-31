//
//  Willie.h
//  ZombieThief
//
//  Created by look at me on 12/20/12.
//
//

#import <Foundation/Foundation.h>
#import "GameCharacter.h"

@interface Willie : GameCharacter {
    CCAnimation *transmittingAnim;
    GameCharacter *zombieCharacter;
    
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
    
    BOOL isZombieWithinBoundingBox;
    BOOL isZombieWithinSight;
    
    float millisecondsStayingIdle;
}
@property (nonatomic, retain) CCAnimation *transmittingAnim;

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

@end
