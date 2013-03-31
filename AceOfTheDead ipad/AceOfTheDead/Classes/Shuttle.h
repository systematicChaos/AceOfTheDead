//
//  Shuttle.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 9/11/12.
//
//

#import <Foundation/Foundation.h>
#import "GameObject.h"

@interface Shuttle : NSObject {
    int currentTrajectoryPointIndex;
    CCArray* trajectoryForMove;
    GameObject* objectToMove;
}
//@property (readwrite) BOOL isMusicON;
+(Shuttle*)sharedShuttle;
-(void)moveObject:(GameObject*)gameObject withTrajectory:(CCArray*)trajectory;
-(void)moveObject:(GameObject *)gameObject toNextPoint:(CGPoint)nextPoint;
-(NSString*)calculateDirectionOf:(CGPoint) previousPosition:(CGPoint)nextPosition;
-(void)selectorForMovingTimeCalculation: (id*)sender data:(NSMutableDictionary*)data;
-(void)selectorForDirectionCalculation: (id*)sender data:(NSMutableDictionary*)data;
-(float)calculateTimeForMovingBetweenFirstPoint: (CGPoint) firstPoint andSecond: (CGPoint) secondPoint;

//-(void)openSiteWithLinkType:(LinkTypes)linkTypeToOpen ;
@end