//
//  GameObject.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/24/12.
//
//

#import "GameObject.h"
#import "cocos2d.h"

@implementation GameObject

@synthesize reactsToScreenBoundaries;
@synthesize screenSize;
@synthesize isActive;
@synthesize strDirection;
@synthesize gameObjectType;
@synthesize arrTrajectoryToMove;

-(id) init {
    if((self=[super init])){
        CCLOG(@"GameObject init");
        screenSize = [CCDirector sharedDirector].winSize;
        isActive = TRUE;
        [[arrTrajectoryToMove alloc] init];
        gameObjectType = kObjectTypeNone;
    }
    return self;
}
-(void)changeState:(CharacterStates)newState {
    CCLOG(@"GameObject->changeState method should be overridden");
}

-(void)changeDirection:(NSString*)newDirection
{
   // strDirection = newDirection;
   // [self changeState:newDirection];
}
-(void)updateStateWithDeltaTime:(ccTime)deltaTime
           andListOfGameObjects:(CCArray*)listOfGameObjects {
    CCLOG(@"updateStateWithDeltaTime method should be overridden");
}
-(CGRect)adjustedBoundingBox {
 //   CCLOG(@"GameObect adjustedBoundingBox should be overridden");
    return [self boundingBox];
}

-(NSDictionary*)loadPlistForAnimationWithName:(NSString*)animationName
                                andClassName:(NSString*)className
                                andDirection:(NSString*)direction{
    if (direction == @"default")
    {
        direction = @"";
    }
    NSDictionary *dictionaryToReturn = nil;
    CCArray *arrayToReturn = nil;
    CCAnimation *animationToReturn = nil;
    NSString *fullFileName =
    [NSString stringWithFormat:@"%@.plist",className];
    NSString *plistPath;
    // 1: Get the Path to the plist file
    NSString *rootPath =
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                         NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle]
                     pathForResource:className ofType:@"plist"];
    }
    // 2: Read in the plist file
    NSDictionary *plistDictionary =
    [NSDictionary dictionaryWithContentsOfFile:plistPath];
    // 3: If the plistDictionary was null, the file was not found.
    if (plistDictionary == nil) {
        CCLOG(@"Error reading plist: %@.plist", className);
        return nil; // No Plist Dictionary or file found
    }
    for (NSString* strKey in plistDictionary)
    {
        id value = [plistDictionary objectForKey:strKey];
        //CCLOG(@"key:%@, and plist[key]: %@",strKey,value);
    }
    // 4: Get just the mini-dictionary for this animation
    NSDictionary *animationSettings =
    [plistDictionary objectForKey:animationName];
    if (animationSettings == nil) {
        CCLOG(@"Could not locate AnimationWithName:%@",animationName);
        return nil; }
    for (NSString* strKey in animationSettings)
    {
        id value = [animationSettings objectForKey:strKey];
        //CCLOG(@"key:%@, and AnimationSettings[key]: %@",strKey,value);
    }
    // 5: Get the delay value for the animation;
    float animationDelay =
    [[animationSettings objectForKey:@"delay"] floatValue];
    animationToReturn = [CCAnimation animation];
    [animationToReturn setDelayPerUnit:animationDelay];//                      !!!!!!!!!!!!
    // 6: Add the frames to the animation
    NSString *animationFramePrefix =
    [animationSettings objectForKey:@"filenamePrefix"];
    NSString *animationFrames =
    [animationSettings objectForKey:@"animationFrames"];
    NSArray *animationFrameNumbers =
    [animationFrames componentsSeparatedByString:@","];

    arrayToReturn = [CCArray array];
    
    for (NSString *frameNumber in animationFrameNumbers)
    {
         NSString *frameName = [NSString stringWithFormat:@"%@%@%@%@.png",
                                         animationFramePrefix,direction,@"00",frameNumber];
        
        [animationToReturn addFrame: [[CCSpriteFrameCache sharedSpriteFrameCache]
                                                        spriteFrameByName:frameName]];
        [arrayToReturn addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]
                                  spriteFrameByName:frameName]];
    }
    
    dictionaryToReturn = [NSDictionary dictionaryWithObjectsAndKeys:
                          arrayToReturn, LABEL_FRAMES_ARRAY,
                          animationToReturn, LABEL_ANIMATION,
                          nil];
    return dictionaryToReturn;
}

-(void)moveObjectToNextPoint
{
    
}

-(void)setMovingTrajectory:(CCArray*)withArrTrajectoryToMove
{
    arrTrajectoryToMove = withArrTrajectoryToMove;
}
@end

