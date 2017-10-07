//
//  ExercisesViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/4/17.
//  Copyright © 2017 Rachel. All rights reserved.
//


#import "ExercisesViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"
#import "VideoViewController.h"
#import "StrengtheningViewController.h"
#import "StretchingViewController.h"
#import "FunctionalMobilityViewController.h"
#import "MindExercisesViewController.h"

@interface ExercisesViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) UILabel *generalInstructions;
@property BOOL alreadySetUpView;
@property float currentY;
@end


#define PAGE_MARGIN 20
#define VERTICAL_SPACE_BETWEEN_LABELS 10
@implementation ExercisesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Exercises.title", nil) uppercaseString];
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)viewDidAppear:(BOOL)animated {
    if (!self.alreadySetUpView) {
        float screenWidth = [UIScreen mainScreen].bounds.size.width;
        static int MARGIN = 16;
        static int SPACE_BETWEEN_CELLS = 10;
        float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        [self.scrollView setBackgroundColor:[UIColor clearColor]];
        self.scrollView.bounces = NO;
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        [self.scrollView addSubview:self.contentView];
        self.currentY = 40;
        
        /* Video */
        self.videoView = [[UIView alloc] initWithFrame:CGRectMake(MARGIN, self.currentY, screenWidth - (2 * MARGIN), 180)];
        VideoViewController *vc = [[VideoViewController alloc] init];
        AVPlayerViewController *controller= [vc setUpCustomVideo:VIDEO_5A_FEMALE_DOC withFrame:nil];
        [self addChildViewController: controller];
        [self.videoView addSubview: controller.view];
        controller.view.frame = CGRectMake(0, 0, self.videoView.frame.size.width, self.videoView.frame.size.height);
        [self.contentView addSubview:self.videoView];
        self.currentY += self.videoView.frame.size.height + 20;
        
       
        
        /* Buttons for different types of exercises  */
        HomeButton *strengtheningButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.strengthening", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellWidth)];
        [strengtheningButton addImageBottomRight:[UIImage imageNamed: STRONG_ARM_ICON]];
        [strengtheningButton addTarget:self action:@selector(strengtheningPressed) forControlEvents:UIControlEventTouchUpInside];
        
        HomeButton *stretchingButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.stretching", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), self.currentY, cellWidth, cellWidth)];
        [stretchingButton addImageCentered:[UIImage imageNamed:STRETCHING_ICON]];
        [stretchingButton addTarget:self action:@selector(stretchingPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellWidth;
        self.currentY += SPACE_BETWEEN_CELLS;
        
        HomeButton *functionalMobilityButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.functionalMobility", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellWidth)];
        [functionalMobilityButton addImageBottomRight:[UIImage imageNamed:FUNCTIONAL_MOBILITY_ICON]];
        [functionalMobilityButton addTarget:self action:@selector(functionalMobilityPressed) forControlEvents:UIControlEventTouchUpInside];
        
        HomeButton *mindExercisesButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.mindExercises", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), self.currentY, cellWidth, cellWidth)];
        [mindExercisesButton addImageBottomRight:[UIImage imageNamed:MIND_ICON]];
        [mindExercisesButton addTarget:self action:@selector(mindExercisesPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellWidth;
        self.currentY += SPACE_BETWEEN_CELLS;
        self.currentY += 20;
        
        cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
        
        [self.contentView addSubview: strengtheningButton];
        [self.contentView addSubview: stretchingButton];
        [self.contentView addSubview: functionalMobilityButton];
        [self.contentView addSubview: mindExercisesButton];
        
        /* Text view */
        [self addHeaderWithText:EXERCISES_GENERAL_INSTRUCTIONS_TITLE];
        [self addBulletsPointWithText:EXERCISES_GENERAL_INSTRUCTIONS_BULLETS];
        
        self.alreadySetUpView = YES;
        self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
        [self.view addSubview:self.scrollView];
    }
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
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/* Action listeners for buttons */

- (void)strengtheningPressed {
    StrengtheningViewController *vc = [[StrengtheningViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)stretchingPressed {
    StretchingViewController *vc = [[StretchingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)functionalMobilityPressed {
    FunctionalMobilityViewController *vc = [[FunctionalMobilityViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)mindExercisesPressed {
    MindExercisesViewController *vc = [[MindExercisesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
