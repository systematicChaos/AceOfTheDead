//
//  VictoryScene.m
//  AceOfTheDead
//
//  Created by torasike on 28.01.13.
//
//

#import "VictoryScene.h"

@implementation VictoryScene

-(id)init {
    self = [super init];
    if (self != nil) {
        victoryLayer = [VictoryLayer node];
        [self addChild:victoryLayer];
    }
    return self;
}
@end
