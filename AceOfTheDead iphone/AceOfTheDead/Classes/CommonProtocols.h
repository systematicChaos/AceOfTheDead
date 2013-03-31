//
//  CommonProtocols.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/24/12.
//
//

#ifndef ZombieThief_CommonProtocols_h
#define ZombieThief_CommonProtocols_h

typedef enum {
    kDirectionLeft,
    kDirectionRight,
    kDirectionUp,
    kDirectionDown
} MoveDirection;
typedef enum {
    kStateDead,
    kStateSpawning,
    kStateIdle,
    kStateWalking,
    kStateFighting,
    kStateBreathing,
    kStateDancing,
    kStateStanding,
    kStateScared
} CharacterStates;

typedef enum {
    kDirectionLeftLeftLeft,
    kDirectionUpLeftLeft,
    kDirectionUpUpLeft,
    kDirectionUpUpUp,
    kDirectionUpUpRight,
    kDirectionUpRightRight,
    kDirectionRightRightRight,
    kDirectionDownLeftLeft,
    kDirectionDownDownLeft,
    kDirectionDownDownDown,
    kDirectionDownDownRight,
    kDirectionDownRightRight,
} GameObjectDirections;

typedef enum {
    kObjectTypeNone,
    kPowerUpTypeCash,
    kPowerUpTypeHealth,
    kEnemyTypeDog,
    kEnemyTypeWillie,
    kEnemyTypeMonkey,
    kZombieType
} GameObjectType;


@protocol GameplayLayerDelegate
-(void)createObjectOfType:(GameObjectType)objectType
               withHealth:(int)initialHealth
               atLocation:(CGPoint)spawnLocation
               withZValue:(int)ZValue;

-(void)updateHealthBarWithValue:(int)valueToUpdate;
@end

#endif
