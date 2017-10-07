//
//  ArmsAndHandsViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/20/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "ArmsAndHandsViewController.h"
#import "Constants.h"
#import "HomeButton.h"
#import "HandStretchViewController.h"
#import "ShoulderStretchViewController.h"
#import "ArmStretchViewController.h"


@interface ArmsAndHandsViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ArmsAndHandsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Stretching.armsAndHands", nil) uppercaseString];
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON];
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
    float cellHeight = cellWidth;
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *handStretchButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.handStretch", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [handStretchButton addImageCentered:[UIImage imageNamed:STRETCHING_HAND_STRETCH_1]];
    [handStretchButton addTarget:self action:@selector(handStretchPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *shoulderStretchButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.shoulderStretch", nil) withFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [shoulderStretchButton addImageCentered:[UIImage imageNamed:STRETCHING_SHOULDER_STRETCH_1]];
    [shoulderStretchButton addTarget:self action:@selector(shoulderStretchPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *armStretchButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.armStretch", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [armStretchButton addImageCentered:[UIImage imageNamed:STRETCHING_ARM_STRETCH_1]];
    [armStretchButton addTarget:self action:@selector(armStretchPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.contentView addSubview: handStretchButton];
    [self.contentView addSubview: shoulderStretchButton];
    [self.contentView addSubview: armStretchButton];
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

/* Action listeners for buttons */

- (void)handStretchPressed {
    HandStretchViewController *vc = [[HandStretchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)shoulderStretchPressed {
    ShoulderStretchViewController *vc = [[ShoulderStretchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)armStretchPressed {
    ArmStretchViewController *vc = [[ArmStretchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
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
