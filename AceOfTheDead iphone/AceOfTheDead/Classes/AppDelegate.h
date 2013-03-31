//
//  AppDelegate.h
//  ZombieThief
//
//  Created by Yegor Karpechenkov on 8/16/12.
//  Copyright prosto* 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
