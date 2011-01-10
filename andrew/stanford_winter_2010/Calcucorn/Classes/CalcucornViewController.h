//
//  CalcucornViewController.h
//  Calcucorn
//
//  Created by Andrew Hay Kurtz on 12/14/10.
//  Copyright 2010 Noiseless Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalcucornViewController : UIViewController {
	IBOutlet UILabel *display;
	CalculatorBrain *brain;
	BOOL userIsInTheMiddleOfTypingANumber;
}

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)dotPressed:(UIButton *)sender;
@end

