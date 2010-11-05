//
//  PhotoListViewController.m
//  Paparazzi
//
//  Created by Ezra Spier on 10/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PhotoListViewController.h"


@implementation PhotoListViewController

@synthesize image1, image2, image3;
@synthesize label1, label2, label3;
@synthesize name1, name2, name3;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.title = @"Photos";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	if (image1 && label1) {
		imageView1.image = image1;
		labelView1.text = label1;
		nameView1.text = name1;
		imageView1.hidden = NO;
		labelView1.hidden = NO;
		nameView1.hidden = NO;
		button1.hidden = NO;
	} else {
		imageView1.hidden = YES;
		labelView1.hidden = YES;
		nameView1.hidden = YES;
		button1.hidden = YES;
	}

	if (image2 && label2) {
		imageView2.image = image2;
		labelView2.text = label2;
		nameView2.text = name2;
		imageView2.hidden = NO;
		labelView2.hidden = NO;
		nameView2.hidden = NO;
		button2.hidden = NO;
	} else {
		imageView2.hidden = YES;
		labelView2.hidden = YES;
		nameView2.hidden = YES;
		button2.hidden = YES;
	}
	
	if (image3 && label3) {
		imageView3.image = image3;
		labelView3.text = label3;
		nameView3.text = name3;
		imageView3.hidden = NO;
		labelView3.hidden = NO;
		nameView3.hidden = NO;
		button3.hidden = NO;
	} else {
		imageView3.hidden = YES;
		labelView3.hidden = YES;
		nameView3.hidden = YES;
		button3.hidden = YES;
	}
}

- (IBAction)buttonPressed:(UIButton *)sender {
	PhotoViewController * photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:[NSBundle mainBundle]];

	if (sender == button1) {
		photoViewController.image = image1;
	}
	if (sender == button2) {
		photoViewController.image = image2;
	}
	if (sender == button3) {
		photoViewController.image = image3;
	}
	
	[[self navigationController] pushViewController:photoViewController animated:YES];
	[photoViewController release];
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
	[image1 release];
	[image2 release];
	[image3 release];
	
	[label1 release];
	[label2 release];
	[label3 release];

	[name1 release];
	[name2 release];
	[name3 release];
	
    [super dealloc];
}


@end
