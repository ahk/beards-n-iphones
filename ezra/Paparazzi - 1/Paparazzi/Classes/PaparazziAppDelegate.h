//
//  PaparazziAppDelegate.h
//  Paparazzi
//
//  Created by Ezra Spier on 10/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonListViewController.h"
#import "PhotoListViewController.h"

@interface PaparazziAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController *tabBarController;
	UINavigationController *personNavigationController;
	UINavigationController *photoNavigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

