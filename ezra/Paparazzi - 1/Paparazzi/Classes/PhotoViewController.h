//
//  PhotoViewController.h
//  Paparazzi
//
//  Created by Ezra Spier on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotoViewController : UIViewController {
	IBOutlet UIImageView *imageView;
	
	UIImage *image;
}

@property(retain) UIImage *image;

@end
