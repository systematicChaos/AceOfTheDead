//
//  HealthBar.m
//  ZombieThief
//
//  Created by Dmitry Kobeliatsky on 12/21/12.
//
//

/*
 comments
 
0) перед выполнеными пунктами ставь слово "done"
 
1) // вынести 12 и 13 и 314 и 960f и 2 и т.д. в константы с соответствующими названиями

2) в дальнейшем - переносить все скобочки тела методов и циклов на новую строчку
 //////
 if ()
 {
 
 }
 
-(void)startHealthBar:(int)duration
 {
 
 }
 //////
 
3) updateDurationWithValue. в этот метод будет передаваться время(duration), за которое должно закончится TOTAL_HEALTH жизней.
 
 delta = тотал_хелс/duration
 
4) HealthUpdateSelector переименовать в healthUpdateSelector
 
 */

#import "HealthBar.h"


@implementation HealthBar


-(id) init
{
    self = [super init];
    if (self != nil)
    {
        currentHealth = TOTAL_HEALS;
        deltaHealth = 0;
        bIsPlaying = NO;
        CGRect healthBarBox = {0, 0, 314, 2};

        
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
        {
            CGSize screenSize = [CCDirector sharedDirector].winSizeInPixels;
            if (screenSize.width == 960.0f) {
                // iPhone 4 Retina
                healthBarSprite = [CCSprite spriteWithFile:@"HealthBarBg.jpg" rect:healthBarBox];
            } else {
                healthBarSprite = [CCSprite spriteWithFile:@"HealthBarBg.jpg" rect:healthBarBox];
            }
            
        }
        else
        {
            healthBarSprite = [CCSprite spriteWithFile:@"HealthBarBg.jpg" rect:healthBarBox];
            //backgroundImage = [CCSprite spriteWithFile:@"zombie1.png"];
        }
        
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        [healthBarSprite setPosition:CGPointMake(screenSize.width*0.15, screenSize.height*0.92)];
        [healthBarSprite setAnchorPoint:ccp(0,0)];
        [self addChild:healthBarSprite z:0 tag:0];
        
        
    }
    return self;
}
-(void)resetHealthBar{
    bIsPlaying = NO;
    deltaHealth = 0;
    currentHealth = 0;
}
-(void)updateHealthBarWithHealthValue:(int)healthValue{
    [self pauseSchedulerAndActions];
    [healthBarSprite stopAllActions];
 //   int oldHeals = currentHealth;
    currentHealth += healthValue;
    if (currentHealth > TOTAL_HEALS){
        currentHealth = TOTAL_HEALS ;
    }
    
    float plusScaleX = (healthValue / 100.0f)+healthBarSprite.scaleX;
    if (plusScaleX > 1.0) {
        plusScaleX = 1.0f;
    }
    CCLOG(@"plusScaleX:%f",plusScaleX);
    [healthBarSprite runAction:[CCScaleTo actionWithDuration:0 scaleX:plusScaleX scaleY:1.0]];
    
    
    int newOriginY = (healthValue / 100 ) + healthBarSprite.textureRect.origin.y;
    if (newOriginY > 13)
        newOriginY = 13;
    CGRect newRect = {
        healthBarSprite.textureRect.origin.x,
        newOriginY,
        healthBarSprite.textureRect.size.width,
        healthBarSprite.textureRect.size.height};
    [healthBarSprite setTextureRect:newRect];
     CCLOG(@"newOriginY(update):%d",newOriginY);
}

-(void)updateDurationWithValue:(int)durationValue{
    deltaHealth = durationValue;
}

-(void)stopHealthBar{
    bIsPlaying = NO;
    [self pauseSchedulerAndActions];
    [healthBarSprite pauseSchedulerAndActions];
}

-(void)startHealthBar:(int)duration{
    deltaHealth  = currentHealth / duration;
    CCLOG(@"deltaHealth:%d",deltaHealth);
    
    [self schedule:@selector(VerticalHealthBarAction) interval:duration/13.0f repeat:12 delay:0];
    [self schedule:@selector(HealthUpdateSelector) interval:1];
    AnimationHealthBar = [CCScaleTo actionWithDuration:duration scaleX:0 scaleY:1.0];
   
    [healthBarSprite runAction:AnimationHealthBar];
    bIsPlaying = YES;
}

-(void)VerticalHealthBarAction{
    int newOriginY = healthBarSprite.textureRect.origin.y+1;
    CCLOG(@"newOriginY:%d",newOriginY);
    
    CGRect newRect = {
        healthBarSprite.textureRect.origin.x,
        newOriginY,
        healthBarSprite.textureRect.size.width,
        healthBarSprite.textureRect.size.height};        
    [healthBarSprite setTextureRect:newRect];
    if (newOriginY == 5){
        [self updateHealthBarWithHealthValue:40];
    }

        }
-(void)HealthUpdateSelector{
    currentHealth -= deltaHealth;
    CCLOG(@"currentHealth:%d",currentHealth);

    if (currentHealth < deltaHealth)
    {
        [self unschedule:@selector(HealthUpdateSelector)];
         bIsPlaying = NO;
        if (currentHealth <= 0) {
            return;
        }
        [self schedule:@selector(HealthUpdateSelector) interval:1.0f/(deltaHealth -currentHealth)];
    }
}
-(void)hideHealthBar{}
-(void)showHealthBar{}
-(void)dealloc
{
    [super dealloc];
    
}

@end




