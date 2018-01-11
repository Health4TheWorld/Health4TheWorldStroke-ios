//
//  ArmLevel3ViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 1/7/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "ArmLevel3ViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"

@interface ArmLevel3ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end


#define ARM_LEVEL3_IMG1 @"Level3_3711_Img"
#define ARM_LEVEL3_IMG2 @"Level3_3713_Img"
#define ARM_LEVEL3_IMG3 @"Level3_3714_Img"
#define ARM_LEVEL3_IMG4 @"Level3_3566_Img"
#define ARM_LEVEL3_IMG5 @"Level3_3567_Img"

@implementation ArmLevel3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Exercises.arms.level3", nil) uppercaseString];
    
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
    self.welcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, 0)];
    self.welcomeMessage.text = NSLocalizedString(@"Exercises.arms.level3.instruction", nil);
    self.welcomeMessage.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    self.welcomeMessage.textColor = HFTW_TEXT_GRAY;
    self.welcomeMessage.numberOfLines = 0;
    self.welcomeMessage.textAlignment = NSTextAlignmentLeft;
    [self.welcomeMessage sizeToFit];
    CGRect welcomeMessageFrame = self.welcomeMessage.frame;
    welcomeMessageFrame.size.height = [Utils heightOfString:self.welcomeMessage.text containedToWidth:welcomeMessageFrame.size.width withFont:self.welcomeMessage.font];
    self.welcomeMessage.frame = welcomeMessageFrame;
    startingY += (welcomeMessageFrame.size.height + 20);
    
    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    
    HomeButton *a1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level3.1", nil)   withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a1Button addRoundImageCentered:[UIImage imageNamed:ARM_LEVEL3_IMG1] ];
    [a1Button addTarget:self action:@selector(a1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *b1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level3.2", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [b1Button addRoundImageCentered:[UIImage imageNamed:ARM_LEVEL3_IMG2]];
    [b1Button addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *c1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level3.3", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [c1Button addRoundImageCentered:[UIImage imageNamed:ARM_LEVEL3_IMG3]];
    [c1Button addTarget:self action:@selector(c1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *d1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level3.4", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [d1Button addRoundImageCentered: [UIImage imageNamed:ARM_LEVEL3_IMG4]];
    [d1Button addTarget:self action:@selector(d1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *g1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level3.5", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [g1Button addSquaredImageCentered: [UIImage imageNamed:ARM_LEVEL3_IMG5] withSize: 210];
    [g1Button addTarget:self action:@selector(g1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    startingY += 50;
    
    [self.contentView addSubview: a1Button];
    [self.contentView addSubview: b1Button];
    [self.contentView addSubview: c1Button];
    [self.contentView addSubview: d1Button];
    [self.contentView addSubview: g1Button];
    [self.contentView addSubview: self.welcomeMessage];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)a1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.arms.level3.1", nil) ;
    [videoVC setUpVideo: VIDEO_ARM_LEVEL3_1];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)b1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.arms.level3.2", nil) ;
    [videoVC setUpVideo: VIDEO_ARM_LEVEL3_2];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)c1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.arms.level3.3", nil) ;
    [videoVC setUpVideo: VIDEO_ARM_LEVEL3_3];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)d1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.arms.level3.4", nil) ;
    [videoVC setUpVideo: VIDEO_ARM_LEVEL3_4];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)g1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.arms.level3.5", nil) ;
    [videoVC setUpVideo: VIDEO_ARM_LEVEL3_5];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


@end
