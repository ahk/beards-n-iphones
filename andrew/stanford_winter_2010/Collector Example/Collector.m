#import "Collector.h"

@implementation Collector

@synthesize minimumAllowedNumber;
@synthesize maximumAllowedNumber;

// Totals up the values (counts) of our NSMutableDictionary for each key that is of the given class
// Note the nested call to intValue sent to the NSNumber returned from objectForKey:.

- (int)countOfClass:(Class)aClass
{
	int total = 0;
	for (id key in counts) {
		if ([key isKindOfClass:aClass]) {
			total += [[counts objectForKey:key] intValue];
		}
	}
	return total;
}

- (int)totalNumberCount
{
	return [self countOfClass:[NSNumber class]];
}

- (int)totalStringCount
{
	return [self countOfClass:[NSString class]];
}

// Returns all the keys in our NSMutableDictionary that are of the given class
// Note lazy instantiation of returnValue.  We return nil if we collected no objects of that class.

- (NSSet *)objectsOfClass:(Class)aClass
{
	NSMutableSet *returnValue = nil;
	for (id key in counts) {
		if ([key isKindOfClass:aClass]) {
			if (!returnValue) returnValue = [NSMutableSet set];
			[returnValue addObject:key];
		}
	}
	return returnValue;
}

- (NSSet *)strings
{
	return [self objectsOfClass:[NSString class]];
}

- (NSSet *)numbers
{
	return [self objectsOfClass:[NSNumber class]];
}

// Same as totalStringCount, but ignores all keys except those which are capitalized.
// Notice that the "capitalization" of HELLO is Hello.
// This is pretty inefficient, but done this way just to demonstrate using our own property internally.

- (int)capitalizedStringCount
{
	int total = 0;
	for (NSString *key in self.strings) {
		if ([key isEqualToString:[key capitalizedString]]) {
			total += [[counts objectForKey:key] intValue];
		}
	}
	return total;
}

// First check to be sure the object is either an NSNumber (and within our allowed range) or an NSString.
// Then increment the count for this object in the counts NSDictionary.
// Note that if count is nil (i.e. this is the first time we've seen this object), [count intValue] is conveniently zero.

- (void)collect:(id)anObject
{
	if ([anObject isKindOfClass:[NSNumber class]]) {
		double value = [anObject doubleValue];
		if ((self.minimumAllowedNumber < self.maximumAllowedNumber) &&
			((value < self.minimumAllowedNumber) || (value > self.maximumAllowedNumber))) {
			anObject = nil;
		}
	} else if (![anObject isKindOfClass:[NSString class]]) {
		anObject = nil;
	}

	if (anObject) {
		NSNumber *count = [counts objectForKey:anObject];
		if (!counts) counts = [[NSMutableDictionary alloc] init];
		[counts setObject:[NSNumber numberWithInt:[count intValue]+1] forKey:anObject];
	}
}

// Release our NSMutableDictionary.
// All the keys and values inside of it will be released as well.
// They were all sent retain when we used setObject:forKey: to add them.

- (void)dealloc
{
	[counts release];
	[super dealloc];
}

@end
