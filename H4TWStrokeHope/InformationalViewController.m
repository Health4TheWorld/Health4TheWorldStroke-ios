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
#define VERTICAL_SPACE_BETWEEN_LABELS 10
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
    self.scrollView.bounces = NO;
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
    [self.scrollView addSubview:self.contentView];
    
    self.currentY = 15;
    
    if ([self.pageTitle isEqualToString:ABOUT_US_SECTION_TITLE]) {
        [self layoutAboutUs];
    } else if ([self.pageTitle isEqualToString:TERMS_SECTION_TITLE]) {
        [self layoutTerms];
    } else if ([self.pageTitle isEqualToString:PRIVACY_POLICY_SECTION_TITLE]) {
        [self layoutPrivacyPolicy];
    } else if ([self.pageTitle isEqualToString:COPYRIGHT_SECTION_TITLE]) {
        [self layoutCopyright];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
    [self.view addSubview:self.scrollView];
    self.alreadyCreatedView = YES;
}

/* Lays out all the text (programatically) for the "About Us" section. */
- (void)layoutAboutUs {
    [self addHeaderWithText:@"ABOUT THE APP"];
    [self addSeparator];
    [self addMainText:ABOUT_US_PARAGRAPH_ONE];
    [self addMainText:ABOUT_US_PARAGRAPH_TWO];
    [self addMainText:ABOUT_US_PARAGRAPH_THREE];
    NSArray *features = @[APP_FEATURE_ONE, APP_FEATURE_TWO, APP_FEATURE_THREE, APP_FEATURE_FOUR];
    [self addBulletsPointWithText:features];
    self.currentY += 15;
    [self addHeaderWithText:@"TEAM"];
    [self addSeparator];
    [self addMainText:@"This application wouldn’t have been possible without work of a dream team!"];
    [self addHeaderWithText:@"Founders"];
    [self addMainText:@"Dr. Bhavya Rehani, Dr. Bill Dillon & Dr. Ankur Bharija"];
    [self addHeaderWithText:@"Developer"];
    [self addMainText:@"Rachel Grau"];
    [self addHeaderWithText:@"Animations"];
    [self addMainText:@"Ernesto Aguilar"];
    [self addHeaderWithText:@"Illustrations"];
    [self addMainText:@"Julie Kim, Bhavya Rehani, Ankur Bharija"];
    [self addHeaderWithText:@"Content editing"];
    [self addMainText:@"Dr. Lilly Zhang, Isaiah Brown and Dr Bhavya Rehani"];
    [self addHeaderWithText:@"Movies"];
    [self addMainText:@"Jack McGill"];
    [self addHeaderWithText:@"Medical Advisory Board for the App"];
    
    NSArray *medicalAdvisoryBoard = @[@"Dr. Marc Fisher:  Dr Fisher currently serves as editor-in-chief of Stroke and Senior Physician on the Stroke Service at BIDMC, Harvard Medical School. He is well renowned and has published extensively over 260 peer-reviewed articles and has edited or co-edited 13 books.", @"Dr. Jeffrey Teraoke: Dr. Teraoke is Chief, PM &R at Palo Alto VA Medical Center. He is the program director of PM&R Residency Program and Director, Polytrauma, VA Palo Alto Health System", @"Dr. Erica A Pitsch, PT, MPT, DPT, NCS: Health Science Assistant Clinical Professor, UCSF. Dr. Pitsch specializes in neurologic physical therapy and uses several treatment strategies and approaches, all focused on promoting optimal challenge, function, and recovery in persons with neurologic illness", @"Loren Ward, PT, DPT is licensed Physical Therapist who began her career in Physical Therapy in 2007, while earning her Doctorate at MGH Institute of Health Professions in Massachusetts. She did internships at Rehabilitation of Chicago, Spaulding Rehabilitation and National Rehabilitation Hospital and now works at Stanford Veteran’s Affairs System. Loren is an advocate of functional independence and strives to help her patients reach their own level of independence regardless of their limitations.", @"Rose Hamm, PT, DPT, CWS, FACCWS: Rose received a BS in Physical Therapy from the University of North Carolina, Chapel Hill, and an MS and post-graduate DPT from the University of Southern California.  She is currently Adjunct Assistant Professor of Clinical Physical Therapy at the University of Southern California and practices at Keck Hospital at USC."];
    [self addBulletsPointWithText:medicalAdvisoryBoard];
}

/* Lays out all the text (programatically) for the "Terms & Conditions" section. */
- (void)layoutTerms {
    
}

/* Lays out all the text (programatically) for the "Privacy Policy" section. */
- (void)layoutPrivacyPolicy {
    
}

/* Lays out all the text (programatically) for the "Copyright" section. */
- (void)layoutCopyright {
    
}

- (void)addHeaderWithText:(NSString *)text {
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    header.font = [UIFont fontWithName:@"Lato-bold" size:18.0];
    header.font = [UIFont boldSystemFontOfSize:18.0];
    header.textColor = HFTW_TEXT_GRAY;
    header.textAlignment = NSTextAlignmentLeft;
    header.text = text;
    [header sizeToFit];
    [self.contentView addSubview:header];
    self.currentY += header.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

- (void)addSeparator {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *separator = [[UIView alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, screenWidth - (2 * PAGE_MARGIN), 1)];
    separator.backgroundColor = HFTW_LIGHT_GRAY;
    [self.contentView addSubview:separator];
    self.currentY += 1;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
}

- (void)addMainText:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel *mainText = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    mainText.font = [UIFont fontWithName:@"Lato-regular" size:12.0];
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

- (void)addBulletsPointWithText:(NSArray *)bulletPoints {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for (NSString *bulletPoint in bulletPoints) {
        UILabel *bullet = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
        bullet.font = [UIFont fontWithName:@"Lato-regular" size:12.0];
        bullet.textAlignment = NSTextAlignmentLeft;
        bullet.text = @"•";
        bullet.textColor = HFTW_TEXT_GRAY;
        [bullet sizeToFit];
        [self.contentView addSubview:bullet];
        
        float textStartingX = bullet.frame.origin.x + bullet.frame.size.width + 10;
        UILabel *bulletLabel = [[UILabel alloc] initWithFrame:CGRectMake(textStartingX, self.currentY, 0, 0)];
        bulletLabel.font = [UIFont fontWithName:@"Lato-regular" size:12.0];
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
