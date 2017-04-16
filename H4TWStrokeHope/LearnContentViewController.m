//
//  LearnContentViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/14/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LearnContentViewController.h"
#import "Constants.h"
#import "Utils.h"

#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 15

@interface LearnContentViewController ()
/* We add labels on this page verticaly, so need to keep track of current Y value */
@property CGFloat currentY;
@property UIScrollView *scrollView;
@property UIView *contentView;
@property BOOL alreadyAddedText;
@end

@implementation LearnContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentY = 0;
    self.alreadyAddedText = NO;
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:self.content.backButtonImageStr];
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    [self.view setBackgroundColor:self.content.contentBGColor];
    [self addText];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /* Set up nav bar color */
    self.title = [self.content.contentTitle uppercaseString];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : self.content.contentBGColor}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* Loop through data and add labels for each text */
- (void)addText {
    if (!self.alreadyAddedText) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        [self.scrollView setBackgroundColor:[UIColor clearColor]];
        self.scrollView.bounces = NO;
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        [self.scrollView addSubview:self.contentView];
        self.currentY = 15;
        
        /* Add labels */
        for (NSDictionary *text in self.content.content) {
            NSString *textType = [text objectForKey:TEXT_TYPE_KEY];
            if ([textType isEqualToString:TEXT_TYPE_HEADER]) {
                [self addHeaderWithText:[text objectForKey:TEXT_KEY]];
            } else if ([textType isEqualToString:TEXT_TYPE_PARAGRAPH]) {
                [self addParagraphWithText:[text objectForKey:TEXT_KEY]];
            }
        }
        
        self.alreadyAddedText = YES;
        self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
        [self.view addSubview:self.scrollView];
    }
}

/* LABEL CONSTRUCTORS */

/* Adds header with a separator below. */
- (void)addHeaderWithText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    header.font = [UIFont fontWithName:@"Lato-bold" size:20.0];
    header.textAlignment = NSTextAlignmentLeft;
    header.textColor = self.content.textColor;
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

- (void)addParagraphWithText:(NSAttributedString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *mainText = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    mainText.textAlignment = NSTextAlignmentLeft;
    mainText.textColor = self.content.textColor;
    mainText.numberOfLines = 0;
    mainText.attributedText = text;
    [mainText sizeToFit];
    CGRect mainTextFrame = mainText.frame;
    mainTextFrame.size.width = screenWidth - (2 * PAGE_MARGIN);
    mainTextFrame.size.height = [Utils heightOfAttributedString:text containedToWidth:mainTextFrame.size.width withFont:mainText.font];
    mainText.frame = mainTextFrame;
    
    [self.contentView addSubview:mainText];
    self.currentY += mainText.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

- (void)addSeparator {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, screenWidth - (2 * PAGE_MARGIN), 1)];
    separator.backgroundColor = self.content.textColor;
    [self.contentView addSubview:separator];
    self.currentY += 1;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

@end
