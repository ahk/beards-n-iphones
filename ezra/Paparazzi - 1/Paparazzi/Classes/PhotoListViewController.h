//
//  PhotoListViewController.h
//  Paparazzi
//
//  Created by Ezra Spier on 10/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoViewController.h"

@interface PhotoListViewController : UIViewController {
	UIImage *image1;
	UIImage *image2;
	UIImage *image3;
	
	NSString *label1;
	NSString *label2;
	NSString *label3;

	NSString *name1;
	NSString *name2;
	NSString *name3;
	
	IBOutlet UIImageView *imageView1;
	IBOutlet UIImageView *imageView2;
	IBOutlet UIImageView *imageView3;
	
	IBOutlet UILabel *labelView1;
	IBOutlet UILabel *labelView2;
	IBOutlet UILabel *labelView3;
	
	IBOutlet UILabel *nameView1;
	IBOutlet UILabel *nameView2;
	IBOutlet UILabel *nameView3;

	IBOutlet UIButton *button1;
	IBOutlet UIButton *button2;
	IBOutlet UIButton *button3;
}

@property(retain) UIImage *image1;
@property(retain) UIImage *image2;
@property(retain) UIImage *image3;

@property(copy) NSString *label1;
@property(copy) NSString *label2;
@property(copy) NSString *label3;

@property(copy) NSString *name1;
@property(copy) NSString *name2;
@property(copy) NSString *name3;

- (IBAction)buttonPressed:(UIButton *)sender;

@end
