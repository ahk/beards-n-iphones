#import <Foundation/Foundation.h>

// Pass in objects one by one with collect:
// and the Collector will report statistics about those objects.

@interface Collector : NSObject
{
	NSMutableDictionary *counts;
	double minimumAllowedNumber;
	double maximumAllowedNumber;
}

// Pass in an object here

- (void)collect:(id)anObject;

// Statistics

@property (readonly) int totalStringCount;			// how many times an NSString object was passed in
@property (readonly) int totalNumberCount;			// how many times an NSNumber object was passed in
@property (readonly) int capitalizedStringCount;	// how many times a capitalized NSString was passed in

@property (readonly) NSSet *strings;		// all the unique NSString objects that were ever passed in
@property (readonly) NSSet *numbers;		// all the unique NSNumber objects that were ever passed in

@property double minimumAllowedNumber;		// ignore NSNumber objects smaller than this
@property double maximumAllowedNumber;		// ignore NSNumber objects bigger than this

@end
