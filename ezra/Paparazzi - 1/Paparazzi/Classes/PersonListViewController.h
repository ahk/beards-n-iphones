//
//  PersonListViewController.h
//  Paparazzi
//
//  Created by Ezra Spier on 10/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoListViewController.h"


@interface PersonListViewController : UIViewController {
	IBOutlet UIButton *button1;
	IBOutlet UIButton *button2;
	IBOutlet UIButton *button3;
}

- (IBAction)buttonPressed:(UIButton *)sender;

@end
