//
//  CommonProtocol.h
//  AceOfTheDead
//
//  Created by look at me on 1/28/13.
//
//

#ifndef AceOfTheDead_CommonProtocol_h
#define AceOfTheDead_CommonProtocol_h

typedef enum {
    kDirectionLeft,
    kDirectionRight
} PhaserDirection;
typedef enum {
    kStateSpawning,
    kStateIdle,
    kStateCrouching,
    kStateStandingUp,
    kStateWalking,
    kStateAttacking,
    kStateJumping,
    kStateBreathing,
    kStateTakingDamage,
    kStateDead,
    kStateTraveling,
    kStateRotating,
    kStateDrilling,
    kStateAfterJumping
} CharacterStates; // 1
typedef enum {
    kObjectTypeNone,
    kPowerUpTypeHealth,
    kPowerUpTypeMallet,
    kEnemyTypeRadarDish,
    kEnemyTypeSpaceCargoShip,
    kEnemyTypeAlienRobot,
    kEnemyTypePhaser,
    kVikingType,
    kSkullType,
    kRockType,
    kMeteorType,
    kFrozenVikingType,
    kIceType,
    kLongBlockType,
    kCartType,
    kSpikesType,
    kDiggerType,
    kGroundType
} GameObjectType;
@protocol GameplayLayerDelegate
-(void)createObjectOfType:(GameObjectType)objectType
               withHealth:(int)initialHealth
               atLocation:(CGPoint)spawnLocation
               withZValue:(int)ZValue;
-(void)createPhaserWithDirection:(PhaserDirection)phaserDirection
                     andPosition:(CGPoint)spawnPosition;
-(void)updateHealthBarWithValue:(int)valueToUpdate;
@end


#endif
