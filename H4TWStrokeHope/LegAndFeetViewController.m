//
//  LegAndFeetViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/20/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LegAndFeetViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "AdductorsViewController.h"
#import "HamstringsViewController.h"
#import "DorsiflexorsViewController.h"
#import "AWSDynamoDBHelper.h"

@interface LegAndFeetViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation LegAndFeetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Stretching.legsAndFeet", nil) uppercaseString];
    
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
    float cellHeight = cellWidth;
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *adductorsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.adductors", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [adductorsButton addImageCentered:[UIImage imageNamed:STRETCHING_LEG_STRETCH_1]];
    [adductorsButton addTarget:self action:@selector(adductorsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *hamstringsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.hamstrings", nil) withFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [hamstringsButton addImageCentered:[UIImage imageNamed:STRETCHING_KNEE_STRETCH_1]];
    [hamstringsButton addTarget:self action:@selector(hamstringsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *dorsiflexorsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.dorsiflexors", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [dorsiflexorsButton addImageCentered:[UIImage imageNamed:STRETCHING_ANKLE_STRETCH_1]];
    [dorsiflexorsButton addTarget:self action:@selector(dorsiflexorsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.contentView addSubview: adductorsButton];
    [self.contentView addSubview: hamstringsButton];
    [self.contentView addSubview: dorsiflexorsButton];
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

/* Action listeners for buttons */

- (void)adductorsPressed {
    AdductorsViewController *vc = [[AdductorsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Adductors", @"Sub-Section"]];
}

- (void)hamstringsPressed {
    HamstringsViewController *vc = [[HamstringsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Hamstrings", @"Sub-Section"]];
}

- (void)dorsiflexorsPressed {
    DorsiflexorsViewController *vc = [[DorsiflexorsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Dorsiflexors", @"Sub-Section"]];
}


- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Back Button", @"NA"]];
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
