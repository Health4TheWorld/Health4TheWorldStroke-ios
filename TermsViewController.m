//
//  TermsViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 5/18/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "TermsViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "GraphicUtils.h"

@interface TermsViewController ()
@property UIScrollView *scrollView;
@property UIView *contentView;
@property float currentY;
@end

#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 10

@implementation TermsViewController

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Terms";
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self layoutView];
}

- (void)layoutView {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.bounces = NO;
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
    [self.scrollView addSubview:self.contentView];
    
    self.currentY = 50;
    
    /* TITLE */
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectZero];
    title.text = @"TERMS OF USE";
    title.font = [UIFont fontWithName:@"Lato-regular" size:22.0];
    title.textColor = HFTW_TEXT_GRAY;
    [title sizeToFit];
    CGRect titleFrame = title.frame;
    titleFrame.origin.x = 0;
    titleFrame.origin.y = self.currentY;
    titleFrame.size.width = screenWidth;
    title.frame = titleFrame;
    title.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:title];
    self.currentY += title.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    
    [self addMainText:NSLocalizedString(@"Disclaimer.paragraphOne", @"")];
    [self addMainText:NSLocalizedString(@"Disclaimer.paragraphTwo", @"")];
    [self addMainText:NSLocalizedString(@"Disclaimer.paragraphThree", @"")];
    [self addMainText:NSLocalizedString(@"Disclaimer.paragraphFour", @"")];
    [self addMainText:NSLocalizedString(@"Disclaimer.paragraphFive", @"")];
    [self addMainText:NSLocalizedString(@"Disclaimer.paragraphSix", @"")];
    
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    
    UIButton *acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, screenWidth - (2 * PAGE_MARGIN), 50)];
    [acceptButton setTitle:@"ACCEPT" forState:UIControlStateNormal];
    [acceptButton setBackgroundColor:[UIColor redColor]];
    [acceptButton addTarget:self action:@selector(pressedAccept) forControlEvents:UIControlEventTouchUpInside];
    [GraphicUtils styleButton:acceptButton];

    [self.contentView addSubview:acceptButton];
    self.currentY += acceptButton.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
    [self.view addSubview:self.scrollView];
}

- (void)pressedAccept {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
