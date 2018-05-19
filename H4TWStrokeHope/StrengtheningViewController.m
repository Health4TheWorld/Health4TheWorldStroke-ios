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
#import "AWSDynamoDBHelper.h"

@interface StrengtheningViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;
@end

@implementation StrengtheningViewController
-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Strengthening.title", nil) uppercaseString];
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    /* Setup the view */
    [self setUpView];
}


- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float startingY = SPACE_BETWEEN_CELLS;
    
    /* Text view */
    
    self.welcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, 0)];
    self.welcomeMessage.text = EXERCISE_PARAGRAPH_ONE;
    self.welcomeMessage.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    self.welcomeMessage.textColor = HFTW_TEXT_GRAY;
    self.welcomeMessage.numberOfLines = 0;
    self.welcomeMessage.textAlignment = NSTextAlignmentLeft;
    [self.welcomeMessage sizeToFit];
    CGRect welcomeMessageFrame = self.welcomeMessage.frame;
    welcomeMessageFrame.size.height = [Utils heightOfString:self.welcomeMessage.text containedToWidth:welcomeMessageFrame.size.width withFont:self.welcomeMessage.font];
    self.welcomeMessage.frame = welcomeMessageFrame;
    startingY += (welcomeMessageFrame.size.height + 20);
    
    /* Strengthening buttons */
    cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    float cellHeight = cellWidth;
    
    HomeButton *legsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Strenghtening.legs", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [legsButton addImageTopRight:[UIImage imageNamed:STRONG_LEG_ICON]];
    [legsButton addTarget:self action:@selector(legsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *armsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Strengthening.arms", nil) withFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width/ 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellHeight)];
    [armsButton addImageTopRight:[UIImage imageNamed:STRONG_ARM_ICON]];
    [armsButton addTarget:self action:@selector(armsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *coordinationButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Strengthening.coordination", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [coordinationButton addCoordinationImage:[UIImage imageNamed:BALANCE_ICON]];
    [coordinationButton addTarget:self action:@selector(coordinationPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    
    [self.contentView addSubview: legsButton];
    [self.contentView addSubview: armsButton];
    [self.contentView addSubview: coordinationButton];
    [self.contentView addSubview:self.welcomeMessage];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
    
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Back Button", @"NA"]];
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
    ArmsViewController *vc = [[ArmsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Arms", @"Sub-Section"]];
}

- (void)legsPressed {
    LegsViewController *vc = [[LegsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Legs", @"Sub-Section"]];
}

- (void)coordinationPressed {
    CoordinationViewController *vc = [[CoordinationViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Coordination", @"Sub-Section"]];
}


@end
