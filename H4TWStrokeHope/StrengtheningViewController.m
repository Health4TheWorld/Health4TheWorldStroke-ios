//
//  StrengtheningViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/16/17.
//  Copyright © 2017 Rachel. All rights reserved.
//


#import "StrengtheningViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "ArmsViewController.h"
#import "LegsViewController.h"
#import "CoordinationViewController.h"

@interface StrengtheningViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation StrengtheningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"STRENGTHENING";
    
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
    float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    float cellHeight = cellWidth;
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *legsButton = [[HomeButton alloc] initWithText:@"Legs" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [legsButton addImageTopRight:[UIImage imageNamed:STRONG_LEG_ICON]];
    [legsButton addTarget:self action:@selector(legsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *armsButton = [[HomeButton alloc] initWithText:@"Arms" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [armsButton addImageRightCenter:[UIImage imageNamed:STRONG_ARM_ICON]];
    [armsButton addTarget:self action:@selector(armsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *coordinationButton = [[HomeButton alloc] initWithText:@"Coordination" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [coordinationButton addCoordinationImage:[UIImage imageNamed:BALANCE_ICON]];
    [coordinationButton addTarget:self action:@selector(coordinationPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.contentView addSubview: legsButton];
    [self.contentView addSubview: armsButton];
    [self.contentView addSubview: coordinationButton];
    
    
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

- (void)armsPressed {
    ArmsViewController *vc = [[ArmsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)legsPressed {
    LegsViewController *vc = [[LegsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)coordinationPressed {
    CoordinationViewController *vc = [[CoordinationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
