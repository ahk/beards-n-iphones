//
//  picFlipperAppDelegate.h
//  picFlipper
//
//  Created by Andrew Kurtz on 10/26/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class picFlipperViewController;

@interface picFlipperAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    picFlipperViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet picFlipperViewController *viewController;

@end

