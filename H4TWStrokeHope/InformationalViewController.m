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
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewForContent;

//@property UIScrollView *scrollView;
@property UIView *contentView;
@property BOOL alreadyCreatedView;
@end

#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 10
@implementation InformationalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.pageTitle uppercaseString];
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
//    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollViewForContent.bounces = NO;
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height )];//20000
    [self.scrollViewForContent addSubview:self.contentView];
    
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
    
    self.scrollViewForContent.contentSize = CGSizeMake(self.scrollViewForContent.frame.size.width, self.currentY);
//    [self.view addSubview:self.scrollView];
    self.alreadyCreatedView = YES;
}

/* Lays out all the text (programatically) for the "About Us" section. */
- (void)layoutAboutUs {
    [self addHeaderWithText:[NSLocalizedString(@"AboutUs.aboutTheApp", nil) uppercaseString]];
    [self addMainText:ABOUT_US_PARAGRAPH_ONE];
    [self addMainText:ABOUT_US_PARAGRAPH_TWO];
    [self addMainText:ABOUT_US_PARAGRAPH_THREE];
    NSArray *features = @[APP_FEATURE_ONE, APP_FEATURE_TWO, APP_FEATURE_THREE, APP_FEATURE_FOUR];
    [self addBulletsPointWithText:features];
    self.currentY += 15;
    [self addHeaderWithText:[NSLocalizedString(@"AboutUs.team", nil) uppercaseString]];
    [self addMainText:NSLocalizedString(@"AboutUs.teamIntro", nil)];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.founders", nil)];
    [self addMainText:@"Dr. Bhavya Rehani, Dr. Bill Dillon & Dr. Ankur Bharija"];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.developers", nil)];
    [self addMainText:@"Rachel Grau, Premnath Ramanathan & Maitri Mehta"];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.animations", nil)];
    [self addMainText:@"Ernesto Aguilar"];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.illustrations", nil)];
    [self addMainText:@"Julie Kim, Bhavya Rehani, Ankur Bharija"];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.contentEditing", nil)];
    [self addMainText:@"Dr. Lilly Zhang, Isaiah Brown and Dr Bhavya Rehani"];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.movies", nil)];
    [self addMainText:@"Jack McGill"];
    [self addSubheaderWithText:NSLocalizedString(@"AboutUs.advisoryBoard", nil)];
    
    NSArray *medicalAdvisoryBoard = @[NSLocalizedString(@"AboutUs.marcFisher", nil), NSLocalizedString(@"AboutUs.jeffreyTeraoke", nil), NSLocalizedString(@"AboutUs.ericaPitsch", nil), NSLocalizedString(@"AboutUs.lorenWard", nil), NSLocalizedString(@"AboutUs.roseHamm", nil)];
    [self addBulletsPointWithText:medicalAdvisoryBoard];
}

/* Lays out all the text (programatically) for the "Terms & Conditions" section. */
- (void)layoutTerms {
    static int SPACE_BETWEEN_SECTIONS = 15;
    [self addHeaderWithText:@"THANK YOU FOR USING HEALTH4THEWORLD!"];
    [self addMainText:THANK_YOU_PARAGRAPH_ONE];
    [self addMainText:THANK_YOU_PARAGRAPH_TWO];
    [self addMainText:THANK_YOU_PARAGRAPH_THREE];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"USING HEALTH4THEWORLD"];
    [self addSubheaderWithText:USE_SECTION_ONE_HEADER];
    [self addMainText:USE_SECTION_ONE_PARAGRAPH_ONE];
    [self addBulletsPointWithText:USE_SECTION_ONE_BULLETS];
    [self addMainText:USE_SECTION_ONE_PARAGRAPH_TWO];
    [self addSubheaderWithText:USE_SECTION_TWO_HEADER];
    [self addMainText:USE_SECTION_TWO_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"OUR EDUCATIONAL CONTENT"];
    [self addSubheaderWithText:EDU_SECTION_ONE_HEADER];
    [self addMainText:EDU_SECTION_ONE_PARAGRAPH];
    [self addSubheaderWithText:EDU_SECTION_TWO_HEADER];
    [self addMainText:EDU_SECTION_TWO_PARAGRAPH];
    [self addSubheaderWithText:EDU_SECTION_THREE_HEADER];
    [self addMainText:EDU_SECTION_THREE_PARAGRAPH];
    [self addSubheaderWithText:EDU_SECTION_FOUR_HEADER];
    [self addMainText:EDU_SECTION_FOUR_PARAGRAPH];
    [self addMainText:EDU_SECTION_FIVE_HEADER];
    [self addMainText:EDU_SECTION_FIVE_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"YOUR CONTENT"];
    [self addSubheaderWithText:YOUR_CONTENT_SECTION_ONE_HEADER];
    [self addMainText:YOUR_CONTENT_SECTION_ONE_PARAGRAPH];
    [self addSubheaderWithText:YOUR_CONTENT_SECTION_TWO_HEADER];
    [self addMainText:YOUR_CONTENT_SECTION_TWO_PARAGRAPH];
    [self addSubheaderWithText:YOUR_CONTENT_SECTION_THREE_HEADER];
    [self addMainText:YOUR_CONTENT_SECTION_THREE_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"SECURITY"];
    [self addMainText:SECURITY_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"THIRD PARTY CONTENT"];
    [self addMainText:THIRD_PARTY_CONTENT_PARAGRAPH];
    [self addMainText:SECURITY_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addSubheaderWithText:@"COPYRIGHT AND TRADEMARK POLICY"];
    [self addMainText:COPYRIGHT_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"MODIFYING AND TERMINATING OUR SERVICES"];
    [self addMainText:MODIFYING_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"DISCLAIMERS"];
    [self addMainText:DISCLAIMERS_PARAGRAPH_ONE];
    [self addMainText:DISCLAIMERS_PARAGRAPH_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"LIMITATIONS"];
    [self addMainText:LIMITATIONS_PARAGRAPH_ONE];
    [self addMainText:LIMITATIONS_PARAGRAPH_TWO];
    [self addMainText:LIMITATIONS_PARAGRAPH_THREE];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"IDEMNIFICATION"];
    [self addMainText:IDEMNIFICATION_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"GOVERNING LAW AND JURISDICTION"];
    [self addMainText:GOVERNING_PARAGRAPH_ONE];
    [self addMainText:GOVERNING_PARAGRAPH_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"GENERAL TERMS"];
    [self addSubheaderWithText:GENERAL_TERMS_SECTION_ONE_HEADER];
    [self addMainText:GENERAL_TERMS_SECTION_ONE_PARAGRAPH];
    [self addSubheaderWithText:GENERAL_TERMS_SECTION_TWO_HEADER];
    [self addMainText:GENERAL_TERMS_SECTION_TWO_PARAGRAPH];
    [self addSubheaderWithText:GENERAL_TERMS_SECTION_THREE_HEADER];
    [self addMainText:GENERAL_TERMS_SECTION_THREE_PARAGRAPH];
    [self addSubheaderWithText:GENERAL_TERMS_SECTION_FOUR_HEADER];
    [self addMainText:GENERAL_TERMS_SECTION_FOUR_PARAGRAPH];
    [self addSubheaderWithText:GENERAL_TERMS_SECTION_FIVE_HEADER];
    [self addMainText:GENERAL_TERMS_SECTION_FIVE_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:@"REFERENCED POLICIES"];
    [self addBulletsPointWithText:REFERENCED_POLICIES_BULLETS];
    
    /* ACCEPTALBE USE POLICY */
    [self addBigHeader:@"Acceptable Use Policy"];
    [self addMainText:ACCEPTABLE_USE_PARAGRAPH_ONE];
    [self addSubheaderWithText:ACCEPTABLE_USE_SECTION_ONE_HEADER];
    [self addBulletsPointWithText:ACCEPTABLE_USE_SECTION_ONE_BULLETS];
    [self addSubheaderWithText:ACCEPTABLE_USE_SECTION_TWO_HEADER];
    [self addBulletsPointWithText:ACCEPTABLE_USE_SECTION_TWO_BULLETS];
    [self addSubheaderWithText:ACCEPTABLE_USE_SECTION_THREE_HEADER];
    [self addBulletsPointWithText:ACCEPTABLE_USE_SECTION_THREE_BULLETS];
    [self addMainText:ACCEPTABLE_USE_SECTION_THREE_PARAGRAPH_ONE];
    [self addHeaderWithText:@"USER CONTENT"];
    [self addSubheaderWithText:AU_USER_CONTENT_SECTION_ONE_HEADER];
    [self addMainText:AU_USER_CONTENT_SECTION_ONE_PARAGRAPH];
    [self addSubheaderWithText:AU_USER_CONTENT_SECTION_TWO_HEADER];
    [self addMainText:AU_USER_CONTENT_SECTION_TWO_PARAGRAPH];
    [self addSubheaderWithText:AU_USER_CONTENT_SECTION_THREE_HEADER];
    [self addMainText:AU_USER_CONTENT_SECTION_THREE_PARAGRAPH];
    
    /* COPYRIGHT AND TRADEMARK  POLICY */
    [self addBigHeader:@"Copyright and Trademark Policy"];
    [self addMainText:COPYRIGHT_PARAGRAPH_ONE];
    [self addSubheaderWithText:COPYRIGHT_SECTION_ONE_HEADER];
    [self addMainText:COPYRIGHT_SECTION_ONE_PARAGRAPH_ONE];
    [self addMainText:COPYRIGHT_SECTION_ONE_PARAGRAPH_TWO];
    [self addMainText:COPYRIGHT_SECTION_ONE_PARAGRAPH_THREE];
    [self addNumberedBulletsWithText:COPYRIGHT_SECTION_ONE_BULLETS_ONE];
    [self addMainText:COPYRIGHT_SECTION_ONE_PARAGRAPH_FOUR];
    [self addNumberedBulletsWithText:COPYRIGHT_SECTION_ONE_BULLETS_TWO];
    [self addMainText:COPYRIGHT_SECTION_ONE_PARAGRAPH_FIVE];
    [self addSubheaderWithText:COPYRIGHT_SECTION_TWO_HEADER];
    [self addMainText:COPYRIGHT_SECTION_TWO_PARAGRAPH];
    
    /* HONOR CODE */
    [self addBigHeader:@"Honor Code"];
    [self addMainText:HONOR_CODE_PARAGRAPH_ONE];
    [self addNumberedBulletsWithText:HONOR_CODE_BULLETS];
    
    self.currentY += SPACE_BETWEEN_SECTIONS;
}

/* Lays out all the text (programatically) for the "Privacy Policy" section. */
- (void)layoutPrivacyPolicy {
    static int SPACE_BETWEEN_SECTIONS = 15;
    [self addHeaderWithText:PP_SECTION_ONE_HEADER];
    [self addMainText:PP_SECTION_ONE_PARAGRAPH_ONE];
    [self addMainText:PP_SECTION_ONE_PARAGRAPH_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_TWO_HEADER];
    [self addMainText:PP_SECTION_TWO_PARAGRAPH_ONE];
    [self addMainText:PP_SECTION_TWO_PARAGRAPH_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_THREE_HEADER];
    [self addMainText:PP_SECTION_THREE_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_FOUR_HEADER];
    [self addMainText:PP_SECTION_FOUR_PARAGRAPH_ONE];
    [self addSubheaderWithText:PP_SECTION_FOUR_SUBHEADER_ONE];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_ONE_INFO];
    [self addSubheaderWithText:PP_SECTION_FOUR_SUBHEADER_TWO];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_TWO_INFO];
    [self addSubheaderWithText:PP_SECTION_FOUR_SUBHEADER_THREE];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_THREE_INFO];
    [self addSubheaderWithText:PP_SECTION_FOUR_SUBHEADER_FOUR];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_FOUR_INFO];
    [self addSubheaderWithText:PP_SECTION_FOUR_SUBHEADER_FIVE];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_FIVE_INFO];
    [self addSubheaderWithText:PP_SECTION_FOUR_SUBHEADER_SIX];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_SIX_INFO_ONE];
    [self addMainText:PP_SECTION_FOUR_SUBHEADER_SIX_INFO_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_FIVE_HEADER];
    [self addMainText:PP_SECTION_FIVE_PARAGRAPH_ONE];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_ONE];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_ONE_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_TWO];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_TWO_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_THERE];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_THREE_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_FOUR];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_FOUR_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_FIVE];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_FIVE_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_SIX];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_SIX_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_SEVEN];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_SEVEN_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_EIGHT];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_EIGHT_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_NINE];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_NINE_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_TEN];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_TEN_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_ELEVEN];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_ELEVEN_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_TWELVE];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_TWELVE_INFO];
    [self addSubheaderWithText:PP_SECTION_FIVE_SUBHEADER_THIRTEEN];
    [self addMainText:PP_SECTION_FIVE_SUBHEADER_THIRTEEN_INFO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_SIX_HEADER];
    [self addMainText:PP_SECTION_SIX_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_SEVEN_HEADER];
    [self addMainText:PP_SECTION_SEVEN_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_EIGHT_HEADER];
    [self addMainText:PP_SECTION_EIGHT_PARAGRAPH_ONE];
    [self addMainText:PP_SECTION_EIGHT_PARAGRAPH_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_NINE_HEADER];
    [self addMainText:PP_SECTION_NINE_PARAGRAPH_ONE];
    [self addMainText:PP_SECTION_NINE_PARAGRAPH_TWO];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_TEN_HEADER];
    [self addMainText:PP_SECTION_TEN_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_ELEVEN_HEADER];
    [self addMainText:PP_SECTION_ELEVEN_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
    [self addHeaderWithText:PP_SECTION_TWELVE_HEADER];
    [self addMainText:PP_SECTION_TWELVE_PARAGRAPH];
    self.currentY += SPACE_BETWEEN_SECTIONS;
}

/* Lays out all the text (programatically) for the "Copyright" section. */
- (void)layoutCopyright {
    
}

/* Adds a big centered title with a light gray background. */
- (void)addBigHeader:(NSString *)text {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, self.currentY, screenWidth, 50)];
    [background setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
    header.font = [UIFont fontWithName:@"Lato-bold" size:18.0];
    header.font = [UIFont boldSystemFontOfSize:18.0];
    header.textAlignment = NSTextAlignmentCenter;
    header.textColor = HFTW_TEXT_GRAY;
    header.numberOfLines = 0;
    header.text = text;
    [header sizeToFit];
    header.center = background.center;
    CGRect headerFrame = header.frame;
    headerFrame.origin.x = PAGE_MARGIN;
    headerFrame.size.width = screenWidth - (2 * PAGE_MARGIN);
    headerFrame.size.height = [Utils heightOfString:text containedToWidth:headerFrame.size.width withFont:header.font];
    header.frame = headerFrame;
    
    [self.contentView addSubview:background];
    [self.contentView addSubview:header];
    
    self.currentY += background.frame.size.height;
    self.currentY += VERTICAL_SPACE_BETWEEN_LABELS;
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

- (void)addSubheaderWithText:(NSString *)text {
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

/* Adds numbered bullet points (e.g. 1. bullet one 2. bullet two) */
- (void)addNumberedBulletsWithText:(NSArray *)bulletPoints {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    for (int i=0; i < bulletPoints.count; i++) {
        NSString *bulletPoint = [bulletPoints objectAtIndex:i];
        UILabel *bullet = [[UILabel alloc] initWithFrame:CGRectMake(PAGE_MARGIN, self.currentY, 0, 0)];
        bullet.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
        bullet.textAlignment = NSTextAlignmentLeft;
        bullet.text = [NSString stringWithFormat:@"%d.", i + 1];
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
