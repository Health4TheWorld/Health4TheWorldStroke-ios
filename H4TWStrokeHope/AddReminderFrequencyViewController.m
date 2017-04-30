//
//  AddReminderFrequencyViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AddReminderFrequencyViewController.h"
#import "AddReminderTimesViewController.h"
#import "Constants.h"

@interface AddReminderFrequencyViewController ()
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation AddReminderFrequencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpColors];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setUpColors {
    self.nextButton.backgroundColor = HFTW_MAGENTA;
    self.nextButton.clipsToBounds = YES;
    self.nextButton.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPressed:(id)sender {
    AddReminderTimesViewController *next = [[AddReminderTimesViewController alloc] init];
    next.reminder = self.reminder;
    next.delegate = self.remindersVC;
    [self.navigationController pushViewController:next animated:YES];
}

- (IBAction)closePressed:(id)sender {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backPressed:(id)sender {
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
