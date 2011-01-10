//
//  CalcucornViewController.m
//  Calcucorn
//
//  Created by Andrew Hay Kurtz on 12/14/10.
//  Copyright 2010 Noiseless Media. All rights reserved.
//

#import "CalcucornViewController.h"

@implementation CalcucornViewController

- (CalculatorBrain *)brain {
	if (!brain) brain = [[CalculatorBrain alloc] init];
	return brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
	NSString *digit = [[sender titleLabel] text];
	
	if (userIsInTheMiddleOfTypingANumber) {
		[display setText:[[display text] stringByAppendingString:digit]];
	} 
	else {
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;
	}
}
	
- (IBAction)operationPressed:(UIButton *)sender {
	if (userIsInTheMiddleOfTypingANumber) {
		[[self brain] setOperand:[[display text] doubleValue]];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText:[NSString stringWithFormat:@"%g", result]];
}

- (IBAction)dotPressed:(UIButton *)sender {
	if (userIsInTheMiddleOfTypingANumber) {
		NSString *currentText = [display text];
		// FUCK YES REGEX MATCHING IN OBJ-C ...
		NSError *error = NULL;
		NSRegularExpression *regex = [NSRegularExpression         
									  regularExpressionWithPattern:@"\\."
									  options:NSRegularExpressionCaseInsensitive
									  error:&error];
		NSUInteger dotMatches = [regex numberOfMatchesInString:currentText 
													   options:0
														 range:NSMakeRange(0, [currentText length])];
		
		if(dotMatches < 1) {
		   [display setText:[[display text] stringByAppendingString:@"."]];
		}
		return;
	}
	else {
		[display setText:@"0."];
		userIsInTheMiddleOfTypingANumber = YES;
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
