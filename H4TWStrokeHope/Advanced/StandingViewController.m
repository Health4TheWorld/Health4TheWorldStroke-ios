//
//  StandingViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 1/7/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "StandingViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"
#import "LearnContentViewController.h"
#import "ImgViewController.h"
#import "StandingH1ViewController.h"
#import "StandingH2ViewController.h"
#import "StandingH3ViewController.h"

@interface StandingViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end

@implementation StandingViewController

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Exercises.balanceTraining.Standing", nil) uppercaseString];
    
    /* Back button */
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
    
    HomeButton *h1 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.Standing.H1", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h1 addImageCentered:[UIImage imageNamed:BT_Standing_3729]];
    [h1 addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *h2 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.Standing.H2", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h2 addImageCentered:[UIImage imageNamed:BT_Standing_img_3574]];
    [h2 addTarget:self action:@selector(b2Pressed) forControlEvents:UIControlEventTouchUpInside];
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    

    /*
     sitting and leaning in different directions: #3571, 3572
     https://vimeo.com/248618873
     https://vimeo.com/248618875
     */
    HomeButton *v1 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.Standing.H3", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [v1 addImageCentered:[UIImage imageNamed:BT_Sitting_sitting_d]];
    [v1 addTarget:self action:@selector(b3Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: h1];
    [self.contentView addSubview: h2];
    [self.contentView addSubview: v1];
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
    StandingH1ViewController *vc = [[StandingH1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)b2Pressed {
    StandingH2ViewController *vc = [[StandingH2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)b3Pressed {
    StandingH3ViewController *vc = [[StandingH3ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)b4Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.balanceTraining.sitting.H3", nil) ;
    [videoVC setUpVideo: VIDEO_BT_SITTING_3572];
    [self.navigationController pushViewController:videoVC animated:YES];
}

/*
 
 //Heading: Standing Practice. Pics #3729-3732

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








