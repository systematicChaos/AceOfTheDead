//
//  Constants.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/24/12.
//
//

#ifndef __Constants_h
#define __Constants_h

#define kZombieSpriteZValue 100
#define kZombieSpriteTagValue 0
#define kZombieIdleTimer 30.0f

#define kZombieWalkClassName        @"zombieWalk"
#define kZombieFightClassName       @"zombieFight"
#define kZombieStandClassName       @"zombieStand"

#define kWillieWalkClassName        @"willyWalk"

#define ksDirectionDownDownDown      @"DownDownDown"
#define ksDirectionDownDownLeft      @"DownDownLeft"
#define ksDirectionDownLeftLeft      @"DownLeftLeft"
#define ksDirectionDownDownRight     @"DownDownRight"
#define ksDirectionDownRightRight    @"DownRightRight"
#define ksDirectionUpUpUp            @"UpUpUp"
#define ksDirectionUpUpLeft          @"UpUpLeft"
#define ksDirectionUpLeftLeft        @"UpLeftLeft"
#define ksDirectionUpUpRight         @"UpUpRight"
#define ksDirectionUpRightRight      @"UpRightRight"
#define ksDirectionLeftLeftLeft      @"LeftLeftLeft"
#define ksDirectionRightRightRight   @"RightRightRight"

#define kGameObject                 @"gameObject"
#define kNextPosition               @"nextPosition"
#define kPreviousPosition           @"previousPosition"

// Constants for Menu
#define kMainMenuTagValue 10
#define kSceneMenuTagValue 20

typedef enum {
    kNoSceneUninitialized=0,
    kMainMenuScene=1,
    kChooseLevel=2,
    kCreditsScene=3,
    kIntroScene=4,
    kLevelCompleteScene=5,
    kTouchScene=6,
    kResultsScene=7,
    kVictoryScene=8,
    kGameLevel1=101,
    kGameLevel2=102,
    kGameLevel3=103,
    kGameLevel4=104,
    kGameLevel5=105,
    kCutSceneForLevel2=201
} SceneTypes;

typedef enum {
    kLinkTypeBookSite,
    kLinkTypeDeveloperSiteRod,
    kLinkTypeDeveloperSiteRay,
    kLinkTypeArtistSite,
    kLinkTypeMusicianSite
} LinkTypes;

// Debug Enemy States with Labels
// 0 for OFF, 1 for ON
#define ENEMY_STATE_DEBUG 0


#endif
