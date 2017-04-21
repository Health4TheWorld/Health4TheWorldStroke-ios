//
//  ExercisesHomeViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/20/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "ExercisesHomeViewController.h"
#import "ExercisesViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "GraphicUtils.h"
#import "VideoViewController.h"

@interface ExercisesHomeViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) IBOutlet UITextView *TextArea;
@property (strong, nonatomic) IBOutlet UIButton *getStartedButton;

@end

@implementation ExercisesHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GraphicUtils styleButton:self.getStartedButton];
    self.title = @"EXERCISES HOME";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON];
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    /* Setup the view */
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    //float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    // Set Exercise text
    self.TextArea.text = EXERCISE_PARAGRAPH_ONE;
    
    //Set video container and play video on a loop
    VideoViewController *vc = [[VideoViewController alloc] init];
    AVPlayerViewController *controller= [vc setUpCustomVideo:VIDEO_5A_FEMALE_DOC withFrame:nil];

    [self addChildViewController: controller];
    [self.videoView addSubview: controller.view];
    controller.view.frame = self.videoView.frame;
    
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
    
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/* Action listeners for buttons */

- (IBAction)getStartedPressed:(UIButton *)sender {
    ExercisesViewController *vc = [[ExercisesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
