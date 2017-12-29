//
//  AdvancedViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 12/28/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AdvancedViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "ArmsViewController.h"
#import "FunctionalMobilityAdvViewController.h"
#import "BalanceTrainingAdvViewController.h"

@interface AdvancedViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end

@implementation AdvancedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Exercises.advancedExercises", nil) uppercaseString];
    
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
    //ARM
    HomeButton *armsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.arms", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [armsButton addImageTopRight:[UIImage imageNamed:STRONG_ARM_ICON]];
    [armsButton addTarget:self action:@selector(armsPressed) forControlEvents:UIControlEventTouchUpInside];
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    //Functional Mobility
    HomeButton *functionalMobilityButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.functionalMobility", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [functionalMobilityButton addImageCentered:[UIImage imageNamed:FUNCTIONAL_MOBILITY_ICON]];
    [functionalMobilityButton addTarget:self action:@selector(functionalMobilityButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;

    //Balance Training
    HomeButton *balanceTrainingButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.balanceTraining", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [balanceTrainingButton addCoordinationImage:[UIImage imageNamed:BALANCE_ICON]];
    [balanceTrainingButton addTarget:self action:@selector(balanceTrainingButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    
    [self.contentView addSubview: functionalMobilityButton];
    [self.contentView addSubview: armsButton];
    [self.contentView addSubview: balanceTrainingButton];
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
- (void)armsPressed {
}

- (void)functionalMobilityButtonPressed {
    FunctionalMobilityAdvViewController *vc = [[FunctionalMobilityAdvViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)balanceTrainingButtonPressed {
    BalanceTrainingAdvViewController *vc = [[BalanceTrainingAdvViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end

