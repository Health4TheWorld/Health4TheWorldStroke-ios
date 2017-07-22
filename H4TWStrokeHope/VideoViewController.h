//
//  VideoViewController.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/13/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoViewController : UIViewController

- (void)setUpVideo: (NSString *) videoName;
- (void) videoPlayerSetup: (NSURL *) url;

- (AVPlayerViewController *)setUpCustomVideo: (NSString *) videoName withFrame: (CGRect *) frame;

@end
