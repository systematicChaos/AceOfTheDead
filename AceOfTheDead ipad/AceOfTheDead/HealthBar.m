//
//  HealthBar.m
//  ZombieThief
//
//  Created by Dmitry Kobeliatsky on 12/21/12.
//
//

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
    [self unscheduleAllSelectors];
    [healthBarSprite stopAllActions];
    // стопим все
    currentHealth += healthValue;
    if (currentHealth > TOTAL_HEALS){
        currentHealth = TOTAL_HEALS ;
    }
//    CCLOG(@"currentHealth:%d",currentHealth);   // Обновляем жизни
    
    float newScaleX = (healthValue / TOTAL_HEALS)+healthBarSprite.scaleX;
    if (newScaleX > 1.0) {
        newScaleX = 1.0;
    }
    [healthBarSprite setScaleX:newScaleX]; //обновляем скейл по X
//    CCLOG(@"newScaleX:%f",newScaleX);
    
    [self VerticalHealthBarAction]; //обновляем цвет (тут почему предупреждение)
    
    int newDuration = currentHealth/deltaHealth; // высчитываем новый Duration
//    CCLOG(@"newDuration:%d",newDuration);
    [self startHealthBar:newDuration]; // запускаем хелсбар
    
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
//    CCLOG(@"deltaHealth:%d",deltaHealth);
    int nRepeat = (currentHealth / TOTAL_HEALS )* 12;
    [self schedule:@selector(VerticalHealthBarAction) interval:duration/13.0f repeat:nRepeat delay:0];
    [self schedule:@selector(HealthUpdateSelector) interval:1];
    AnimationHealthBar = [CCScaleTo actionWithDuration:duration scaleX:0 scaleY:1.0];
    
    [healthBarSprite runAction:AnimationHealthBar];
    bIsPlaying = YES;
}

-(void)VerticalHealthBarAction{
    int newOriginY = 14-(currentHealth/TOTAL_HEALS)* 13; //высчитываем на сколько пикселей поднять вверх
    
//    CCLOG(@"newOriginY:%d",newOriginY);
    CGRect newRect = {
        healthBarSprite.textureRect.origin.x,
        newOriginY,
        healthBarSprite.textureRect.size.width,
        healthBarSprite.textureRect.size.height};
    [healthBarSprite setTextureRect:newRect];
    //  if (newOriginY == 5){                               // на пятой итерации прибавляем жизни 40 хелсов
    //[self updateHealthBarWithHealthValue:40];
    
    //}
    
}
-(void)HealthUpdateSelector{
    currentHealth -= deltaHealth;
//    CCLOG(@"currentHealth:%d",currentHealth);
    
    if (currentHealth < deltaHealth)
    {
        [self unschedule:@selector(HealthUpdateSelector)];
        bIsPlaying = NO;
        if (currentHealth <= 0) {
            
            // вызвается событие ,конец уровня
//            [[GameManager sharedGameManager] runSceneWithID:kResultsScene];
        }
        [self schedule:@selector(HealthUpdateSelector) interval:1.0f/(deltaHealth -currentHealth)];
    }
}

#pragma mark -
-(CGRect)adjustedBoundingBox {
    CGRect zombieBoundingBox = [self boundingBox];
    zombieBoundingBox =
    CGRectMake(1,1,1,1);
    return zombieBoundingBox;
}


-(void)hideHealthBar{}
-(void)showHealthBar{}
-(void)dealloc
{
    [super dealloc];
    
}

@end
