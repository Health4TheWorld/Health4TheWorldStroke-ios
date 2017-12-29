//
//  DorsiflexorsViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/21/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "DorsiflexorsViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "AWSDynamoDBHelper.h"

@interface DorsiflexorsViewController ()
@property CGFloat currentY;
@property CGFloat height;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 10
#define VERTICAL_SPACE_BETWEEN_CELLS 10
@implementation DorsiflexorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Stretching.ankleStretch", nil) uppercaseString];
    
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
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.scrollView setBackgroundColor:[UIColor clearColor]];
    self.scrollView.bounces = NO;
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self.scrollView addSubview:self.contentView];
    self.currentY = 35;
    /* Text view for Instructions */
    [self addMainText: STRETCHING_DORSIFLEXORS_INSTRUCTIONS];
    self.currentY += self.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    /* Image View for Stretching images */
    UIImage *image = [UIImage imageNamed: STRETCHING_ANKLE_STRETCH_1];
    [self addImageView:image];
    self.currentY += self.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    /* Second image view for Stretching images */
    UIImage *image2 = [UIImage imageNamed: STRETCHING_ANKLE_STRETCH_2];
    [self addImageView:image2];
    self.currentY += self.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
    [self.view addSubview:self.scrollView];
}

- (void)addMainText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *mainText = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    mainText.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    mainText.textAlignment = NSTextAlignmentLeft;
    mainText.textColor = HFTW_TEXT_GRAY;
    mainText.numberOfLines = 0;
    mainText.text = text;
    [mainText sizeToFit];
    CGRect mainTextFrame = mainText.frame;
    mainTextFrame.size.width = screenWidth - (2 * PAGE_MARGIN);
    mainTextFrame.size.height = [Utils heightOfString:text containedToWidth:mainTextFrame.size.width withFont:mainText.font];
    mainText.frame = mainTextFrame;
    
    [self.contentView addSubview:mainText];
    self.currentY += mainText.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

- (void)addImageView:(UIImage *)image {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat width = screenWidth - 10;
    self.height = width;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.currentY, width, self.height)];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    [self.contentView addSubview:imageView];
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
