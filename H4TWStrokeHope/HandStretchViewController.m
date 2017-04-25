//
//  HandStretchViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/21/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HandStretchViewController.h"
#import "Constants.h"

@interface HandStretchViewController ()
@property CGFloat currentY;
@property CGFloat height;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@end

#define VERTICAL_SPACE_BETWEEN_CELLS 10
@implementation HandStretchViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HAND STRETCH";
    
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
    
    /* Text view for Instructions */
    [self addMainText: STRETCHING_HAND_INSTRUCTIONS];
    self.currentY += self.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    /* Image View for Stretching images */
    UIImage *image = [UIImage imageNamed: STRETCHING_HAND_STRETCH_1];
    [self addImageView:image];
    self.currentY += self.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_CELLS;
    
    /* Second image view for Stretching images */
    UIImage *image2 = [UIImage imageNamed: STRETCHING_HAND_STRETCH_2];
    [self addImageView:image2];
}

- (void)addMainText:(NSString *)text {
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.height = (screenWidth / 2);
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, self.currentY, screenWidth, self.height)];
    textView.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.textColor = HFTW_TEXT_GRAY;
    textView.text = text;
    [textView intrinsicContentSize];
    
    [self.contentView addSubview:textView];
    
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
