//
//  VRViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 5/12/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "VRViewController.h"
#import "Constants.h"

@interface VRViewController ()
@property (strong, nonatomic) IBOutlet GVRVideoView *videoVRView;
@property BOOL isPaused;
@end

@implementation VRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    [self setUpView];
}

- (void) setUpView {
    
   // self.videoVRView = [[GVRVideoView alloc] init];
    
    // Set VR view delegate to self
    self.videoVRView.delegate = self;
    
    // Enable both cardboard button and fullscreen mode button
    self.videoVRView.enableCardboardButton = true;
    self.videoVRView.enableFullscreenButton = true;
    self.videoVRView.enableTouchTracking = true;
    
    // Hide the contents until the view loads fully
    //self.videoVRView.hidden = true;
    
    self.isPaused = YES;
    
    [self.videoVRView loadFromUrl: self.videoURL];
    
    self.currentDisplayMode = kGVRWidgetDisplayModeEmbedded;
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - GVRWidgetView Delegate

-(void) widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content{
    NSLog(@"Finished loading video");
    //if(content == self.videoURL){
      //  self.videoVRView.hidden = false;
    //}
    
    [self.videoVRView play];
    self.isPaused = NO;
}

- (void) widgetView:(GVRWidgetView *)widgetView didFailToLoadContent:(id)content withErrorMessage:(NSString *)errorMessage {
    NSLog(@"Failed to load video - error :  %@", errorMessage);
}

-(void) widgetView:(GVRWidgetView *)widgetView didChangeDisplayMode:(GVRWidgetDisplayMode)displayMode {
    self.currentView = widgetView;
    self.currentDisplayMode = displayMode;
}

- (void) widgetViewDidTap:(GVRWidgetView *)widgetView {
    // Action for when the GVR View is tapped
    if (self.isPaused) {
        [self.videoVRView play];
    } else {
        [self.videoVRView pause];
    }
    self.isPaused = !self.isPaused;
}

- (void)videoView:(GVRVideoView*)videoView didUpdatePosition:(NSTimeInterval)position {
    // Loop the video when it reaches the end.
    if (position == self.videoVRView.duration) {
        [self.videoVRView seekTo:0];
        [self.videoVRView play];
    }
}


@end
