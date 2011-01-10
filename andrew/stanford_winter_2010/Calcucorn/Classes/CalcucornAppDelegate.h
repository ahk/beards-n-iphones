//
//  CalcucornAppDelegate.h
//  Calcucorn
//
//  Created by Andrew Hay Kurtz on 12/14/10.
//  Copyright 2010 Noiseless Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalcucornViewController;

@interface CalcucornAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CalcucornViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CalcucornViewController *viewController;

@end

