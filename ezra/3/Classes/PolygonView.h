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
	int numberOfSides;
	NSString * polygonName;
	IBOutlet UILabel *label;
}

@property int numberOfSides;
@property(nonatomic, copy) NSString * polygonName;

// Class method provided in assignment instructions
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
