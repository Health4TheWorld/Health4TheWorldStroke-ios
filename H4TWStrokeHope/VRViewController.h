//
//  VRViewController.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 5/12/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GVRWidgetView.h>
#import "GVRVideoViewManager.h"

@interface VRViewController : UIViewController<GVRWidgetViewDelegate>
@property (nonatomic) NSURL *videoURL;
//current view and display modes
@property UIView *currentView;
@property NSInteger currentDisplayMode;
// add instructions
@property NSString *instructions;
@end
