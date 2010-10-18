//
//  PolygonView.h
//  HelloPoly
//
//  Created by Ezra Spier on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"


@interface PolygonView : UIView {
	PolygonShape *polygon;
	IBOutlet UILabel *label;
}

@property(nonatomic, retain) IBOutlet PolygonShape *polygon;

// Class method provided in assignment instructions
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
