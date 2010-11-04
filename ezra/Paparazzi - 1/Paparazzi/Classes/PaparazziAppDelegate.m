//
//  PaparazziAppDelegate.m
//  Paparazzi
//
//  Created by Ezra Spier on 10/30/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PaparazziAppDelegate.h"

@implementation PaparazziAppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	tabBarController = [[UITabBarController alloc] init];
	personNavigationController = [[UINavigationController alloc] init];
	photoNavigationController = [[UINavigationController alloc] init];

	PersonListViewController *personListViewController = [[PersonListViewController alloc] initWithNibName:@"PersonListViewController" bundle:[NSBundle mainBundle]];
	[personNavigationController pushViewController:personListViewController animated:NO];
	
	PhotoListViewController *photoListViewController = [[PhotoListViewController alloc] initWithNibName:@"PhotoListViewController" bundle:[NSBundle mainBundle]];
	photoListViewController.image1 = [UIImage imageNamed:@"beards.jpg"];
	photoListViewController.label1 = @"test";
	photoListViewController.name1 = @"name";
	photoListViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemRecents tag:1];
	photoListViewController.title = @"Recents";
	[photoNavigationController pushViewController:photoListViewController animated:NO];
	
	tabBarController.viewControllers = [NSArray arrayWithObjects:personNavigationController, photoNavigationController, nil];
	[window addSubview:tabBarController.view];
    [window makeKeyAndVisible];
	
	[personNavigationController release];
	[photoNavigationController release];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[tabBarController release];
    [window release];
    [super dealloc];
}


@end
