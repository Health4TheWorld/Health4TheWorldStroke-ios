//
//  FunctionalMobilityViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/16/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "FunctionalMobilityViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "VideoViewController.h"

@interface FunctionalMobilityViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation FunctionalMobilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FunctionalMobility";
    
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
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *a4Button = [[HomeButton alloc] initWithText:@"4A Bridge Hip Lift" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a4Button addImageFullSize:[UIImage imageNamed:FUNCTIONALMOBILITY_4A]];
    [a4Button addTarget:self action:@selector(a4Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *b4Button = [[HomeButton alloc] initWithText:@"4B Arm Trunk Strengthening" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [b4Button addImageFullSize:[UIImage imageNamed:FUNCTIONALMOBILITY_4B]];
    [b4Button addTarget:self action:@selector(b4Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    //cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *c4Button = [[HomeButton alloc] initWithText:@"4C Sit To Stand" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [c4Button addImageFullSize:[UIImage imageNamed:FUNCTIONALMOBILITY_4C]];
    [c4Button addTarget:self action:@selector(c4Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: a4Button];
    [self.contentView addSubview: b4Button];
    [self.contentView addSubview: c4Button];
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
    
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
/* Action listeners for buttons */

- (void)a4Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    [videoVC setUpVideo: VIDEO_4A_BRIDGE_HIP_LIFT];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)b4Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    [videoVC setUpVideo: VIDEO_4B_ARM_AND_STRENGTHENING];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)c4Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    [videoVC setUpVideo: VIDEO_4C_SIT_TO_STAND];
    [self.navigationController pushViewController:videoVC animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
