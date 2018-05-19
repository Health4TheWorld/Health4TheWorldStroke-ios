//
//  VRViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 5/12/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "VRViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "AWSDynamoDBHelper.h"

@interface VRViewController ()
@property BOOL isPaused;
@property CGFloat currentY;

@end

#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 10
#define VERTICAL_SPACE_BETWEEN_CELLS 10
@implementation VRViewController

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    [self setUpView];
}

- (void) setUpView {
    
    GVRVideoViewManager.sharedInstance.frame = CGRectMake(0, 94, 375, 210);
    
    // Set VR view delegate to self
    GVRVideoViewManager.sharedInstance.delegate = self;
    
    // Enable both cardboard button and fullscreen mode button
    
    GVRVideoViewManager.sharedInstance.enableCardboardButton = true;
    GVRVideoViewManager.sharedInstance.enableFullscreenButton = true;
    GVRVideoViewManager.sharedInstance.enableTouchTracking = true;
    
    // Hide the contents until the view loads fully
    
    self.isPaused = YES;

    [GVRVideoViewManager.sharedInstance loadFromUrl: self.videoURL];
    
    [self.view addSubview: GVRVideoViewManager.sharedInstance];
    
    self.currentDisplayMode = kGVRWidgetDisplayModeEmbedded;
    
    // Set Up VR Video instructions
    self.currentY = 375;
    /* Text view for Instructions */
    [self addMainText: self.instructions];
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
}

- (void)addMainText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *mainText = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    mainText.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    mainText.textAlignment = NSTextAlignmentLeft;
    mainText.textColor = HFTW_TEXT_GRAY;
    mainText.numberOfLines = 0;
    mainText.text = text;
    [mainText sizeToFit];
    CGRect mainTextFrame = mainText.frame;
    mainTextFrame.size.width = screenWidth - (2 * PAGE_MARGIN);
    mainTextFrame.size.height = [Utils heightOfString:text containedToWidth:mainTextFrame.size.width withFont:mainText.font];
    mainText.frame = mainTextFrame;
    
    [self.view addSubview:mainText];
    self.currentY += mainText.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Back Button", @"NA"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - GVRWidgetView Delegate

-(void) widgetView:(GVRWidgetView *)widgetView didLoadContent:(id)content{
    NSLog(@"Finished loading video");

    [GVRVideoViewManager.sharedInstance play];
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
        [GVRVideoViewManager.sharedInstance play];
    } else {
        [GVRVideoViewManager.sharedInstance pause];
    }
    self.isPaused = !self.isPaused;
}

- (void)videoView:(GVRVideoView*)videoView didUpdatePosition:(NSTimeInterval)position {
    if (position == GVRVideoViewManager.sharedInstance.duration){
        [GVRVideoViewManager.sharedInstance seekTo: 0];
        [GVRVideoViewManager.sharedInstance play];
    }
}


@end
