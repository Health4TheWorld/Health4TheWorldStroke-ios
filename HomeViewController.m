//
//  HomeViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HomeViewController.h"
#import "Constants.h"
#import "HomeButton.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:@"WhiteBackArrow"]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    self.title = @"HOME";
    
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *helpMeSpeakButton = [[HomeButton alloc] initWithText:@"Help Me Speak" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [helpMeSpeakButton addTarget:self action:@selector(helpMeSpeakPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *exercisesButton = [[HomeButton alloc] initWithText:@"Exercises" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [exercisesButton addTarget:self action:@selector(exercisePressed) forControlEvents:UIControlEventTouchUpInside];

    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *learnButton = [[HomeButton alloc] initWithText:@"Learn" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [learnButton addTarget:self action:@selector(learnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *remindersButton = [[HomeButton alloc] initWithText:@"Reminders" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [remindersButton addTarget:self action:@selector(remindersPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *generalInfoButton = [[HomeButton alloc] initWithText:@"General Info" withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [generalInfoButton addTarget:self action:@selector(generalInfoPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *surveysButton = [[HomeButton alloc] initWithText:@"Surveys" withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [surveysButton addTarget:self action:@selector(surveysPressed) forControlEvents:UIControlEventTouchUpInside];

    [self.contentView addSubview:helpMeSpeakButton];
    [self.contentView addSubview:exercisesButton];
    [self.contentView addSubview:learnButton];
    [self.contentView addSubview:remindersButton];
    [self.contentView addSubview:generalInfoButton];
    [self.contentView addSubview:surveysButton];

    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, startingY);
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)helpMeSpeakPressed {
    NSLog(@"Help me speak pressed");
}

- (void)exercisePressed {
    NSLog(@"Exercises pressed");
}

- (void)learnPressed {
    NSLog(@"Learn pressed");
}

- (void)remindersPressed {
    NSLog(@"Reminders pressed");
}

- (void)generalInfoPressed {
    NSLog(@"General Info pressed");
}

- (void)surveysPressed {
    NSLog(@"Surveys pressed");
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
