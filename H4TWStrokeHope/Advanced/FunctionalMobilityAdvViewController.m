//
//  FunctionalMobilityViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 12/28/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "FunctionalMobilityAdvViewController.h"

#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"

@interface FunctionalMobilityAdvViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) UILabel *welcomeMessage;

@end

@implementation FunctionalMobilityAdvViewController
-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Exercises.functionalMobility", nil) uppercaseString];
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(10, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    float startingY = SPACE_BETWEEN_CELLS;
    self.welcomeMessage = [[UILabel alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, 0)];
    self.welcomeMessage.text = NSLocalizedString(@"Exercises.functionalMobility.Instructions", nil);
    self.welcomeMessage.font = [UIFont fontWithName:@"Lato-regular" size:16.0];
    self.welcomeMessage.textColor = HFTW_TEXT_GRAY;
    self.welcomeMessage.numberOfLines = 0;
    self.welcomeMessage.textAlignment = NSTextAlignmentLeft;
    [self.welcomeMessage sizeToFit];
    CGRect welcomeMessageFrame = self.welcomeMessage.frame;
    welcomeMessageFrame.size.height = [Utils heightOfString:self.welcomeMessage.text containedToWidth:welcomeMessageFrame.size.width withFont:self.welcomeMessage.font];
    self.welcomeMessage.frame = welcomeMessageFrame;
    startingY += (welcomeMessageFrame.size.height + 20);
    
    HomeButton *a1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.functionalMobility.h1", nil)   withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [a1Button addRoundImageCentered:[UIImage imageNamed:ARMS_2A_ELBOW]];
    [a1Button addTarget:self action:@selector(a1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *b1Button = [[HomeButton alloc] initWithText:NSLocalizedString(@"Exercises.functionalMobility.h2", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [b1Button addRoundImageCentered:[UIImage imageNamed:ARMS_2B_SHOULDER]];
    [b1Button addTarget:self action:@selector(b1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    [self.contentView addSubview: a1Button];
    [self.contentView addSubview: b1Button];
    [self.contentView addSubview: self.welcomeMessage];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)a1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.functionalMobility.h1", nil) ;
    [videoVC setUpVideo: VIDEO_FM_ROLLINGINBED];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)b1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = NSLocalizedString(@"Exercises.functionalMobility.h2", nil) ;
    [videoVC setUpVideo: VIDEO_FM_ROLLINGOUTBED];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)c1Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    videoVC.title = LEGS_TITLE_1C_HIP;
    [videoVC setUpVideo: VIDEO_1C_HIP_FLEXION];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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

