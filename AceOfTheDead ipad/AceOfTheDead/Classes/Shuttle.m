
//
//  Shuttle.m
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 9/11/12.
//
//

#import "Shuttle.h"

@implementation Shuttle
static Shuttle* _sharedShuttle = nil;
+(Shuttle*)sharedShuttle
{
    @synchronized([Shuttle class])
    {
        if(!_sharedShuttle)
        {
            [[self alloc] init];
        }
        return _sharedShuttle;
    }
    return nil;
}

+(id)alloc
{
    @synchronized ([Shuttle class])
    {
        NSAssert(_sharedShuttle == nil,
                 @"Attempted to allocate a second instance of the Shuttle singleton");
        _sharedShuttle = [super alloc];
        return _sharedShuttle;
    }
    return nil;
}

-(id)init {
    self = [super init];
    if (self != nil) {
        CCLOG(@"Shuttle Singleton, init");
       // isMusicON = YES;
    }
    return self;
}

-(void)moveObject:(GameObject*)gameObject
        withTrajectory:(CCArray*)trajectory
{
    currentTrajectoryPointIndex = 0;
    trajectoryForMove = trajectory;
    objectToMove = gameObject;
    //[self moveObject:gameObject toNextPoint:[[trajectory objectAtIndex:currentTrajectoryPointIndex] CGPointValue]];
    NSMutableArray* actionsArray = [[NSMutableArray alloc]initWithCapacity: [trajectoryForMove count]];
    
    NSValue *valuePreviousPosition = [NSValue valueWithCGPoint: gameObject.position];

    for (int i=0; i<[trajectoryForMove count]; i++)
    {
        NSMutableDictionary *dictDataForCalculateDirection = [[NSMutableDictionary alloc]initWithCapacity:3];
        
        if (i > 0)
        {
            valuePreviousPosition = [trajectoryForMove objectAtIndex:i-1];
        }
        
        [dictDataForCalculateDirection setObject:gameObject forKey:kGameObject];
        
        [dictDataForCalculateDirection setObject:valuePreviousPosition forKey:kPreviousPosition];

        [dictDataForCalculateDirection setObject:[trajectoryForMove objectAtIndex:i] forKey:kNextPosition];
        
        float duration = [self calculateTimeForMovingBetweenFirstPoint:[valuePreviousPosition CGPointValue]
                                                             andSecond: [[trajectoryForMove objectAtIndex:i] CGPointValue]];
        
        CCLOG(@"Shuttle::moveObject::time for move: %f", duration);
        
        [actionsArray  addObject:[CCCallFuncND actionWithTarget:self
                                                       selector:@selector(selectorForDirectionCalculation:data:)
                                                           data:dictDataForCalculateDirection]];
        
        [actionsArray  addObject:[CCCallFuncND actionWithTarget:self
                                               selector:@selector(selectorForObjectMoving:data:)
                                               data:dictDataForCalculateDirection]];
        
        id action = [CCMoveTo actionWithDuration:duration position:[[trajectoryForMove objectAtIndex:i] CGPointValue]];
        
        [action setTag:1];
        
        [actionsArray  addObject: action];
//        [objectToMove runAction:action];
        //[actionsArray  addObject: [CCDelayTime actionWithDuration:duration*0.1]];
    }
    
    [actionsArray addObject:[CCCallFuncND actionWithTarget:self
                                                  selector:@selector(selectorForEndAnimationIndicating:data:)
                                                      data:gameObject]];
    
    CCSequence* sec = [CCSequence actionsWithArray:actionsArray];
    
    [gameObject runAction:sec];
}

-(float)calculateTimeForMovingBetweenFirstPoint: (CGPoint) firstPoint andSecond: (CGPoint) secondPoint
{
    double distance = sqrt((firstPoint.x-secondPoint.x)*(firstPoint.x-secondPoint.x) +
                           (firstPoint.y-secondPoint.y)*(firstPoint.y-secondPoint.y));
    
    return distance/100;
}

-(void)selectorForObjectMoving: (id*)sender data:(NSMutableDictionary*)data
{
    //CGPoint firstPoint = [[data objectForKey:kPreviousPosition] CGPointValue];
  //  CGPoint secondPoint = [[data objectForKey:kNextPosition] CGPointValue];
    
//    float duration = [self calculateTimeForMovingBetweenFirstPoint:firstPoint andSecond:secondPoint];
    
    if([[data objectForKey:kGameObject] getActionByTag:1])
    {
        [[data objectForKey:kGameObject] stopActionByTag:1];
    }
}

-(void)selectorForEndAnimationIndicating: (id*)sender data:(GameObject*)gameObject
{
    if(gameObject)
    {
        [gameObject changeState:kStateStanding];
    }
}


-(void)selectorForDirectionCalculation: (id*)sender data:(NSMutableDictionary*)data
{
    NSString* strDirection = [self calculateDirectionOf:[[data objectForKey:kPreviousPosition] CGPointValue] :
                                      [[data objectForKey:kNextPosition] CGPointValue]];
    
    [[data objectForKey:kGameObject] changeDirection:strDirection];
}

- (NSString*)calculateDirectionOf:(CGPoint)previousPosition :(CGPoint)nextPosition
{
    NSString *direction;

   // previousPosition = ccp(10, 10);
   // nextPosition = ccp(30, 20);
    if (previousPosition.x < nextPosition.x)
    {
        if (previousPosition.y < nextPosition.y)
        {
            if ((nextPosition.x - previousPosition.x) > (nextPosition.y - previousPosition.y))
            {
                direction = ksDirectionUpRightRight;
            }
            else
            {
                direction = ksDirectionUpUpRight;
            }
        }
        else if (previousPosition.y == nextPosition.y)
        {
            direction = ksDirectionRightRightRight;
        }
        else
        {
            if ((nextPosition.x - previousPosition.x) > (previousPosition.y - nextPosition.y))
            {
                direction = ksDirectionDownRightRight;
            }
            else
            {
                direction = ksDirectionDownDownRight;
            }
        }
    }
    else if (previousPosition.x == nextPosition.x)
    {
        if (previousPosition.y > nextPosition.y)
        {
            direction = ksDirectionDownDownDown;
        }
        else
        {
            direction = ksDirectionUpUpUp;
        }
    }
    else
    {
        if (previousPosition.y < nextPosition.y)
        {
            if ((previousPosition.x - nextPosition.x) > (nextPosition.y - previousPosition.y))
            {
                direction = ksDirectionUpLeftLeft;
            }
            else
            {
                direction = ksDirectionUpUpLeft;
            }
        }
        else if (previousPosition.y == nextPosition.y)
        {
            direction = ksDirectionLeftLeftLeft;
        }
        else
        {
            if ((previousPosition.x - nextPosition.x) > (previousPosition.y - nextPosition.y))
            {
                direction = ksDirectionDownLeftLeft;
            }
            else
            {
                direction = ksDirectionDownDownLeft;
            }
        }
    }

    CCLOG(@"derection: %@",direction);
    return direction;
}


@end
