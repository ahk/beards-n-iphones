//
//  PolygonShape.m
//  WhatATool
//
//  Created by Ezra Spier on 9/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void)setNumberOfSides:(int)sides {
	if (sides >= minimumNumberOfSides && sides <= maximumNumberOfSides) {
		numberOfSides = sides;
	} else {
		NSLog(@"Invalid number of sides: %d is not between the minimum and maximum number of sides allowed", sides);
	}

}

- (void)setMinimumNumberOfSides:(int)sides {
	if (sides > 2) {
		minimumNumberOfSides = sides;
	} else {
		NSLog(@"Invalid number of sides: %d is less than the minimum of 2 allowed", sides);
	}
}

- (void)setMaximumNumberOfSides:(int)sides {
	if (sides <= 12) {
		maximumNumberOfSides = sides;
	} else {
		NSLog(@"Invalid number of sides: %d is greater than the maximum of 12 allowed", sides);
	}
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if (self = [super init]) {
		[self setMinimumNumberOfSides:min];
		[self setMaximumNumberOfSides:max];
		[self setNumberOfSides:sides];
	}
	return self;
}

- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

- (float)angleInDegrees {
	return (180 * ([self numberOfSides] - 2.0) / [self numberOfSides]);
}

- (float)angleInRadians {
	return ([self angleInDegrees] * (M_PI / 180));
}

- (NSString*)name {
	NSString *myName = nil;
	
	if ([self numberOfSides] == 3) {
		myName = @"Triangle";
	} else if ([self numberOfSides] == 4) {
		myName = @"Square";
	} else if ([self numberOfSides] == 5) {
		myName = @"Pentagon";
	} else if ([self numberOfSides] == 6) {
		myName = @"Hexagon";
	} else if ([self numberOfSides] == 7) {
		myName = @"Heptagon";
	} else if ([self numberOfSides] == 8) {
		myName = @"Octagon";
	} else if ([self numberOfSides] == 9) {
		myName = @"Nonagon";
	} else if ([self numberOfSides] == 10) {
		myName = @"Decagon";
	} else if ([self numberOfSides] == 11) {
		myName = @"Hendecagon";
	} else if ([self numberOfSides] == 12) {
		myName = @"Dodecagon";
	} else {
		NSLog(@"Invalid number of sides! No name!");
	}

	return myName;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"Hello, I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", [self numberOfSides], [self name], [self angleInDegrees], [self angleInRadians]];
}
			
- (void)dealloc {
	NSLog(@"Polygon dealloc.");
	[super dealloc];
}
@end
