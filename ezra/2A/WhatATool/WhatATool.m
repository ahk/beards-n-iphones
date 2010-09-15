#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	NSLog(@"My Home folder is at %@", path);
	
	NSArray *path_components = [path pathComponents];
	
	for (NSString *component in path_components) {
		NSLog(@"%@",component);
	}
}

void PrintProcessInfo() {
	NSString *processName = [[NSProcessInfo processInfo] processName];
	int processID = [[NSProcessInfo processInfo] processIdentifier];
	NSLog(@"Process Name: '%@' Process ID: '%i' ", processName, processID);
}

void PrintBookmarkInfo() {
	NSMutableDictionary *bookmarks = [NSMutableDictionary dictionaryWithObject:[NSURL URLWithString:@"http://www.stanford.edu"] 
																		forKey:@"Stanford University"];
	[bookmarks setObject:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
	[bookmarks setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
	[bookmarks setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
	[bookmarks setObject:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];	

	for(NSString *key in bookmarks) {
		if ([key hasPrefix:@"Stanford"]) {
			NSLog(@"Key: '%@' URL: '%@'", key, [bookmarks objectForKey:key]);
		}
	}
	
//	NSLog(@" dict: %@", bookmarks);
}

void PrintIntrospectionInfo() {
	NSMutableArray *objects = [NSMutableArray array];
	[objects addObject:@"Test String"];
	[objects addObject:[NSURL URLWithString:@"http://www.apple.com"]];
	[objects addObject:[NSProcessInfo processInfo]];
	[objects addObject:[NSMutableDictionary dictionaryWithObject:[NSURL URLWithString:@"http://www.stanford.edu"] 
														  forKey:@"Stanford University"]];
	[objects addObject:[NSMutableString stringWithString:@"Test Mutable String"]];
	[objects addObject:[NSMutableString stringWithString:@"Test Mutable String 2"]];
	
	SEL sel = @selector(lowercaseString);
	
	for(id obj in objects) {
		NSLog(@"Class Name: %@", [obj class]);
		NSLog(@"Is member of NSString: %@", ([obj isMemberOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Is kind of NSString: %@", ([obj isKindOfClass:[NSString class]] ? @"YES" : @"NO"));
		NSLog(@"Responds to lowercaseString: %@", ([obj respondsToSelector:sel] ? @"YES" : @"NO"));
		if ([obj respondsToSelector:sel]) {
			NSLog(@"lowercaseString is: %@", [obj performSelector:sel]);
		}
		NSLog(@"============================");
	}
}

void PrintPolygonInfo() {
	NSMutableArray *polygons = [[NSMutableArray alloc] init];
	
	PolygonShape *square = [[PolygonShape alloc] initWithNumberOfSides:4 minimumNumberOfSides:3 maximumNumberOfSides:7];
	[polygons addObject:square];
	NSLog(@"%@", square);

	PolygonShape *hexagon = [[PolygonShape alloc] init];
	[hexagon setMinimumNumberOfSides:5];
	[hexagon setMaximumNumberOfSides:9];
	[hexagon setNumberOfSides:6];
	[polygons addObject:hexagon];
	NSLog(@"%@", hexagon);
	
	PolygonShape *dodecagon = [[PolygonShape alloc] initWithNumberOfSides:12 minimumNumberOfSides:9 maximumNumberOfSides:12];
	[polygons addObject:dodecagon];
	NSLog(@"%@", dodecagon);
	
	for (PolygonShape *polygon in polygons) {
		[polygon setNumberOfSides:10];
	}
	
	[square release];
	[hexagon release];
	[dodecagon release];
	[polygons release];
	
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

//    PrintPathInfo();
//	PrintProcessInfo();
//	PrintBookmarkInfo();
//	PrintIntrospectionInfo();
	PrintPolygonInfo();
	
	[pool drain];
    return 0;
}
