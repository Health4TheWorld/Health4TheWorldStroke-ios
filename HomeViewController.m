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

#import "HelpMeSpeakViewController.h"
#import "ExercisesViewController.h"
#import "LearnViewController.h"
#import "RemindersViewController.h"
#import "GeneralInfoViewController.h"
#import "SurveysViewController.h"
#import "ChatBotViewController.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLog(@"Language: %@", language);
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.title = [NSLocalizedString(@"Home.title", nil) uppercaseString];
}

- (void)viewDidAppear:(BOOL)animated {
    [self setUpView];
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width / 2) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    
    float startingY = SPACE_BETWEEN_CELLS;
    
    HomeButton *helpMeSpeakButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.helpMeSpeak", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [helpMeSpeakButton addImageBottomRight:[UIImage imageNamed:HELP_ME_SPEAK_ICON]];
    [helpMeSpeakButton addTarget:self action:@selector(helpMeSpeakPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *exercisesButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.exercises", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [exercisesButton addImageRightCenter:[UIImage imageNamed:EXERCISE_ICON]];
    [exercisesButton addTarget:self action:@selector(exercisePressed) forControlEvents:UIControlEventTouchUpInside];

    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *learnButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.learn", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [learnButton addImageBottomRight:[UIImage imageNamed:LEARN_ICON]];
    [learnButton addTarget:self action:@selector(learnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *remindersButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.reminders", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [remindersButton addImageBottomRight:[UIImage imageNamed:REMINDERS_ICON]];
    [remindersButton addTarget:self action:@selector(remindersPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *generalInfoButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.generalInfo", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth)];
    [generalInfoButton addImageCentered:[UIImage imageNamed:GENERAL_INFO_ICON]];
    [generalInfoButton addTarget:self action:@selector(generalInfoPressed) forControlEvents:UIControlEventTouchUpInside];
    
    HomeButton *surveysButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.surveys", nil) withFrame:CGRectMake((self.view.frame.size.width / 2) + (SPACE_BETWEEN_CELLS / 2), startingY, cellWidth, cellWidth)];
    [surveysButton addImageBottomRight:[UIImage imageNamed:SURVEYS_ICON]];
    [surveysButton addTarget:self action:@selector(surveysPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;
    
    HomeButton *chatBotButton = [[HomeButton alloc] initWithText:NSLocalizedString(@"Home.chatBot", nil) withFrame:CGRectMake(SPACE_BETWEEN_CELLS, startingY, ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2), cellWidth)];
    [chatBotButton addImageCentered:[UIImage imageNamed:CHATBOT_ICON]];
    [chatBotButton addTarget:self action:@selector(chatBotPressed) forControlEvents:UIControlEventTouchUpInside];
    
    startingY += cellWidth;
    startingY += SPACE_BETWEEN_CELLS;

    [self.contentView addSubview:helpMeSpeakButton];
    [self.contentView addSubview:exercisesButton];
    [self.contentView addSubview:learnButton];
    [self.contentView addSubview:remindersButton];
    [self.contentView addSubview:generalInfoButton];
    [self.contentView addSubview:surveysButton];
    [self.contentView addSubview:chatBotButton];

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
    HelpMeSpeakViewController *vc = [[HelpMeSpeakViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)exercisePressed {
    ExercisesViewController *vc = [[ExercisesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)learnPressed {
    LearnViewController *vc = [[LearnViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)remindersPressed {
    RemindersViewController *vc = [[RemindersViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)generalInfoPressed {
    GeneralInfoViewController *vc = [[GeneralInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)surveysPressed {
    SurveysViewController *vc = [[SurveysViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)chatBotPressed {
    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout alloc];
    ChatBotViewController *vc = [[ChatBotViewController alloc] initWithCollectionViewLayout:flowLayout];
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
