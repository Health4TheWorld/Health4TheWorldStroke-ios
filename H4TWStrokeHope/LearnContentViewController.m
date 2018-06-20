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

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [backButton setTintColor:HFTW_DARK];
    [[self navigationItem] setBackBarButtonItem:backButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentY = 0;
    self.alreadyAddedText = NO;
//    self.automaticallyAdjustsScrollViewInsets = FALSE;
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:self.content.backButtonImageStr];
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
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
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 800)];
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        [self.scrollView addSubview:self.contentView];
        self.currentY = 15;
        
        /* Add labels */
        for (NSDictionary *text in self.content.content) {
            NSString *textType = [text objectForKey:TEXT_TYPE_KEY];
            if ([textType isEqualToString:TEXT_TYPE_HEADER]) {
                [self addHeaderWithText:[text objectForKey:TEXT_KEY]];
            } else if ([textType isEqualToString:TEXT_TYPE_ATTRIBUTED_PARAGRAPH]) {
                [self addAttributedParagraphWithText:[text objectForKey:TEXT_KEY]];
            } else if ([textType isEqualToString:TEXT_TYPE_PARAGRAPH]) {
                [self addParagraphWithText:[text objectForKey:TEXT_KEY]];
            } else if ([textType isEqualToString:TEXT_TYPE_BULLETS]) {
                [self addBullets:[text objectForKey:TEXT_KEY]];
            } else if ([textType isEqualToString:TEXT_TYPE_ATTRIBUTED_BULLETS]) {
                [self addAttributedBullets:[text objectForKey:TEXT_KEY]];
            }
        }
        
        NSArray *imgs = self.content.images;
        for (UIImageView *imgView in imgs) {
           // imgView.center = self.view.center;
            CGRect imgViewFrame = imgView.frame;
            imgViewFrame.origin.y = self.currentY;
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            imgViewFrame.origin.x = (width - imgViewFrame.size.width)/2.0;
            imgView.frame = imgViewFrame;
            [self.contentView addSubview:imgView];
            self.currentY += imgViewFrame.size.height;
            self.currentY += 60;
        }
        
        self.alreadyAddedText = YES;
        self.currentY += 40;
        if(_justImage){//786 × 587
            self.scrollView.contentSize = CGSizeMake(786, 587);
        }else{
            self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
        }
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

- (void)addAttributedParagraphWithText:(NSAttributedString *)text {
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

- (void)addParagraphWithText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *mainText = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    mainText.textAlignment = NSTextAlignmentLeft;
    mainText.textColor = self.content.textColor;
    mainText.numberOfLines = 0;
    mainText.text = text;
    mainText.font = LEARN_PARAGRAPH_FONT;
    [mainText sizeToFit];
    CGRect mainTextFrame = mainText.frame;
    mainTextFrame.size.width = screenWidth - (2 * PAGE_MARGIN);
    mainTextFrame.size.height = [Utils heightOfString:text containedToWidth:mainTextFrame.size.width withFont:mainText.font];
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

- (void)addBullets:(NSArray *)bullets {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for (NSString *bulletPoint in bullets) {
        UILabel *bullet = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
        bullet.font = LEARN_PARAGRAPH_FONT;
        bullet.textAlignment = NSTextAlignmentLeft;
        bullet.text = @"•";
        bullet.textColor = self.content.textColor;
        [bullet sizeToFit];
        [self.contentView addSubview:bullet];
        
        float textStartingX = bullet.frame.origin.x + bullet.frame.size.width + 10;
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:CGRectMake(textStartingX, self.currentY, 0, 0)];
        bulletLabel.font = LEARN_PARAGRAPH_FONT;
        bulletLabel.textAlignment = NSTextAlignmentLeft;
        bulletLabel.textColor = self.content.textColor;
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

- (void)addAttributedBullets:(NSArray *)bullets {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for (NSMutableAttributedString *bulletPoint in bullets) {
        UILabel *bullet = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
        bullet.font = LEARN_PARAGRAPH_FONT;
        bullet.textAlignment = NSTextAlignmentLeft;
        bullet.text = @"•";
        bullet.textColor = self.content.textColor;
        [bullet sizeToFit];
        [self.contentView addSubview:bullet];
        
        float textStartingX = bullet.frame.origin.x + bullet.frame.size.width + 10;
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:CGRectMake(textStartingX, self.currentY, 0, 0)];
        bulletLabel.font = LEARN_PARAGRAPH_FONT;
        bulletLabel.textAlignment = NSTextAlignmentLeft;
        bulletLabel.textColor = self.content.textColor;
        bulletLabel.numberOfLines = 0;
        bulletLabel.attributedText = bulletPoint;
        [bulletLabel sizeToFit];
        CGRect bulletFrame = bulletLabel.frame;
        bulletFrame.size.width = screenWidth - (2 * textStartingX);
        bulletFrame.size.height = [Utils heightOfAttributedString:bulletPoint containedToWidth:bulletFrame.size.width withFont:bulletLabel.font];
        bulletLabel.frame = bulletFrame;
        [self.contentView addSubview:bulletLabel];
        self.currentY += bulletLabel.frame.size.height;
        self.currentY += 5;
    }
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

@end
