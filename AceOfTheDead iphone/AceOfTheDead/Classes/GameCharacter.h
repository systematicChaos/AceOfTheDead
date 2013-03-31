//
//  GameCharacter.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/24/12.
//
//

#import <Foundation/Foundation.h>
#import "GameObject.h"
@interface GameCharacter : GameObject {
    CharacterStates characterState;
    int characterHealth;
    
    id <GameplayLayerDelegate> delegate;
    
//    GameObjectDirections characterDirection;
}
-(void)checkAndClampSpritePosition;
-(void)setMovingTrajectory:(CCArray*)withArrTrajectoryToMove;
-(void)registerAnimation : (NSString*) animationToRegister
                           andFramesArray : (CCArray*) framesArray;

@property (nonatomic,assign) id <GameplayLayerDelegate> delegate;

@property (readwrite) int characterHealth;
@property (readwrite) CharacterStates characterState;
@property (readwrite, retain) NSString *characterDirection;
@property (nonatomic, retain) NSMutableDictionary *dictCharacterAnimationsFramesHolder;
@end