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
#import "AWSDynamoDBHelper.h"

@interface StretchingViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property float currentY;
@end


#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 10
@implementation StretchingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Stretching.title", nil) uppercaseString];
    
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
    
     self.currentY = SPACE_BETWEEN_CELLS;
    
    HomeButton *legAndFeetButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.legsAndFeet", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellWidth)];
    [legAndFeetButton addImageTopRight:[UIImage imageNamed: STRONG_LEG_ICON]];
    [legAndFeetButton addTarget:self action:@selector(legAndFeetPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *armsAndHandsButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Stretching.armsAndHands", nil) withFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), self.currentY, cellWidth, cellWidth)];
    [armsAndHandsButton addImageRightCenter:[UIImage imageNamed:STRONG_ARM_ICON]];
    [armsAndHandsButton addTarget:self action:@selector(armsAndHandsPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview: legAndFeetButton];
    [self.contentView addSubview: armsAndHandsButton];
    
    self.currentY += armsAndHandsButton.frame.size.height;
    self.currentY +=  SPACE_BETWEEN_CELLS * 4 ;
    
    [self addHeaderWithText:STRETCHING_INTRUCTIONS_TITLE];
    [self addSeparator];
    [self addBulletsPointWithText:STRETCHING_INSTRUCTIONS_BULLETS];

    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.currentY);
    
}

/* Adds header with a separator below. */
- (void)addHeaderWithText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    header.font = [UIFont fontWithName:@"Lato-bold" size:18.0];
    header.font = [UIFont boldSystemFontOfSize:18.0];
    header.textAlignment = NSTextAlignmentLeft;
    header.textColor = HFTW_TEXT_GRAY;
    header.numberOfLines = 0;
    header.text = text;
    [header sizeToFit];
    CGRect headerFrame = header.frame;
    headerFrame.size.width = screenWidth - (2 * PAGE_MARGIN);
    headerFrame.size.height = [Utils heightOfString:text containedToWidth:headerFrame.size.width withFont:header.font];
    header.frame = headerFrame;
    
    [self.contentView addSubview:header];
    self.currentY += header.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    [self addSeparator];
}

- (void)addSeparator {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, screenWidth - (2 * PAGE_MARGIN), 1)];
    separator.backgroundColor = HFTW_LIGHT_GRAY;
    [self.contentView addSubview:separator];
    self.currentY += 1;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

/* Adds  bullet points (e.g. • bullet one • bullet two) */
- (void)addBulletsPointWithText:(NSArray *)bulletPoints {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for (NSString *bulletPoint in bulletPoints) {
        UILabel *bullet = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
        bullet.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
        bullet.textAlignment = NSTextAlignmentLeft;
        bullet.text = @"•";
        bullet.textColor = HFTW_TEXT_GRAY;
        [bullet sizeToFit];
        [self.contentView addSubview:bullet];
        
        float textStartingX = bullet.frame.origin.x + bullet.frame.size.width + 10;
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:CGRectMake(textStartingX, self.currentY, 0, 0)];
        bulletLabel.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
        bulletLabel.textAlignment = NSTextAlignmentLeft;
        bulletLabel.textColor = HFTW_TEXT_GRAY;
        bulletLabel.numberOfLines = 0;
        bulletLabel.text = bulletPoint;
        [bulletLabel sizeToFit];
        CGRect bulletFrame = bulletLabel.frame;
        bulletFrame.size.width = screenWidth - (2 * textStartingX);
        bulletFrame.size.height = [Utils heightOfString:bulletPoint containedToWidth:bulletFrame.size.width withFont:bulletLabel.font];
        bulletLabel.frame = bulletFrame;
        [self.contentView addSubview:bulletLabel];
        self.currentY += bulletLabel.frame.size.height;
        self.currentY += 5;
    }
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}


- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"back Button", @"NA"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
/* Action listeners for buttons */

- (void)legAndFeetPressed {
    LegAndFeetViewController *vc = [[LegAndFeetViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Leg And Feet", @"Sub-Section"]];
}

- (void)armsAndHandsPressed {
    ArmsAndHandsViewController *vc = [[ArmsAndHandsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Arms And Hands", @"Sub-Section"]];
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
