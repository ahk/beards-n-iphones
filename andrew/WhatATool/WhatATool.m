#import <Foundation/Foundation.h>

void PrintPathInfo() {
	NSLog(@"Section 1");
	NSLog(@"!!!!!!!!!");	
	NSString *path = @"~";
	NSString *home = [path stringByExpandingTildeInPath];
	NSString *aString = [NSString stringWithFormat:@"My home folder is at %@", home];
	NSLog(aString);
	
	NSArray *dirs = [home pathComponents];
	for(NSString *dir in dirs) {
		NSLog(dir);
	}
}

void PrintProcessInfo() {
	NSLog(@" ");
	NSLog(@"Section 2");
	NSLog(@"!!!!!!!!!");
	NSProcessInfo *info = [NSProcessInfo processInfo];
	int pid = [info processIdentifier];
	NSString *processName = [info processName];
	NSLog(processName);
	NSLog(@"%d",pid);
}

void PrintBookmarkInfo() {
	NSLog(@" ");	
	NSLog(@"Section 3");
	NSLog(@"!!!!!!!!!");
	NSString *s0 = @"Stanford University";
	NSString *s1 = @"Apple";
	NSString *s2 = @"CS193P";
	NSString *s3 = @"Stanford on iTunes U";
	NSString *s4 = @"Stanford Mall";
	
	NSURL *u0 = [NSURL URLWithString:@"http://www.stanford.edu"];
	NSURL *u1 = [NSURL URLWithString:@"http://www.apple.com"];
	NSURL *u2 = [NSURL URLWithString:@"http://cs193p.stanford.edu"];
	NSURL *u3 = [NSURL URLWithString:@"http://itunes.stanford.edu"];
	NSURL *u4 = [NSURL URLWithString:@"http://stanfordshop.com"];
	
	NSMutableDictionary *wordsURLS = [NSMutableDictionary dictionaryWithObjectsAndKeys:
									  u0, s0,
									  u1, s1,
									  u2, s2,
									  u3, s3,
									  u4, s4];
	
	for (NSString *key in wordsURLS) {
		if ([key hasPrefix:@"Stanford"]) {
			NSLog(@"Key: '%@' URL: '%@'", key, [wordsURLS objectForKey:key]);
		}
	}
}

void PrintIntrospectionInfo() {
	NSLog(@" ");	
	NSLog(@"Section 4");
	NSLog(@"!!!!!!!!!");
	NSMutableArray *ahhrrr = [NSMutableArray array];
	
	[ahhrrr addObject:@"larry b"];
	[ahhrrr addObject:[NSMutableString stringWithString:@"nsmutable thing"]];
	[ahhrrr addObject:[NSMutableArray array]];
	[ahhrrr addObject:[NSMutableArray array]];
	[ahhrrr addObject:[NSURL URLWithString:@"http://oberlin.edu"]];
	[ahhrrr addObject:[NSProcessInfo processInfo]];
	[ahhrrr addObject:[NSDictionary dictionaryWithObject:@"blazin!" forKey:@"what it is?"]];
	
	for (id thinger in ahhrrr) {
		NSLog(@"Class name: %@", [thinger class]);
		NSLog(@"Is Member of NSString: %@", ([thinger isMemberOfClass:[NSString class]]) ? @"YES" : @"NO");
		NSLog(@"Is Kind of NSString: %@", ([thinger isKindOfClass:[NSString class]]) ? @"YES" : @"NO");
		BOOL respondsTo = [thinger respondsToSelector:@selector(lowercaseString)];
		NSLog(@"Responds to lowercaseString: %@", respondsTo ? @"YES" : @"NO");
		if (respondsTo) {
			NSLog(@"lowercaseString is: %@", [thinger lowercaseString]);
		}
		NSLog(@"======================================");
	}
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	
    [pool drain];
    return 0;
}
