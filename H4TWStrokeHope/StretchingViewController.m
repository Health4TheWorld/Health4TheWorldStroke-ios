//
//  StretchingViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/16/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "StretchingViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "ArmsAndHandsViewController.h"
#import "LegAndFeetViewController.h"

@interface StretchingViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation StretchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"STRETCHING";
    
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
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *legAndFeetButton = [[HomeButton alloc] initWithText:@"Leg & Feet" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [legAndFeetButton addImageBottomRight:[UIImage imageNamed: STRONG_LEG_ICON]];
    [legAndFeetButton addTarget:self action:@selector(legAndFeetPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *armsAndHandsButton = [[HomeButton alloc] initWithText:@"Arms & Hands" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [armsAndHandsButton addImageRightCenter:[UIImage imageNamed:STRONG_ARM_ICON]];
    [armsAndHandsButton addTarget:self action:@selector(armsAndHandsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.contentView addSubview: legAndFeetButton];
    [self.contentView addSubview: armsAndHandsButton];

    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
    
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
/* Action listeners for buttons */

- (void)legAndFeetPressed {
    LegAndFeetViewController *vc = [[LegAndFeetViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)armsAndHandsPressed {
    ArmsAndHandsViewController *vc = [[ArmsAndHandsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
