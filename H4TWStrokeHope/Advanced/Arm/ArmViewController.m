//
//  ArmViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 1/7/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "ArmViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"
#import "ArmLevel1ViewController.h"
#import "ArmLevel2ViewController.h"
#import "ArmLevel3ViewController.h"
#import "ArmLevel4ViewController.h"

@interface ArmViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end

#define ArmLevel1Pic @"Level1"
#define ArmLevel2Pic @"Level2Img"
#define ArmLevel3Pic @"Level3Img"
#define ArmLevel4Pic @"Level4Img"
@implementation ArmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Exercises.arms", nil) uppercaseString];
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(10, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *a1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level1", nil)   withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a1Button addRoundImageCentered:[UIImage imageNamed:ArmLevel1Pic] ];
    [a1Button addTarget:self action:@selector(a1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *b1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level2", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [b1Button addRoundImageCentered:[UIImage imageNamed:ArmLevel2Pic]];
    [b1Button addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *c1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level3", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [c1Button addRoundImageCentered:[UIImage imageNamed:ArmLevel3Pic]];
    [c1Button addTarget:self action:@selector(c1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *d1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms.level4", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [d1Button addRoundImageCentered: [UIImage imageNamed:ArmLevel4Pic]];
    [d1Button addTarget:self action:@selector(d1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    startingY += 50;
    
    [self.contentView addSubview: a1Button];
    [self.contentView addSubview: b1Button];
    [self.contentView addSubview: c1Button];
    [self.contentView addSubview: d1Button];
    [self.contentView addSubview: self.welcomeMessage];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)a1Pressed {
    ArmLevel1ViewController *vc = [[ArmLevel1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)b1Pressed {
    ArmLevel2ViewController *vc = [[ArmLevel2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)c1Pressed {
    ArmLevel3ViewController *vc = [[ArmLevel3ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)d1Pressed {
    ArmLevel4ViewController *vc = [[ArmLevel4ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


@end
