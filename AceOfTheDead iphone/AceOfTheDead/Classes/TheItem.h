//
//  TheItem.h
//  AceOfTheDead
//
//  Created by Yegor Karpechenkov on 3/11/13.
//
//

#import "CCSprite.h"


@protocol ItemDelegate <NSObject>

-(void)bibi;

@end

@interface TheItem : CCSprite
{
    id <ItemDelegate> _delegate;

}

-(void)tryDelegate;

@property (nonatomic,retain) id <ItemDelegate> delegate;
@end
