//
//  StandingH3ViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 1/18/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "StandingH3ViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "VideoViewController.h"
#import "LearnContentViewController.h"
#import "ImgViewController.h"

@interface StandingH3ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end

@implementation StandingH3ViewController
-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Exercises.balanceTraining.Standing", nil) uppercaseString];
    
//    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(10, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    /* Setup the view */
    [self setUpView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpView {

    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    float startingY = SPACE_BETWEEN_CELLS;
    
    
    self.welcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, 0)];
    self.welcomeMessage.text = NSLocalizedString(@"Exercises.balanceTraining.Standing.H3", nil);
    self.welcomeMessage.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    self.welcomeMessage.textColor = HFTW_TEXT_GRAY;
    self.welcomeMessage.numberOfLines = 0;
    self.welcomeMessage.textAlignment = NSTextAlignmentLeft;
    [self.welcomeMessage sizeToFit];
    CGRect welcomeMessageFrame = self.welcomeMessage.frame;
    welcomeMessageFrame.size.height = [Utils heightOfString:self.welcomeMessage.text containedToWidth:welcomeMessageFrame.size.width withFont:self.welcomeMessage.font];
    self.welcomeMessage.frame = welcomeMessageFrame;
    startingY += (welcomeMessageFrame.size.height + 20);
    
    ///
//    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
//    cellHeight = cellWidth;
    
    HomeButton *h1 = [[HomeButton alloc] initWithText:@"1" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h1 addImageCentered:[UIImage imageNamed:BT_Standing_img_3575]];
    [h1 addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
//    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
//    cellHeight = cellWidth;
    
    
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *h2 = [[HomeButton alloc] initWithText:@"2" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h2 addImageCentered:[UIImage imageNamed:BT_Standing_img_3576]];
    [h2 addTarget:self action:@selector(b2Pressed) forControlEvents:UIControlEventTouchUpInside];
//    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
//    cellHeight = cellWidth;
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    
    HomeButton *h3 = [[HomeButton alloc] initWithText:@"3" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h3 addImageCentered:[UIImage imageNamed:BT_Standing_img_3578]];
    [h3 addTarget:self action:@selector(b3Pressed) forControlEvents:UIControlEventTouchUpInside];
    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    cellHeight = cellWidth;
    
    [self.contentView addSubview: h1];
    [self.contentView addSubview: h2];
    [self.contentView addSubview: h3];
    [self.contentView addSubview: self.welcomeMessage];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/* Action listeners for buttons */
- (void)b1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = @"1";
    [videoVC setUpVideo: BT_Standing_3575];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)b2Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = @"2";
    [videoVC setUpVideo: BT_Standing_3576];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)b3Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = @"3";
    [videoVC setUpVideo: BT_Standing_3578];
    [self.navigationController pushViewController:videoVC animated:YES];
}

/*
 Heading: Standing Practice. Pics #3729-3732
 3729
 3730
 3731
 3732
 Heading: “Standing and shifting weight side to side”
 (Video #3574, 3580)
 https://vimeo.com/248615543
 https://vimeo.com/248615561
 Heading: “Step tap”
 (Video #3575, 3576, 3578 )
 https://vimeo.com/248615549
 https://vimeo.com/248615555
 https://vimeo.com/248615560
 */
@end



