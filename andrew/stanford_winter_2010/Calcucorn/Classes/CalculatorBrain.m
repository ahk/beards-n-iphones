//
//  CalculatorBrain.m
//  Calcucorn
//
//  Created by Andrew Hay Kurtz on 12/14/10.
//  Copyright 2010 Noiseless Media. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain
- (void)setOperand:(double)aDouble {
	operand = aDouble;
}

- (void)performWaitingOperation {
	if ([@"+" isEqual:waitingOperation]) {
		operand = waitingOperand + operand;
	}
	else if ([@"*" isEqual:waitingOperation]) {
		operand = waitingOperand * operand; 
	} 
	else if ([@"-" isEqual:waitingOperation]) {
		operand = waitingOperand - operand;
	}
	else if ([@"/" isEqual:waitingOperation]) {
		if (operand) {
			operand = waitingOperand / operand;
		}
	}
}

- (double)performOperation:(NSString *)operation {
	if([operation isEqual:@"sqrt"]) {
		operand = sqrt(operand);
	} 
	else if ([@"+/-" isEqual:operation]) {
		operand = - operand;
	}
	else if ([@"sin" isEqual:operation]) {
		operand = sin(operand);
	}
	else if ([@"cos" isEqual:operation]) {
		operand = cos(operand);
	}
	else if ([@"1/x" isEqual:operation]) {
		if (operand) {
			operand = 1 / operand;			
		}
	}
	else if ([@"MemS" isEqual:operation]) {
		memory = operand;
	}
	else if ([@"MemR" isEqual:operation]) {
		operand = memory;
	}
	else if ([@"Mem+" isEqual:operation]) {
		memory = memory + operand;
	}
	else if ([@"C" isEqual:operation]) {
		memory = 0;
		operand = 0;
		waitingOperand = 0;
	}
	else {
		[self performWaitingOperation];
		waitingOperation = operation;
		waitingOperand = operand;
	}

	return operand;
}
@end
