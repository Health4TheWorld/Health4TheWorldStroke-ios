//
//  AddReminderTimesViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AddReminderTimesViewController.h"
#import "Constants.h"

@interface AddReminderTimesViewController ()
@property (strong, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation AddReminderTimesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpColors];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setUpColors {
    self.saveButton.backgroundColor = HFTW_MAGENTA;
    self.saveButton.clipsToBounds = YES;
    self.saveButton.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closePressed:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonPressed:(id)sender {
    [self.delegate createdReminder:self.reminder];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
