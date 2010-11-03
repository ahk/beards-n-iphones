//
//  WaveAppDelegate.h
//  Wave
//
//  Created by Andrew Kurtz on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <AudioToolbox/AudioToolbox.h>

@interface WaveAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	OSStatus err;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

//void SetupAudioQueue();
//
//void AudioQueueCallback(void* inUserData, AudioQueueRef inAQ,
//						AudioQueueBufferRef inBuffer);

@end

