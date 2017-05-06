//
//  HamstringsViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/21/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HamstringsViewController.h"
#import "Constants.h"

@interface HamstringsViewController ()
@property CGFloat currentY;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

#define VERTICAL_SPACE_BETWEEN_CELLS 10
@implementation HamstringsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Stretching.kneeStretch", nil) uppercaseString];
    
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
    [self addMainText: STRETCHING_HAMSTRINGS_INSTRUCTIONS];
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    /* Image View for Stretching images */
    UIImage *image = [UIImage imageNamed: STRETCHING_KNEE_STRETCH_1];
    [self addImageView:image];
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    /* Second image view for Stretching images */
    UIImage *image2 = [UIImage imageNamed: STRETCHING_KNEE_STRETCH_2];
    [self addImageView:image2];
    
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
    [self.view addSubview:self.scrollView];
}

- (void)addMainText:(NSString *)text {
    static int MARGIN = 16;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    float height = (screenWidth / 3);
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(MARGIN, self.currentY, screenWidth - (2 * MARGIN), height)];
    textView.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.textColor = HFTW_TEXT_GRAY;
    textView.text = text;
    [textView intrinsicContentSize];
    self.currentY += textView.frame.size.height;
    [self.contentView addSubview:textView];
}

- (void)addImageView:(UIImage *)image {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat width = screenWidth - 10;
    float height = width;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.currentY, width, height)];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    [self.contentView addSubview:imageView];
    self.currentY += imageView.frame.size.height;
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
