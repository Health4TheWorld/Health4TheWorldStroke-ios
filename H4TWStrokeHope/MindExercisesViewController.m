//
//  MindExercisesViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "MindExercisesViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "VRViewController.h"

@interface MindExercisesViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

#define VR_TITLE_BELLS @"Bells"
#define VR_TITLE_BUDDHA @"Buddha"
#define VR_TITLE_FLAGS @"Flags"
#define VR_TITLE_MARKET_PLACE_1 @"Market Place 1"
#define VR_TITLE_MARKET_PLACE_2 @"Market Place 2"
#define VR_TITLE_ROCKY_BEACH @"Rocky Beach"
#define VR_TITLE_SANDY_BEACH @"Sandy Beach"
@implementation MindExercisesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MIND EXERCISES";
    
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


- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    float cellHeight = cellWidth;
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *bellsButton = [[HomeButton alloc] initWithText: VR_TITLE_BELLS  withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [bellsButton addImageFullSize:[UIImage imageNamed:VR_CLIP_BELLS]];
    [bellsButton addTarget:self action:@selector(bellsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *buddhaButton = [[HomeButton alloc] initWithText: VR_TITLE_BUDDHA withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [buddhaButton addImageFullSize:[UIImage imageNamed:VR_CLIP_BUDDHA]];
    [buddhaButton addTarget:self action:@selector(buddhaPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *flagsButton = [[HomeButton alloc] initWithText: VR_TITLE_FLAGS withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [flagsButton addImageFullSize:[UIImage imageNamed:VR_CLIP_FLAGS]];
    [flagsButton addTarget:self action:@selector(flagsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *marketPlace1Button = [[HomeButton alloc] initWithText: VR_TITLE_MARKET_PLACE_1 withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [marketPlace1Button addImageFullSize:[UIImage imageNamed:VR_CLIP_MARKET_PLACE_1]];
    [marketPlace1Button addTarget:self action:@selector(marketPlace1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *marketPlace2Button = [[HomeButton alloc] initWithText: VR_TITLE_MARKET_PLACE_2 withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [marketPlace2Button addImageFullSize:[UIImage imageNamed:VR_CLIP_MARKET_PLACE_2]];
    [marketPlace2Button addTarget:self action:@selector(marketPlace2Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *rockyButton = [[HomeButton alloc] initWithText: VR_TITLE_ROCKY_BEACH withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [rockyButton addImageFullSize:[UIImage imageNamed:VR_CLIP_ROCKY_BEACH]];
    [rockyButton addTarget:self action:@selector(rockyPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *sandyButton = [[HomeButton alloc] initWithText: VR_TITLE_SANDY_BEACH withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [sandyButton addImageFullSize:[UIImage imageNamed:VR_CLIP_SANDY_BEACH]];
    [sandyButton addTarget:self action:@selector(sandyPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    [self.contentView addSubview: bellsButton];
    [self.contentView addSubview: buddhaButton];
    [self.contentView addSubview: flagsButton];
    [self.contentView addSubview: marketPlace1Button];
    [self.contentView addSubview: marketPlace2Button];
    [self.contentView addSubview: rockyButton];
    [self.contentView addSubview: sandyButton];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
    
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

/* Action listeners for buttons */

- (void)bellsPressed {
    
    VRViewController *vc = [[VRViewController alloc] init];
    // Local video
    //NSURL *url = [[NSBundle mainBundle] URLForResource:@"Bells" withExtension: @"mp4"];
    
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220082127.hd.mp4?s=609a47c79fc41735c5e10c735bc171b3ff02a7a9&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_BELLS;
    //Video Instructions
    vc.instructions = VR_BELLS_INSTRUCTIONS;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)buddhaPressed {
    VRViewController *vc = [[VRViewController alloc] init];
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220082376.hd.mp4?s=7ff60014fc882dd6f0f732f4aaa46c172c9dcb37&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_BUDDHA;
    //Video Instructions
    vc.instructions = VR_BUDDHA_INSTRUCTIONS;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)flagsPressed {
    VRViewController *vc = [[VRViewController alloc] init];
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220082275.hd.mp4?s=0d555e0984b540a45c80d02a07ea68c62c34ac39&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_FLAGS;
    //Video Instructions
    vc.instructions = VR_FLAGS_INSTRUCTIONS;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)marketPlace1Pressed {
    VRViewController *vc = [[VRViewController alloc] init];
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220082608.hd.mp4?s=88b7c3083855d20ee414ebeb6e36a7562fda631d&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_MARKET_PLACE_1;
    //Video Instructions
    vc.instructions = VR_MARKET_PLACE_1_INSTRUCTIONS;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)marketPlace2Pressed {
    VRViewController *vc = [[VRViewController alloc] init];
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220082795.hd.mp4?s=adb6102bc008cd95c8d20df8ad4d475d8dd06e53&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_MARKET_PLACE_2;
    //Video Instructions
    vc.instructions = VR_MARKET_PLACE_2_INSTRUCTIONS;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rockyPressed {
    VRViewController *vc = [[VRViewController alloc] init];
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220082847.hd.mp4?s=39da6e3c156c0f9a5a38fa5e0bd39faddac19aab&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_ROCKY_BEACH;
    //Video Instructions
    vc.instructions = VR_ROCKY_BEACH_INSTRUCTIONS;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)sandyPressed {
    VRViewController *vc = [[VRViewController alloc] init];
    //video on server location
    NSString *path = @"https://player.vimeo.com/external/220083158.hd.mp4?s=179b1c6c548acfca54381abc1b16a6797293c015&profile_id=119";
    NSURL *url = [[NSURL alloc] initWithString: path];
    vc.videoURL = url;
    //Video Title
    vc.title = VR_TITLE_SANDY_BEACH;
    //Video Instructions
    vc.instructions = VR_SANDY_BEACH_INSTRUCTIONS;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
