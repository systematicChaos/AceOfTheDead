//
//  MainMenuLayer.m
//  ZombieThief
//
//  Created by Dmitry Kobeliatsky on 11/9/12.
//
//

#import "MainMenuLayer.h"

@interface MainMenuLayer()
-(void)displayMainMenu;
-(void)displaySceneSelection;
@end

@implementation MainMenuLayer


-(id)init {
    self = [super init];
    if (self != nil) {
        CCSprite *background =
        [CCSprite spriteWithFile:@"menu-small_3gs.jpg"];
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        [background setPosition:CGPointMake(screenSize.width*0.5, screenSize.height*0.5)];
        [self addChild:background];
        [self displayMainMenu];
        
    }
    return self;
}

-(void)playScene:(CCMenuItemFont*)itemPassedIn {
    if ([itemPassedIn tag] == 1) {
        CCLOG(@"Tag 1 found, Scene 1");
        [[GameManager sharedGameManager] runSceneWithID:kGameLevel1];
    } else {
        CCLOG(@"Tag was: %d", [itemPassedIn tag]);
        CCLOG(@"Placeholder for next chapters");
    }
}

-(void)displayMainMenu {
    [self removeAllChildrenWithCleanup:YES];
    CCSprite *background =[CCSprite spriteWithFile:@"map.jpg"];
    
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [background setPosition:CGPointMake(screenSize.width*0.5, screenSize.height*0.5)];
    [self addChild:background z:0];

    CCMenuItemImage *playCemetery = [CCMenuItemImage
                                       itemFromNormalImage:@"icon01cemetery.png"
                                       selectedImage:@"icon01cemetery.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(displayInfoLocation:)];
    [playCemetery setTag:1];   
    [playCemetery setPosition:CGPointMake(screenSize.width * 0.25f,screenSize.height * 0.55f)];
    CCMenuItemImage *playIsland = [CCMenuItemImage
                                       itemFromNormalImage:@"icon02island.png"
                                       selectedImage:@"icon02island.png"
                                       disabledImage:nil
                                       target:self
                                       selector:@selector(displayInfoLocation:)];
    [playIsland setTag:2];
    [playIsland setPosition:CGPointMake(screenSize.width * 0.50f,screenSize.height * 0.40f)];
   
    chooseLocationMenu = [CCMenu menuWithItems:playCemetery,playIsland,nil];
    //[chooseLocationMenu alignItemsVerticallyWithPadding:screenSize.height * 0.059f];
    [chooseLocationMenu setPosition:CGPointMake(0,0)];
    
    [self addChild:chooseLocationMenu z:1 tag:kMainMenuTagValue];
}
-(void)displayInfoLocation:(CCMenuItemImage*)itemPassedIn{
    [self removeAllChildrenWithCleanup:YES];
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    
    NSString * slide;
    if ([itemPassedIn tag] == 1) {
        slide = @"level_select01_iphone3_2.jpg";
    }
    if ([itemPassedIn tag] == 2) {
        slide = @"04-island.jpg";
    }


    CCMenuItemImage *displayInfoLocation = [CCMenuItemImage
                                     itemFromNormalImage:slide
                                     selectedImage:slide
                                     disabledImage:nil
                                     target:self
                                     selector:@selector(playScene:)];
    [displayInfoLocation setTag:[itemPassedIn tag]];
    [displayInfoLocation setPosition:CGPointMake(screenSize.width * 1.50f,screenSize.height * 0.50f)];
    [displayInfoLocation runAction:[CCMoveTo actionWithDuration:1
                                                    position:CGPointMake(screenSize.width * 0.50f,screenSize.height * 0.50f)]];
    CCMenuItemImage *backgroundSmooth = [CCMenuItemImage
                                         itemFromNormalImage:@"backgroundSmooth.jpg"
                                         selectedImage:@"backgroundSmooth.jpg"
                                         disabledImage:nil
                                         target:self
                                         selector:@selector(displayMainMenu)];
    [backgroundSmooth setPosition:CGPointMake(screenSize.width * 0.5f,screenSize.height * 0.5f)];
    infoLocationMenu = [CCMenu menuWithItems:backgroundSmooth, nil];
    infoLocationMenu2 = [CCMenu menuWithItems:displayInfoLocation, nil];

    [infoLocationMenu setPosition:CGPointMake(0,0)];
    [infoLocationMenu2 setPosition:CGPointMake(0,0)];
    //infoLocationMenu.isTouchEnabled = YES;
    
    [self addChild:infoLocationMenu z:1 ];
    [self addChild:infoLocationMenu2 z:2 ];
   }
@end
