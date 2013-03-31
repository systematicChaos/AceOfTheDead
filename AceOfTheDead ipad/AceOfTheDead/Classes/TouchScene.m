//
//  TouchScene.m
//  AceOfTheDead
//
//  Created by torasike on 26.01.13.
//
//

#import "TouchScene.h"

@implementation TouchScene

-(id)init {
    self = [super init];
    if (self != nil) {
        touchLayer = [TouchLayer node];
        [self addChild:touchLayer];
          }
    return self;
}

@end
