//
//  AddReminderTitleViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AddReminderTitleViewController.h"
#import "AddReminderFrequencyViewController.h"
#import "Constants.h"

@interface AddReminderTitleViewController ()
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *searchUnderBar;
@property (strong, nonatomic) IBOutlet UITextField *reminderTextField;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchUnderBarLeadingConstraint;
@property (strong, nonatomic) IBOutlet UIButton *doctorsVisitButton;
@property (strong, nonatomic) IBOutlet UIButton *bloodTestButton;
@property (strong, nonatomic) IBOutlet UIButton *exerciseButton;
@property (strong, nonatomic) IBOutlet UIButton *medicationButton;
@end

#define REMINDER_UNDERBAR_LEADING_CONSTRAINT 50

@implementation AddReminderTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpColors];
    
    if (!self.editing) {
        self.reminder = [[Reminder alloc] init];
    }
    
    /* Create tap view so that we can hide keyboard when they tap outside textfield */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.delegate = self;
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    
    if (self.isEditing) {
        [self.nextButton setTitle:@"SAVE" forState:UIControlStateNormal];
        self.reminderTextField.text = self.reminder.reminderName;
    } else {
        [self.nextButton setTitle:@"NEXT" forState:UIControlStateNormal];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setUpColors {
    self.nextButton.backgroundColor = HFTW_MAGENTA;
    self.nextButton.clipsToBounds = YES;
    self.nextButton.layer.cornerRadius = 10;
    self.titleLabel.textColor = HFTW_TEXT_GRAY;
    self.searchUnderBar.backgroundColor = HFTW_LIGHT_GRAY;
    self.reminderTextField.textColor
    = HFTW_MAGENTA;
    
    [self.doctorsVisitButton setTitle:DOCTORS_VISIT_REMINDER forState:UIControlStateNormal];
    [self.doctorsVisitButton setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    [self.bloodTestButton setTitle:BLOOD_TEST_REMINDER forState:UIControlStateNormal];
    [self.bloodTestButton setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    [self.exerciseButton setTitle:EXERCISE_REMINDER forState:UIControlStateNormal];
    [self.exerciseButton setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    [self.medicationButton setTitle:MEDICATION_REMINDER forState:UIControlStateNormal];
    [self.medicationButton setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPressed:(id)sender {
    /* Check that there's text */
    if (self.reminderTextField.text.length == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Missing name" message:@"Please give your reminder a name." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"Got it!" style:UIAlertActionStyleDefault handler:nil];
        alertController.view.tintColor = HFTW_MAGENTA;
        [alertController addAction:ok];
        [self presentViewController:alertController animated:YES completion:^{
            alertController.view.tintColor = HFTW_MAGENTA;
        }];
    } else {
        if (self.isEditing) {
            self.reminder.reminderName = self.reminderTextField.text;
            if (self.delegate && ([self.delegate respondsToSelector:@selector(editedReminderTitle:)])) {
                [self.delegate editedReminderTitle:self.reminderTextField.text];
            }
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            self.reminder.reminderName = self.reminderTextField.text;
            AddReminderFrequencyViewController *next = [[AddReminderFrequencyViewController alloc] init];
            next.reminder = self.reminder;
            next.isEditing = NO;
            next.remindersVC = self.remindersVC;
            [self.navigationController pushViewController:next animated:YES];
        }
    }
}

- (IBAction)closePressed:(id)sender {
    if (self.isEditing) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dismissKeyboard {
    [self exitSearchMode];
    [self.reminderTextField resignFirstResponder];
}

/* Animates the search underbar to the left */
- (void)goIntoSearchMode {
    [self.view layoutIfNeeded];
    self.searchUnderBarLeadingConstraint.constant = 0;
    [UIView animateWithDuration:0.3
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         // completion
                     }
     ];
}

/* Animates the search underbar to the right */
-(void)exitSearchMode {
    [self.view layoutIfNeeded];
    self.searchUnderBarLeadingConstraint.constant = REMINDER_UNDERBAR_LEADING_CONSTRAINT;
    [UIView animateWithDuration:0.3
                          delay: 0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         // completion
                     }
     ];
}

- (IBAction)doctorsVisitButtonPressed:(id)sender {
    self.reminderTextField.text = DOCTORS_VISIT_REMINDER;
}

- (IBAction)bloodTestButtonPressed:(id)sender {
    self.reminderTextField.text = BLOOD_TEST_REMINDER;
}

- (IBAction)exerciseButtonPressed:(id)sender {
    self.reminderTextField.text = EXERCISE_REMINDER;
}

- (IBAction)medicationButtonPressed:(id)sender {
    self.reminderTextField.text = MEDICATION_REMINDER;
}
#pragma mark – TextField delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self goIntoSearchMode];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
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
