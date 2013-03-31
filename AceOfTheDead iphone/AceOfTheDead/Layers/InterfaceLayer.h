//
//  InterfaceLayer.h
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/10/13.
//
//

#import "cocos2d.h"
#import "CCLayer.h"
#import "GameManager.h"

@interface InterfaceLayer : CCLayer
{
    CCSprite *boosterIcon;
    CCSprite *boosterIconBG;
    CCLabelTTF *label;
}

@end
