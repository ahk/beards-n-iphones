//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Ezra Spier on 9/12/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Controller.h"

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet Controller *controller;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Controller *controller;
@end

