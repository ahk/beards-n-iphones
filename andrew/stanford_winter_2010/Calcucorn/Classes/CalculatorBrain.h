//
//  CalculatorBrain.h
//  Calcucorn
//
//  Created by Andrew Hay Kurtz on 12/14/10.
//  Copyright 2010 Noiseless Media. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
	double operand;
	double memory;
	NSString *waitingOperation;
	double waitingOperand;
}
- (void)setOperand:(double)aDouble;
- (double)performOperation:(NSString *)operation;
@end
