
//
//  GameplayLayer.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/16/12.
//
//

#import "GameplayLayer.h"
#import "Constants.h"
#import "Shuttle.h"

@implementation GameplayLayer

@synthesize healthBar;

- (void) dealloc {
    [super dealloc];
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    NSArray *touchesArray = [touches allObjects];
    UITouch *oneTouch = [touchesArray objectAtIndex:0];
    CGPoint touchLocation = [oneTouch locationInView:[oneTouch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
    [arrPathHolder removeAllObjects];
    [arrPathHolder addObject:[NSValue valueWithCGPoint:touchLocation]];
    //CCLOG(@"touch x: %f and y: %f",touchLocation.x,touchLocation.y);
    
}

-(void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touchOne = [[touches allObjects] objectAtIndex:0];
    //[arrPathHolder removeAllObjects];
    CGPoint location = [ touchOne locationInView:[touchOne view]];
        location = [[CCDirector sharedDirector] convertToGL:location];
        [arrPathHolder addObject: [NSValue valueWithCGPoint:location]];
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CCLOG(@"touches ended");
    for(NSValue *location in arrPathHolder)
    {
       // CCLOG(@"try to trace touches");
        CGPoint tmpPoint = [location CGPointValue];
        tmpPoint = [[CCDirector sharedDirector] convertToGL:tmpPoint];
      //  location = [touchOne locationInView:[touchOne view]];
       // location = [[CCDirector sharedDirector] convertToGL:location];
       // CCLOG(@"move to location X:%f and Y:%f",tmpPoint.x,tmpPoint.y);
    }
    [[Shuttle sharedShuttle] moveObject:zombie withTrajectory:arrPathHolder];
}
                            
#pragma mark –
#pragma mark Update Method
-(void) update:(ccTime)deltaTime {

    CCArray *listOfGameObjects =    [self children];
    for (GameCharacter *tempChar in listOfGameObjects)
    {
        if (tempChar != healthBar)
        {
        [tempChar updateStateWithDeltaTime:deltaTime andListOfGameObjects:listOfGameObjects];
        }

    }
}

-(void)updateHealthBarWithValue:(int)valueToUpdate
{
    [healthBar updateHealthBarWithHealthValue:100];
}

#pragma mark -
-(void)createObjectOfType:(GameObjectType)objectType
               withHealth:(int)initialHealth
               atLocation:(CGPoint)spawnLocation
               withZValue:(int)ZValue
{
    if (objectType == kPowerUpTypeHealth)
    {
        CCLOG(@"Creating the Powerup Health");
        Health *food = [[Health alloc] initWithSpriteFrameName:
                               @"burger01_20.png"];
        [food setCharacterHealth:initialHealth];
        [food setPosition:spawnLocation];
        [self addChild:food
                                     z:ZValue
                                   tag:kHealthSpriteTagValue];
    }
    else if (objectType == kEnemyTypeWillie)
    {
        CCLOG(@"Creating the kEnemyTypeWillie");
        Willie *willie1 = [[Willie alloc]
                  initWithSpriteFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"willyWalkUpUpUp0010.png"]];
        [willie1 setCharacterHealth:initialHealth];
        [willie1 setPosition:spawnLocation];
        [self addChild:willie1
              z:kWillieSpriteZValue
              tag:kWillieSpriteTagValue];
        
        
        CCArray *arrTmpPathHolder = [[CCArray alloc] initWithCapacity:100];
        for (int i=0; i<100; i++)
        {
            [arrTmpPathHolder addObject:[NSValue valueWithCGPoint:ccp(368, 250)]];
            [arrTmpPathHolder addObject:[NSValue valueWithCGPoint:ccp(368, 60)]];
        }

        [[Shuttle sharedShuttle] moveObject:willie1 withTrajectory:arrTmpPathHolder];

    }
}

-(id)init {
    self = [super init];
    if (self != nil)
    {
        
        arrPathHolder = [[CCArray alloc] initWithCapacity:100];
        
        self = [super init];
        if (self != nil)
        {
            CGSize screenSize = [CCDirector sharedDirector].winSize;
            // enable touches
            self.isTouchEnabled = YES;
            srandom(time(NULL)); // Seeds the random number generator

                [[CCSpriteFrameCache sharedSpriteFrameCache]
                                     addSpriteFramesWithFile:@"zombieWalk.plist"];
                [[CCSpriteFrameCache sharedSpriteFrameCache]
                                     addSpriteFramesWithFile:@"willyWalk.plist"];
                [[CCSpriteFrameCache sharedSpriteFrameCache]
                                     addSpriteFramesWithFile:@"zombieFight.plist"];
                [[CCSpriteFrameCache sharedSpriteFrameCache]
                                     addSpriteFramesWithFile:@"food.plist"];

            healthBar = [HealthBar node];
            [healthBar startHealthBar:20];
            [self addChild: healthBar z:7];
            
            zombie = [[Zombie alloc]
                      initWithSpriteFrame:[[CCSpriteFrameCache
                                            sharedSpriteFrameCache]
                                           spriteFrameByName:@"zombieWalkRightRightRight0005.png"]];
            [zombie setCharacterHealth:100];
            [zombie setPosition:ccp(screenSize.width * 0.25f,
                                    screenSize.height * 0.3f)];
            [self
             addChild:zombie
             z:kZombieSpriteZValue
             tag:kZombieSpriteTagValue];
            //[self createObjectOfType:kEnemyTypeWillie withHealth:100 atLocation:ccp(368,60) withZValue:123];

            //[self createObjectOfType:kPowerUpTypeHealth withHealth:50 atLocation:ccp(300, 150) withZValue:124];
//            food = [[Health alloc] init];
//            food = [[Health alloc] initWithSpriteFrame:[[CCSpriteFrameCache
  //                                          sharedSpriteFrameCache]
    //                                       spriteFrameByName:@"burger01_80.png"]];
//            [food setPosition:ccp(screenSize.width * 0.85f,
//                                    screenSize.height * 0.85f)];
//            [self addChild:food];
            /*[self createObjectOfType:kEnemyTypeDog
             withHealth:100
             atLocation:ccp(screenSize.width * 0.878f,
             screenSize.height * 0.13f)
             withZValue:10];*/
            [self scheduleUpdate];
        }

    }
    return self;
}

@end
