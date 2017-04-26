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
@property BOOL alreadySetUpView;
@property float currentY;
@end

@implementation ExercisesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"EXERCISES";
    
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
        self.currentY = 75;
        
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
        HomeButton *strengtheningButton = [[HomeButton alloc] initWithText:@"Strengthening" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellWidth)];
        [strengtheningButton addImageBottomRight:[UIImage imageNamed: STRONG_ARM_ICON]];
        [strengtheningButton addTarget:self action:@selector(strengtheningPressed) forControlEvents:UIControlEventTouchUpInside];
        
        HomeButton *stretchingButton = [[HomeButton alloc] initWithText:@"Stretching" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), self.currentY, cellWidth, cellWidth)];
        [stretchingButton addImageCentered:[UIImage imageNamed:STRETCHING_ICON]];
        [stretchingButton addTarget:self action:@selector(stretchingPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellWidth;
        self.currentY += SPACE_BETWEEN_CELLS;
        
        HomeButton *functionalMobilityButton = [[HomeButton alloc] initWithText:@"Functional Mobility" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellWidth)];
        [functionalMobilityButton addImageBottomRight:[UIImage imageNamed:FUNCTIONAL_MOBILITY_ICON]];
        [functionalMobilityButton addTarget:self action:@selector(functionalMobilityPressed) forControlEvents:UIControlEventTouchUpInside];
        
        HomeButton *mindExercisesButton = [[HomeButton alloc] initWithText:@"Mind Exercises" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), self.currentY, cellWidth, cellWidth)];
        [mindExercisesButton addImageBottomRight:[UIImage imageNamed:MIND_ICON]];
        [mindExercisesButton addTarget:self action:@selector(mindExercisesPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellWidth;
        self.currentY += SPACE_BETWEEN_CELLS;
        self.currentY += 20;
        
        [self.contentView addSubview: strengtheningButton];
        [self.contentView addSubview: stretchingButton];
        [self.contentView addSubview: functionalMobilityButton];
        [self.contentView addSubview: mindExercisesButton];
        
        self.alreadySetUpView = YES;
        self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
        [self.view addSubview:self.scrollView];
    }
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
