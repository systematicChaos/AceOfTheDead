//
//  Health.h
//  ZombieThief
//
//  Created by look at me on 12/19/12.
//
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface Health : GameObject {
    CCAnimation *healthAnim;
    CCSprite *iconHolder;
}
@property (nonatomic, retain) CCAnimation *healthAnim;
@property (nonatomic, retain) CCSprite *iconHolder;
@property (readwrite) int characterHealth;

@end

