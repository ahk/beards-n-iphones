//
//  CollectorAppDelegate.h
//  Collector
//
//  Created by Paul on 4/7/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectorViewController;

@interface CollectorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CollectorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CollectorViewController *viewController;

@end

