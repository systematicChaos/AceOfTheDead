//
//  ResultsScene.m
//  AceOfTheDead
//
//  Created by torasike on 27.01.13.
//
//

#import "ResultsScene.h"

@implementation ResultsScene

-(id)init {
    self = [super init];
    if (self != nil) {
        resultsLayer = [ResultsLayer node];
        [self addChild:resultsLayer];
    }
    return self;
}

@end
