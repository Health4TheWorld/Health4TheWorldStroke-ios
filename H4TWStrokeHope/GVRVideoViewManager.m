//
//  GVRVideoViewManager.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/2/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "GVRVideoViewManager.h"

@implementation GVRVideoViewManager

+ (GVRVideoView*)sharedInstance {
    static GVRVideoView *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GVRVideoView alloc] init];
    });
    return sharedInstance;
}

@end
