//
//  SittingViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 1/1/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "SittingViewController.h"


#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"
#import "LearnContentViewController.h"
#import "ImgViewController.h"

@interface SittingViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end

@implementation SittingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Exercises.balanceTraining.sitting", nil) uppercaseString];
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    /* Setup the view */
    [self setUpView];
}


- (void)setUpView {
    
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    float startingY = SPACE_BETWEEN_CELLS;
    //Heading: Sitting with one hand support 3721

    HomeButton *h1 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.sitting.H1", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h1 addImageCentered:[UIImage imageNamed:BT_Sitting_3521]];
    [h1 addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    //Heading: Sitting with no hand support    3722

    HomeButton *h2 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.sitting.H2", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [h2 addImageCentered:[UIImage imageNamed:BT_Sitting_3522]];
    [h2 addTarget:self action:@selector(b2Pressed) forControlEvents:UIControlEventTouchUpInside];
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    cellHeight = cellWidth;
   /*
    sitting and leaning in different directions: #3571, 3572
    https://vimeo.com/248618873
    https://vimeo.com/248618875
    */
    HomeButton *v1 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.sitting.H3", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [v1 addImageBottomRight:[UIImage imageNamed:BT_Sitting_3522]];
    [v1 addTarget:self action:@selector(b3Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *v2 = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining.sitting.H3", nil) withFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width/ 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [v2 addImageBottomRight:[UIImage imageNamed:BT_Sitting_3521]];
    [v2 addTarget:self action:@selector(b4Pressed) forControlEvents:UIControlEventTouchUpInside];

    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    [self.contentView addSubview: h1];
    [self.contentView addSubview: h2];
    [self.contentView addSubview: v1];
    [self.contentView addSubview: v2];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Action listeners for buttons */
- (void)b1Pressed {
    ImgViewController *vc = [[ImgViewController alloc] init];
    vc.title = NSLocalizedString(@"Exercises.balanceTraining.sitting.H1", nil) ;
    vc.imgName = @"3721.jpg";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)b2Pressed {
    ImgViewController *vc = [[ImgViewController alloc] init];
    vc.title = NSLocalizedString(@"Exercises.balanceTraining.sitting.H2", nil) ;
    vc.imgName = @"3722.jpg";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)b3Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.balanceTraining.sitting.H3", nil) ;
    [videoVC setUpVideo: VIDEO_BT_SITTING_3571];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)b4Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.balanceTraining.sitting.H3", nil) ;
    [videoVC setUpVideo: VIDEO_BT_SITTING_3572];
    [self.navigationController pushViewController:videoVC animated:YES];
}
@end
