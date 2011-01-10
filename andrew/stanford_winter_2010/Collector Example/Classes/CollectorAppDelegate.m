//
//  CollectorAppDelegate.m
//  Collector
//
//  Created by Paul on 4/7/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "CollectorAppDelegate.h"
#import "CollectorViewController.h"

@implementation CollectorAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
