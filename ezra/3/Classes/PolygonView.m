//
//  PolygonView.m
//  HelloPoly
//
//  Created by Ezra Spier on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

@synthesize polygon;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	NSArray * polygonPoints = [PolygonView pointsForPolygonInRect:rect numberOfSides:polygon.numberOfSides];

	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextBeginPath(context);

	// Move to first point
	CGPoint firstPoint = [[polygonPoints objectAtIndex:0] CGPointValue];
	CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
	
	// Add lines to subsequent points
	for (id value in polygonPoints) {
		if ([polygonPoints indexOfObject:value] != 0) {
			CGPoint point = [value CGPointValue];
			CGContextAddLineToPoint(context, point.x, point.y);		
		}
	}
	CGContextClosePath(context);

	[[UIColor grayColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextDrawPath(context, kCGPathFillStroke);
	
	label.text = [NSString stringWithFormat:@"%@", polygon.name];
}

- (void)dealloc {
    [super dealloc];
	
	[polygon release];
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides {
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
	float radius = 0.9 * center.x;
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides;
	float exteriorAngle = M_PI - angle;
	float rotationDelta = angle - (0.5 * exteriorAngle);
	for (int currentAngle = 0;
		 currentAngle < numberOfSides;
		 currentAngle++) { float newAngle = (angle * currentAngle) - rotationDelta;
		float curX = cos(newAngle) * radius;
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
	} return result;
}

@end
