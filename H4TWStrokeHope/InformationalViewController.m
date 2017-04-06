//
//  InformationalViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/6/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "InformationalViewController.h"
#import "Constants.h"
#import "Utils.h"

@interface InformationalViewController ()
/* We add labels on this page verticaly, so need to keep track of current Y value */
@property CGFloat currentY;

@property UIScrollView *scrollView;
@property UIView *contentView;
@property BOOL alreadyCreatedView;
@end

#define PAGE_MARGIN 20

@implementation InformationalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.pageTitle;
    self.alreadyCreatedView = NO;
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    [self layoutView];
}

- (void)layoutView {
    if (self.alreadyCreatedView) {
        return;
    }
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
    [self.scrollView addSubview:self.contentView];
    
    self.currentY = 10;
    
    if ([self.pageTitle isEqualToString:ABOUT_US_SECTION_TITLE]) {
        [self layoutAboutUs];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
    [self.view addSubview:self.scrollView];
    self.alreadyCreatedView = YES;
}

- (void)layoutAboutUs {
    [self addHeaderWithText:@"First header"];
    self.currentY += 10;
    [self addSeparator];
    self.currentY += 10;
    [self addMainText:ABOUT_US_PARAGRAPH_ONE];
}

- (void)addHeaderWithText:(NSString *)text {
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    header.font = [UIFont fontWithName:@"Lato-bold" size:18.0];
    header.textColor = HFTW_TEXT_GRAY;
    header.textAlignment = NSTextAlignmentLeft;
    header.text = text;
    [header sizeToFit];
    [self.contentView addSubview:header];
    self.currentY += header.frame.size.height;
}

- (void)addSeparator {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, screenWidth - (2 * PAGE_MARGIN), 1)];
    separator.backgroundColor = HFTW_TEXT_GRAY;
    [self.contentView addSubview:separator];
    self.currentY += 1;
}

- (void)addMainText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *mainText = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    mainText.font = [UIFont fontWithName:@"Lato-light" size:16.0];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
