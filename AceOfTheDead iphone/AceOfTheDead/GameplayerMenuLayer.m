//
//  MainMenuLayer.m
//  ZombieThief
//
//  Created by Dmitry Kobeliatsky on 11/9/12.
//
//

#import "GameplayerMenuLayer.h"

@interface GameplayerMenuLayer()
-(void)displayMainMenu;
-(void)displaySceneSelection;
@end

@implementation GameplayerMenuLayer


-(id)init {
    self = [super init];
    if (self != nil) {
    
        [self displayMainMenu];
        
    }
    return self;
}

-(void)playScene:(CCMenuItemFont*)itemPassedIn {
    if ([itemPassedIn tag] == 101) {
        
        [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    }
    else if([itemPassedIn tag] == 1){
        [[GameManager sharedGameManager] runSceneWithID:kMainMenuScene];
    }
}
-(void)displayMainMenu {
   /* [self pauseSchedulerAndActions];
    for(CCSprite * sprite in [self children]){
        [[CCActionManager sharedManager] pauseTarget:sprite];
    }
    */
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    if (sceneSelectMenu != nil) {
        [sceneSelectMenu removeFromParentAndCleanup:YES];
    }
    // Main Menu
    CCMenuItemImage *playGameButton = [CCMenuItemImage
                                       itemFromNormalImage:@"pause_small.png"
                                       selectedImage:@"pause_small.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(displaySceneSelection)];
    //[playGameButton setTag:1];
    
     GameplayerMenu = [CCMenu menuWithItems:playGameButton,nil];
    
    [GameplayerMenu alignItemsVerticallyWithPadding:
     screenSize.height * 0.059f];
    [GameplayerMenu setPosition:
     ccp( 25,
         screenSize.height -25)];
    
    
    [self addChild:GameplayerMenu z:0 tag:kMainMenuTagValue];
    //CCLayer * HealthBar = [HealthBar init];
    //[self addChild:HealthBar z:1];
    
}

-(void)displaySceneSelection {
    
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    if (GameplayerMenu != nil) {
        [GameplayerMenu removeFromParentAndCleanup:YES];
    }
    
    CCLabelTTF *playScene1Label =[CCLabelTTF
                                     labelWithString:@"restart"
                                     fontName:@"Helvetica" fontSize:20] ;
    
    CCMenuItemLabel *playScene1 = [CCMenuItemLabel
                                   itemWithLabel:playScene1Label
                                   target:self
                                   selector:@selector(playScene:)];
    [playScene1 setTag:101];
    
    CCLabelTTF *GoMainMenuLabel =[CCLabelTTF
                                  labelWithString:@"Main Menu"
                                  fontName:@"Helvetica" fontSize:20] ;
    
    CCMenuItemLabel *GoMainMenu = [CCMenuItemLabel
                                   itemWithLabel:GoMainMenuLabel
                                   target:self
                                   selector:@selector(playScene:)];
    [GoMainMenu setTag:1];

    
    
    CCLabelTTF *backButtonLabel = [CCLabelTTF labelWithString:@"Back" fontName:@"Helvetica" fontSize:20];
    
    CCMenuItemLabel *backButton =
    [CCMenuItemLabel itemWithLabel:backButtonLabel target:self
                          selector:@selector(displayMainMenu)];
    
    sceneSelectMenu = [CCMenu menuWithItems:GoMainMenu,playScene1,backButton,nil];
    
    [sceneSelectMenu alignItemsVerticallyWithPadding:
     screenSize.height * 0.059f];
    [sceneSelectMenu setPosition:ccp(screenSize.width - (screenSize.width * 2) ,
                                     screenSize.height / 2)];
    id moveAction = [CCMoveTo actionWithDuration:0.5f
                                        position:ccp(screenSize.width * 0.15f,
                                                     screenSize.height/2)];
    id moveEffect = [CCEaseIn actionWithAction:moveAction rate:1.0f];
    [sceneSelectMenu runAction:moveEffect];
    [self addChild:sceneSelectMenu z:1 tag:kSceneMenuTagValue];
     
    //[[GameManager sharedGameManager] stopSceneWithID:101];
    /*
    if (![[CCDirector sharedDirector] isPaused]){
        [[CCDirector sharedDirector] pause];
    }
    else{
        [[CCDirector sharedDirector] resume];
    }
     */
}

@end
