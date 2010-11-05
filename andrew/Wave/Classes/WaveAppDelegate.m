//
//  WaveAppDelegate.m
//  Wave
//
//  Created by Andrew Kurtz on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WaveAppDelegate.h"

#define BUFFER_SIZE 16384
#define BUFFER_COUNT 3
static AudioQueueRef audioQueue;
static OSStatus err;


static void AudioQueueCallback(void* inUserData, AudioQueueRef inAQ,
                        AudioQueueBufferRef inBuffer) {
	//    void* pBuffer = inBuffer->mAudioData;
//	int16_t* pcm_buf = inBuffer->mAudioData;
	short int *pcm_buf = (short int*) inBuffer->mAudioData;
    // fill with a sine wave
	//    for(int s = 0; s < 0; s++) {
	//        pcm_buf[s] = sin(2*pi*s);
	//    }
	//srand(time(NULL));
	UInt32 bytes = inBuffer->mAudioDataBytesCapacity;
	// fill with a sine wave
    for (int f = 0; f < bytes/2; f++) {
		// replace 3 with pi
        pcm_buf[f] = lrint(sin(2*3.1459*f/(bytes/2)) * 1000000);
    }
    // Write max <bytes> bytes of audio to <pBuffer>
    inBuffer->mAudioDataByteSize = bytes/2;
    err = AudioQueueEnqueueBuffer(audioQueue, inBuffer, 0, NULL);
}

static void SetupAudioQueue() {
	
    err = noErr;
    // Setup the audio device.
    AudioStreamBasicDescription deviceFormat;
    deviceFormat.mSampleRate = 44100;
    deviceFormat.mFormatID = kAudioFormatLinearPCM;
    deviceFormat.mFormatFlags = kLinearPCMFormatFlagIsSignedInteger;
    deviceFormat.mBytesPerPacket = 4;
    deviceFormat.mFramesPerPacket = 1;
    deviceFormat.mBytesPerFrame = 4;
    deviceFormat.mChannelsPerFrame = 2;
    deviceFormat.mBitsPerChannel = 16;
    deviceFormat.mReserved = 0;
    // Create a new output AudioQueue for the device.
    err = AudioQueueNewOutput(&deviceFormat, AudioQueueCallback, NULL,
                              CFRunLoopGetCurrent(), kCFRunLoopCommonModes,
                              0, &audioQueue);
    // Allocate buffers for the AudioQueue, and pre-fill them.
	AudioQueueBufferRef mBuffers[BUFFER_COUNT];
    for (int i = 0; i < BUFFER_COUNT; ++i) {
		// THIS LINE THROWS EXC_BAD_ACCESS
        err = AudioQueueAllocateBuffer(audioQueue, BUFFER_SIZE, &mBuffers[i]);
        if (err != noErr) break;
        AudioQueueCallback(NULL, audioQueue, mBuffers[i]);
    }
    if (err == noErr) err = AudioQueueStart(audioQueue, NULL);
    if (err == noErr) CFRunLoopRun();
}

@implementation WaveAppDelegate

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    [window makeKeyAndVisible];
	SetupAudioQueue();
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}



#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
