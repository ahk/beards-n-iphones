//
//  PersonListViewController.m
//  Paparazzi
//
//  Created by Ezra Spier on 10/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PersonListViewController.h"


@implementation PersonListViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.title = @"Contacts";
		self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    }
    return self;
}


- (IBAction)buttonPressed:(UIButton *)sender {
	PhotoListViewController * photoListViewController = [[PhotoListViewController alloc] initWithNibName:@"PhotoListViewController"
																								  bundle:[NSBundle mainBundle]];
	if (sender == button1) {
		photoListViewController.title = @"Peter's Photos";
		photoListViewController.image1 = [UIImage imageNamed:@"p1.jpg"];
		photoListViewController.label1 = @"YES EZRA 1";
		photoListViewController.name1 = @"Peter";
		
		photoListViewController.image2 = [UIImage imageNamed:@"p2.jpg"];
		photoListViewController.label2 = @"YES EZRA 2";
		photoListViewController.name2 = @"Peter";

		photoListViewController.image3 = [UIImage imageNamed:@"p3.jpg"];
		photoListViewController.label3 = @"YES EZRA 3";
		photoListViewController.name3 = @"Peter";
	} else if (sender == button2) {
		photoListViewController.title = @"Robert's Photos";
		photoListViewController.image1 = [UIImage imageNamed:@"ff_tim_eric_f.jpg"];
		photoListViewController.name1 = @"My Name";
		photoListViewController.label1 = @"Tim and Eric";
	} else if (sender == button3) {
		photoListViewController.title = @"Lisa's Photos";
	} 
	
	[[self navigationController] pushViewController:photoListViewController animated:YES];
	[photoListViewController release];
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
