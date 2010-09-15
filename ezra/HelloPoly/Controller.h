//
//  Controller.h
//
//  Created by Ezra Spier on 9/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
	IBOutlet UILabel *nameLabel;
	IBOutlet PolygonShape *polygon;
}
- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (void)updateInterface;
@end
