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
@property (strong, nonatomic) UILabel *welcomeMessage;

@end

@implementation FunctionalMobilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"FUNCTIONAL MOBILITY";
    
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
    
    /* Text view */
    
    self.welcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, 0)];
    self.welcomeMessage.text = EXERCISE_PARAGRAPH_ONE;
    self.welcomeMessage.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    self.welcomeMessage.textColor = HFTW_TEXT_GRAY;
    self.welcomeMessage.numberOfLines = 0;
    self.welcomeMessage.textAlignment = NSTextAlignmentLeft;
    [self.welcomeMessage sizeToFit];
    CGRect welcomeMessageFrame = self.welcomeMessage.frame;
    welcomeMessageFrame.size.height = [Utils heightOfString:self.welcomeMessage.text containedToWidth:welcomeMessageFrame.size.width withFont:self.welcomeMessage.font];
    self.welcomeMessage.frame = welcomeMessageFrame;
    startingY += (welcomeMessageFrame.size.height + 20);
    
    /* Functional Mobility buttons*/
    
    HomeButton *a4Button = [[HomeButton alloc] initWithText:@"Bridge Hip Lift" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a4Button addRoundImageCentered:[UIImage imageNamed:FUNCTIONALMOBILITY_4A]];
    [a4Button addTarget:self action:@selector(a4Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *b4Button = [[HomeButton alloc] initWithText:@"Arm Trunk Strengthening" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [b4Button addRoundImageCentered:[UIImage imageNamed:FUNCTIONALMOBILITY_4B]];
    [b4Button addTarget:self action:@selector(b4Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *c4Button = [[HomeButton alloc] initWithText:@"Sit To Stand" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [c4Button addRoundImageCentered:[UIImage imageNamed:FUNCTIONALMOBILITY_4C]];
    [c4Button addTarget:self action:@selector(c4Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    [self.contentView addSubview: a4Button];
    [self.contentView addSubview: b4Button];
    [self.contentView addSubview: c4Button];
    [self.contentView addSubview:self.welcomeMessage];
    
    
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
