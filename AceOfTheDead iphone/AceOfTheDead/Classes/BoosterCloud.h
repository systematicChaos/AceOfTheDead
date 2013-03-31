//
//  BoosterCloud.h
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/15/13.
//
//

#import "GameObject.h"
#import "Constants.h"

@interface BoosterCloud : GameObject
{
    CCAnimation *animBoosterCloud;
}

-(void) showCloudAnimation;

@property (nonatomic, retain) CCAnimation *animBoosterCloud;
@end
