//
//  HealthBar.h
//  ZombieThief
//
//  Created by Dmitry Kobeliatsky on 12/21/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"


@interface HealthBar : CCLayer{
    #define TOTAL_HEALS 100
    int deltaHealth;
    int currentHealth;
  //  int duration;
    BOOL bIsPlaying;
    CCSprite *healthBarSprite;
    id AnimationHealthBar;
}
-(void)resetHealthBar;
-(void)updateHealthBarWithHealthValue:(int)healthValue;
-(void)updateDurationWithValue:(int)durationValue;
-(void)stopHealthBar;
-(void)startHealthBar:(int)setDuration;
-(void)hideHealthBar;
-(void)showHealthBar;

@end
