//
//  GameObject.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/24/12.
//
//

#define LABEL_FRAMES_ARRAY @"framesArray"
#define LABEL_ANIMATION @"animation"

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "CommonProtocols.h"
@interface GameObject : CCSprite {
    BOOL isActive;
    BOOL reactsToScreenBoundaries;
    CGSize screenSize;
    CCRepeatForever *currentAnimationAction;
    GameObjectType gameObjectType;
}

@property (readwrite) BOOL isActive;
@property (readwrite) NSString* strDirection;
@property (readwrite) BOOL reactsToScreenBoundaries;
@property (readwrite) CGSize screenSize;
//@property (readwrite) CCRepeatForever *currentAnimationAction;
@property (readwrite) GameObjectType gameObjectType;
@property (readwrite,retain) CCArray *arrTrajectoryToMove;

-(void)changeState:(CharacterStates)newState;
-(void)changeDirection:(NSString*)newDirection;
-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObjects;
-(CGRect)adjustedBoundingBox;
-(NSDictionary*)loadPlistForAnimationWithName:(NSString*)animationName
                                andClassName:(NSString*)className
                                andDirection:(NSString*)direction;
-(void) moveObjectToNextPoint;
-(void) movingTrajectory: (CCArray*)withArrTrajectoryToMove;
@end
