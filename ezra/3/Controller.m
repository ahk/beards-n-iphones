//
//  Controller.m
//
//  Created by Ezra Spier on 9/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller
- (void)awakeFromNib {
	polygon = [[PolygonShape alloc] initWithNumberOfSides:numberOfSidesLabel.text.integerValue 
									  minimumNumberOfSides:3 
									 maximumNumberOfSides:12];
	// I shouldn't need to do this!!!
	// But, for some reason, I can't get outlets in IB to work right...
	polygonView.polygon = polygon;
	[self updateInterface];
}

- (IBAction)decrease:(id)sender {
	int sides = polygon.numberOfSides;
	sides--;
	polygon.numberOfSides = sides;
	[self updateInterface];
}

- (IBAction)increase:(id)sender {
	int sides = polygon.numberOfSides;
	sides++;
	polygon.numberOfSides = sides;
	[self updateInterface];
}

- (void)updateInterface {
	if (polygon.numberOfSides >= polygon.maximumNumberOfSides) {
		increaseButton.enabled = NO;
	} else if (polygon.numberOfSides < polygon.maximumNumberOfSides) {
		increaseButton.enabled = YES;
	}
	
	if (polygon.numberOfSides <= polygon.minimumNumberOfSides) {
		decreaseButton.enabled = NO;
	} else if (polygon.numberOfSides > polygon.minimumNumberOfSides) {
		decreaseButton.enabled = YES;
	}

	[polygonView setNeedsDisplay];
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", polygon.numberOfSides];
	nameLabel.text = [NSString stringWithFormat:@"%@", polygon.name];
}

- (void)saveState {
	[[NSUserDefaults standardUserDefaults] setInteger:polygon.numberOfSides forKey:@"PolygonNumberOfSides"];
}

- (void)restoreState {
	int numberOfSides = [[NSUserDefaults standardUserDefaults] integerForKey:@"PolygonNumberOfSides"];
	if (numberOfSides) {
		polygon.numberOfSides = numberOfSides;
	}
 [[NSUserDefaults standardUserDefaults] integerForKey:@"PolygonNumberOfSides"];
	[self updateInterface];
}
@end
