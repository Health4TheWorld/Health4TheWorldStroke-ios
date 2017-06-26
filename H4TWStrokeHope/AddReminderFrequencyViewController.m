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
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *frequencyDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *dailyTab;
@property (strong, nonatomic) IBOutlet UIView *dailyTabBar;
@property (strong, nonatomic) IBOutlet UIButton *weeklyTab;
@property (strong, nonatomic) IBOutlet UIView *weeklyTabBar;
@property (strong, nonatomic) IBOutlet UIButton *customTab;
@property (strong, nonatomic) IBOutlet UIView *customTabBar;
@property NSString *tabSelected;
@property (strong, nonatomic) IBOutlet UIButton *sundayButton;
@property (strong, nonatomic) IBOutlet UIButton *mondayButton;
@property (strong, nonatomic) IBOutlet UIButton *tuesdayButton;
@property (strong, nonatomic) IBOutlet UIButton *wednesdayButton;
@property (strong, nonatomic) IBOutlet UIButton *thursdayButton;
@property (strong, nonatomic) IBOutlet UIButton *fridayButton;
@property (strong, nonatomic) IBOutlet UIButton *saturdayButton;
@property (strong, nonatomic) IBOutlet UIView *weekContainer;
@property (strong, nonatomic) IBOutlet UISwitch *oneTimeReminderSwitch;
@property (strong, nonatomic) IBOutlet UILabel *oneTimeReminderLabel;
@end

#define DAILY_TAB @"Daily"
#define WEEKLY_TAB @"Weekly"
#define CUSTOM_TAB @"Custom"

#define BUTTON_IS_SELECTED 100
#define BUTTON_IS_NOT_SELECTED 101

@implementation AddReminderFrequencyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpColors];
    [self setButtonText];
    if (self.isEditing) {
        [self.nextButton setTitle:[NSLocalizedString(@"Reminders.save", nil) uppercaseString] forState:UIControlStateNormal];
        self.backButton.hidden = YES;
        [self loadEdits];
    } else {
        [self.nextButton setTitle:[NSLocalizedString(@"Reminders.next", nil) uppercaseString] forState:UIControlStateNormal];
        self.backButton.hidden = NO;
        [self dailyTabPressed:nil];
    }
    
    self.titleLabel.text = NSLocalizedString(@"Reminders.howOften", nil);
    [self.dailyTab setTitle:NSLocalizedString(@"Reminders.daily", nil) forState:UIControlStateNormal];
    [self.weeklyTab setTitle:NSLocalizedString(@"Reminders.weekly", nil) forState:UIControlStateNormal];
    [self.customTab setTitle:NSLocalizedString(@"Reminders.custom", nil) forState:UIControlStateNormal];
    [self.backButton setTitle:NSLocalizedString(@"Reminders.back", nil) forState:UIControlStateNormal];
    self.oneTimeReminderLabel.text = NSLocalizedString(@"Reminders.oneTimeReminder", nil);
}

- (void)setButtonText {
    [self.sundayButton setTitle:NSLocalizedString(@"Reminders.sundayAbbrev", nil) forState:UIControlStateNormal];
    [self.mondayButton setTitle:NSLocalizedString(@"Reminders.mondayAbbrev", nil) forState:UIControlStateNormal];
    [self.tuesdayButton setTitle:NSLocalizedString(@"Reminders.tuesdayAbbrev", nil) forState:UIControlStateNormal];
    [self.wednesdayButton setTitle:NSLocalizedString(@"Reminders.wednesdayAbbrev", nil) forState:UIControlStateNormal];
    [self.thursdayButton setTitle:NSLocalizedString(@"Reminders.thursdayAbbrev", nil) forState:UIControlStateNormal];
    [self.fridayButton setTitle:NSLocalizedString(@"Reminders.fridayAbbrev", nil) forState:UIControlStateNormal];
    [self.saturdayButton setTitle:NSLocalizedString(@"Reminders.saturdayAbbrev", nil) forState:UIControlStateNormal];
}

/* Sets up the view to display whatever frequency the user had previously saved. */
- (void)loadEdits {
    if (self.reminder.reminderDays.count == 7) {
        /* First check if it's daily. */
        [self dailyTabPressed:nil];
    } else {
        if (self.reminder.isOneTimeReminder) {
            [self customTabPressed:nil];
            [self.oneTimeReminderSwitch setOn:YES];
        } else if (self.reminder.reminderDays.count == 1) {
            /* First check if it's weekly. */
            [self weeklyTabPressed:nil];
            [self.oneTimeReminderSwitch setOn:NO];
        } else {
            [self customTabPressed:nil];
            [self.oneTimeReminderSwitch setOn:NO];
        }
        for (NSString *day in self.reminder.reminderDays) {
            if ([day isEqualToString:SUNDAY]) {
                [self sundayPressed:nil];
            }
            if ([day isEqualToString:MONDAY]) {
                [self mondayPressed:nil];
            }
            if ([day isEqualToString:TUESDAY]) {
                [self tuesdayPressed:nil];
            }
            if ([day isEqualToString:WEDNESDAY]) {
                [self wednesdayPressed:nil];
            }
            if ([day isEqualToString:THURSDAY]) {
                [self thursdayPressed:nil];
            }
            if ([day isEqualToString:FRIDAY]) {
                [self fridayPressed:nil];
            }
            if ([day isEqualToString:SATURDAY]) {
                [self saturdayPressed:nil];
            }
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setUpColors {
    self.titleLabel.textColor = HFTW_TEXT_GRAY;
    self.frequencyDescriptionLabel.textColor = HFTW_TEXT_GRAY;
    self.nextButton.backgroundColor = HFTW_MAGENTA;
    self.nextButton.clipsToBounds = YES;
    self.nextButton.layer.cornerRadius = 10;
    [self.backButton setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    self.oneTimeReminderLabel.textColor = HFTW_TEXT_GRAY;
    [self.oneTimeReminderSwitch setOnTintColor:HFTW_RED];
    
    [self.dailyTab setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    [self.weeklyTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    [self.customTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    
    self.weekContainer.backgroundColor = HFTW_MAGENTA;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPressed:(id)sender {
    /* Create reminder days array that includes all of the days for the reminder */
    NSMutableArray *reminderDays = [[NSMutableArray alloc] init];
    if (self.sundayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:SUNDAY];
    }
    if (self.mondayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:MONDAY];
    }
    if (self.tuesdayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:TUESDAY];
    }
    if (self.wednesdayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:WEDNESDAY];
    }
    if (self.thursdayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:THURSDAY];
    }
    if (self.fridayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:FRIDAY];
    }
    if (self.saturdayButton.tag == BUTTON_IS_SELECTED) {
        [reminderDays addObject:SATURDAY];
    }
    
    if ((!self.oneTimeReminderSwitch.hidden) && (self.oneTimeReminderSwitch.isOn)) {
        self.reminder.isOneTimeReminder = YES;
    }
    
    if (self.isEditing) {
        self.reminder.reminderDays = reminderDays;
        if (self.delegate && ([self.delegate respondsToSelector:@selector(editedReminderFrequency:)])) {
            [self.delegate editedReminderFrequency:reminderDays];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        self.reminder.reminderDays = reminderDays;
        AddReminderTimesViewController *next = [[AddReminderTimesViewController alloc] init];
        next.reminder = self.reminder;
        next.isEditing = NO;
        next.delegate = self.remindersVC;
        [self.navigationController pushViewController:next animated:YES];
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

- (void)generateFrequencyStringForCustomDates {
    NSMutableArray *selectedDays = [[NSMutableArray alloc] init];
    if (self.sundayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:SUNDAY];
    }
    if (self.mondayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:MONDAY];
    }
    if (self.tuesdayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:TUESDAY];
    }
    if (self.wednesdayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:WEDNESDAY];
    }
    if (self.thursdayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:THURSDAY];
    }
    if (self.fridayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:FRIDAY];
    }
    if (self.saturdayButton.tag == BUTTON_IS_SELECTED) {
        [selectedDays addObject:SATURDAY];
    }
    
    NSString *frequencyStr = NSLocalizedString(@"Reminders.every", nil);
    if (selectedDays.count == 7) {
        frequencyStr = EVERYDAY;
    } else {
        for (int i=0; i < selectedDays.count; i++) {
            NSString *selectedDay = [selectedDays objectAtIndex:i];
            if (i==0) {
                selectedDay = [selectedDay capitalizedString];
                NSString *firstLetter = [selectedDay substringToIndex:1];
                NSString *restOfString = [selectedDay substringFromIndex:1];
                selectedDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            }
            if (i == (selectedDays.count-1)) {
                /* Last object */
                if (selectedDays.count > 1) {
                    frequencyStr = [frequencyStr stringByAppendingString:[NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.and", nil), selectedDay]];
                } else {
                    frequencyStr = [NSString stringWithFormat:@"%@.", selectedDay];
                }
            }
            else {
                if ((i == (selectedDays.count-2))&&(selectedDays.count == 2)) {
                    /* Second to last day and there are only two days, so no comma */
                    frequencyStr = [frequencyStr stringByAppendingString:[NSString stringWithFormat:@"%@ ", selectedDay]];
                } else {
                    /* More than 2 days, so yes comma */
                    frequencyStr = [frequencyStr stringByAppendingString:[NSString stringWithFormat:@"%@, ", selectedDay]];
                }
            }
        }
    }
    self.frequencyDescriptionLabel.text = frequencyStr;
}

- (IBAction)dailyTabPressed:(id)sender {
    self.weekContainer.backgroundColor = [UIColor whiteColor];
    self.frequencyDescriptionLabel.text = EVERYDAY;
    self.tabSelected = DAILY_TAB;
    [self.dailyTab setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    [self.weeklyTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    [self.customTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    self.dailyTabBar.hidden = NO;
    self.weeklyTabBar.hidden = YES;
    self.customTabBar.hidden = YES;
    self.oneTimeReminderSwitch.hidden = YES;
    self.oneTimeReminderLabel.hidden = YES;
    
    [self markWeekButtonSelected:self.sundayButton];
    [self markWeekButtonSelected:self.mondayButton];
    [self markWeekButtonSelected:self.tuesdayButton];
    [self markWeekButtonSelected:self.wednesdayButton];
    [self markWeekButtonSelected:self.thursdayButton];
    [self markWeekButtonSelected:self.fridayButton];
    [self markWeekButtonSelected:self.saturdayButton];
}

- (IBAction)weeklyTabPressed:(id)sender {
    self.weekContainer.backgroundColor = HFTW_MAGENTA;
    
    NSString *theDay = [SUNDAY capitalizedString];
    NSString *firstLetter = [theDay substringToIndex:1];
    NSString *restOfString = [theDay substringFromIndex:1];
    theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
    self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
    
    self.tabSelected = WEEKLY_TAB;
    [self.dailyTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    [self.weeklyTab setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    [self.customTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    self.dailyTabBar.hidden = YES;
    self.weeklyTabBar.hidden = NO;
    self.customTabBar.hidden = YES;
    self.oneTimeReminderSwitch.hidden = YES;
    self.oneTimeReminderLabel.hidden = YES;
    
    /* Select sunday as default. */
    [self sundayPressed:nil];
}

- (IBAction)customTabPressed:(id)sender {
    self.weekContainer.backgroundColor = HFTW_MAGENTA;
    self.tabSelected = CUSTOM_TAB;
    [self.dailyTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    [self.weeklyTab setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
    [self.customTab setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    self.dailyTabBar.hidden = YES;
    self.weeklyTabBar.hidden = YES;
    self.customTabBar.hidden = NO;
    self.oneTimeReminderSwitch.hidden = NO;
    self.oneTimeReminderLabel.hidden = NO;
    
    [self markWeekButtonUnselected:self.sundayButton];
    [self markWeekButtonUnselected:self.mondayButton];
    [self markWeekButtonUnselected:self.tuesdayButton];
    [self markWeekButtonUnselected:self.wednesdayButton];
    [self markWeekButtonUnselected:self.thursdayButton];
    [self markWeekButtonUnselected:self.fridayButton];
    [self markWeekButtonUnselected:self.saturdayButton];
    self.frequencyDescriptionLabel.text = @"";
}

- (void)markWeekButtonSelected:(UIButton *)button {
    button.backgroundColor = HFTW_MAGENTA;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.tag = BUTTON_IS_SELECTED;
}

- (void)markWeekButtonUnselected:(UIButton *)button {
    button.backgroundColor = [UIColor whiteColor];
    [button setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    button.tag = BUTTON_IS_NOT_SELECTED;
}

#pragma mark - Week Buttons
- (IBAction)sundayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [SUNDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonSelected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        } else {
            /* Select Sunday if it's not selected, deselect if it is. */
            if (self.sundayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.sundayButton];
            } else {
                [self markWeekButtonSelected:self.sundayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    } else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [SUNDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Sunday and select Sunday. */
        [self markWeekButtonSelected:self.sundayButton];
        [self markWeekButtonUnselected:self.mondayButton];
        [self markWeekButtonUnselected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.thursdayButton];
        [self markWeekButtonUnselected:self.fridayButton];
        [self markWeekButtonUnselected:self.saturdayButton];
    }
}

- (IBAction)mondayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [MONDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonSelected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        } else {
            /* Select Monday if it's not selected, deselect if it is. */
            if (self.mondayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.mondayButton];
            } else {
                [self markWeekButtonSelected:self.mondayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    } else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [MONDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Monday and select Monday. */
        [self markWeekButtonSelected:self.mondayButton];
        [self markWeekButtonUnselected:self.sundayButton];
        [self markWeekButtonUnselected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.thursdayButton];
        [self markWeekButtonUnselected:self.fridayButton];
        [self markWeekButtonUnselected:self.saturdayButton];
    }
}

- (IBAction)tuesdayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [TUESDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonSelected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        } else {
            /* Select Tuesday if it's not selected, deselect if it is. */
            if (self.tuesdayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.tuesdayButton];
            } else {
                [self markWeekButtonSelected:self.tuesdayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    } else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [TUESDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Tuesday and select Tuesday. */
        [self markWeekButtonSelected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.sundayButton];
        [self markWeekButtonUnselected:self.mondayButton];
        [self markWeekButtonUnselected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.thursdayButton];
        [self markWeekButtonUnselected:self.fridayButton];
        [self markWeekButtonUnselected:self.saturdayButton];
    }
}

- (IBAction)wednesdayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [WEDNESDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonSelected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        } else {
            /* Select Wednesday if it's not selected, deselect if it is. */
            if (self.wednesdayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.wednesdayButton];
            } else {
                [self markWeekButtonSelected:self.wednesdayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    } else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [WEDNESDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Wednesday and select Wednesday. */
        [self markWeekButtonSelected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.sundayButton];
        [self markWeekButtonUnselected:self.mondayButton];
        [self markWeekButtonUnselected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.thursdayButton];
        [self markWeekButtonUnselected:self.fridayButton];
        [self markWeekButtonUnselected:self.saturdayButton];
    }
}

- (IBAction)thursdayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [THURSDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonSelected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        } else {
            /* Select Thursday if it's not selected, deselect if it is. */
            if (self.thursdayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.thursdayButton];
            } else {
                [self markWeekButtonSelected:self.thursdayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    } else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [THURSDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Thursday and select Thursday. */
        [self markWeekButtonSelected:self.thursdayButton];
        [self markWeekButtonUnselected:self.sundayButton];
        [self markWeekButtonUnselected:self.mondayButton];
        [self markWeekButtonUnselected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.fridayButton];
        [self markWeekButtonUnselected:self.saturdayButton];
    }
}

- (IBAction)fridayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [FRIDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonSelected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        } else {
            /* Select Friday if it's not selected, deselect if it is. */
            if (self.fridayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.fridayButton];
            } else {
                [self markWeekButtonSelected:self.fridayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    } else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [FRIDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Friday and select Friday. */
        [self markWeekButtonSelected:self.fridayButton];
        [self markWeekButtonUnselected:self.sundayButton];
        [self markWeekButtonUnselected:self.mondayButton];
        [self markWeekButtonUnselected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.thursdayButton];
        [self markWeekButtonUnselected:self.saturdayButton];
    }
}

- (IBAction)saturdayPressed:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        /* If it's a one time reminder, only allow them to select one day. */
        if (self.oneTimeReminderSwitch.isOn) {
            NSString *theDay = [SATURDAY capitalizedString];
            NSString *firstLetter = [theDay substringToIndex:1];
            NSString *restOfString = [theDay substringFromIndex:1];
            theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
            self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
            /* Deselect all buttons that aren't Monday and select Monday. */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonSelected:self.saturdayButton];
        } else {
            /* Deselect all buttons that aren't Saturday and select Saturday. */
            if (self.saturdayButton.tag == BUTTON_IS_SELECTED) {
                [self markWeekButtonUnselected:self.saturdayButton];
            } else {
                [self markWeekButtonSelected:self.saturdayButton];
            }
        }
        [self generateFrequencyStringForCustomDates];
    }  else if ([self.tabSelected isEqualToString:WEEKLY_TAB]) {
        NSString *theDay = [SATURDAY capitalizedString];
        NSString *firstLetter = [theDay substringToIndex:1];
        NSString *restOfString = [theDay substringFromIndex:1];
        theDay = [NSString stringWithFormat:@"%@%@", [firstLetter capitalizedString], [restOfString lowercaseString]];
        self.frequencyDescriptionLabel.text = [NSString stringWithFormat:@"%@ %@.", NSLocalizedString(@"Reminders.every", nil), theDay];
        /* Deselect all buttons that aren't Saturday and select Saturday. */
        [self markWeekButtonSelected:self.saturdayButton];
        [self markWeekButtonUnselected:self.sundayButton];
        [self markWeekButtonUnselected:self.mondayButton];
        [self markWeekButtonUnselected:self.tuesdayButton];
        [self markWeekButtonUnselected:self.wednesdayButton];
        [self markWeekButtonUnselected:self.thursdayButton];
        [self markWeekButtonUnselected:self.fridayButton];
    }
}

- (IBAction)oneTimeReminderSwitched:(id)sender {
    if ([self.tabSelected isEqualToString:CUSTOM_TAB]) {
        if (self.oneTimeReminderSwitch.isOn) {
            /* If they turn on the switch saying they want this to be a custom reminder, than deselect all the days (they can now only select one day). */
            [self markWeekButtonUnselected:self.mondayButton];
            [self markWeekButtonUnselected:self.sundayButton];
            [self markWeekButtonUnselected:self.tuesdayButton];
            [self markWeekButtonUnselected:self.wednesdayButton];
            [self markWeekButtonUnselected:self.thursdayButton];
            [self markWeekButtonUnselected:self.fridayButton];
            [self markWeekButtonUnselected:self.saturdayButton];
        }
    }
}

@end
