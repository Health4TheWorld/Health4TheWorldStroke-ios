//
//  LegsViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LegsViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HomeButton.h"

#import "VideoViewController.h"

@interface LegsViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
        
@end

@implementation LegsViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Legs";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    float cellHeight = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS/2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *u8Button = [[HomeButton alloc] initWithText:@"1A Toe" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [u8Button addImageFullSize:[UIImage imageNamed:LEGS_1A_TOE]];
    [u8Button addTarget:self action:@selector(u8Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *s1Button = [[HomeButton alloc] initWithText:@"S1" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [s1Button addImageRightCenter:[UIImage imageNamed:EXERCISE_ICON]];
    [s1Button addTarget:self action:@selector(s1Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellHeight;
    startingY += SPACE_BETWEEN_CELLS;
    //cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
    
    HomeButton *s2Button = [[HomeButton alloc] initWithText:@"S2" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellHeight)];
    [s2Button addImageBottomRight:[UIImage imageNamed:LEARN_ICON]];
    [s2Button addTarget:self action:@selector(s2Pressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.contentView addSubview: u8Button];
    [self.contentView addSubview: s1Button];
    [self.contentView addSubview: s2Button];
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)u8Pressed {
    VideoViewController *videoVC = [[VideoViewController alloc] init];
    [videoVC setUpVideo:@"u8.m4v"];
    [self.navigationController pushViewController:videoVC animated:YES];
}

- (void)s1Pressed {
    
}

- (void)s2Pressed {
    
}

- (void)viewWillAppear:(BOOL)animated {
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
