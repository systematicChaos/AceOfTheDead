//
//  GameManager.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 9/11/12.
//
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@interface GameManager : NSObject {
    BOOL isMusicON;
    BOOL isSoundEffectsON;
    BOOL hasPlayerDied;
    SceneTypes currentScene;
}
@property (readwrite) BOOL isMusicON;
@property (readwrite) BOOL isSoundEffectsON;
@property (readwrite) BOOL hasPlayerDied;
+(GameManager*)sharedGameManager;
-(void)runSceneWithID:(SceneTypes)sceneID;
-(void)stopSceneWithID:(SceneTypes)sceneID;
//-(void)openSiteWithLinkType:(LinkTypes)linkTypeToOpen ;
@end