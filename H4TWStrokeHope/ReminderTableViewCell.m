//
//  ReminderTableViewCell.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/28/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Constants.h"
#import "ReminderTableViewCell.h"

#define LABELS_LEADING_CONSTRAINT_WITH_CHECK_MARK 66
#define LABELS_LEADING_CONSTRAINT_WITHOUT_CHECK_MARK 10

@implementation ReminderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpColors];
}

- (void)setUpColors {
    self.reminderNameLabel.textColor = HFTW_TEXT_GRAY;
    self.reminderTimeLabel.textColor = HFTW_MAGENTA;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutCellWithReminder:(Reminder *)reminder isToday:(BOOL)isToday; {
    self.reminder = reminder;
    
    /* Reminder title */
    self.reminderNameLabel.text = reminder.reminderName;

    /* Reminder frequency */
    NSString *daysStr = @"";
    if (reminder.reminderDays.count == 7) {
        daysStr = [NSString stringWithFormat:@"%@ || ", NSLocalizedString(@"Reminders.daily", nil)];
    } else if (reminder.reminderDays.count == 1) {
        daysStr = [NSString stringWithFormat:@"%@ || ", NSLocalizedString(@"Reminders.weekly", nil)];
    }
    NSString *days = @"";
    for (int i=0; i < reminder.reminderDays.count; i++) {
        NSString *dayStr = [reminder.reminderDays objectAtIndex:i];
        if (dayStr == NSLocalizedString(@"Reminders.sunday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.sundays", nil);
        } else if (dayStr == NSLocalizedString(@"Reminders.monday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.mondays", nil);
        } else if (dayStr == NSLocalizedString(@"Reminders.tuesday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.tuesdays", nil);
        } else if (dayStr == NSLocalizedString(@"Reminders.wednesday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.wednesdays", nil);
        } else if (dayStr == NSLocalizedString(@"Reminders.thursday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.thursdays", nil);
        } else if (dayStr == NSLocalizedString(@"Reminders.friday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.fridays", nil);
        } else if (dayStr == NSLocalizedString(@"Reminders.saturday", nil)) {
            dayStr = NSLocalizedString(@"Reminders.saturdays", nil);
        }
        if (i==0) {
            NSString *firstLetter = [dayStr substringToIndex:1];
            NSString *rest = [dayStr substringFromIndex:1];
            dayStr = [NSString stringWithFormat:@"%@%@", [firstLetter uppercaseString], [rest lowercaseString]];
        }
        NSString *day = @"";
        if (i == (reminder.reminderDays.count - 1)) {
            day = [NSString stringWithFormat:@"%@", [dayStr capitalizedString]];
        } else {
            day = [NSString stringWithFormat:@"%@, ", [dayStr capitalizedString]];
        }
        days = [days stringByAppendingString:day];
    }
    if (reminder.reminderDays.count != 7) {
        daysStr = [daysStr stringByAppendingString:days];
    }
    
    /* Reminder time */
    NSString *timeStr = @"";
    for (int i=0; i < reminder.times.count; i++) {
        NSString *currTime = [reminder.times objectAtIndex:i];
        if (i == (reminder.times.count - 1)) {
            timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"%@", currTime]];
        } else {
            timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"%@, ", currTime]];
        }
    }
    
    self.reminderTimeLabel.text = [NSString stringWithFormat:@"%@ %@", daysStr, timeStr];
    
    /* Check mark */
    if (isToday) {
        self.labelsLeadingConstraint.constant = LABELS_LEADING_CONSTRAINT_WITH_CHECK_MARK;
        self.checkButton.hidden = NO;
        if (self.reminder.isCompleted) {
            [self.checkButton setImage:[UIImage imageNamed:REMINDER_CHECK_SELECTED] forState:UIControlStateNormal];
        } else {
            [self.checkButton setImage:[UIImage imageNamed:REMINDER_CHECK_UNSELECTED] forState:UIControlStateNormal];
        }
    } else {
        self.labelsLeadingConstraint.constant = LABELS_LEADING_CONSTRAINT_WITHOUT_CHECK_MARK;
        self.checkButton.hidden = YES;
    }
    
    [self layoutIfNeeded];
}

- (IBAction)clickedCheck:(id)sender {
    if (self.reminder.isCompleted) {
        [self.checkButton setImage:[UIImage imageNamed:REMINDER_CHECK_UNSELECTED] forState:UIControlStateNormal];
    } else {
        [self.checkButton setImage:[UIImage imageNamed:REMINDER_CHECK_SELECTED] forState:UIControlStateNormal];
    }
    [self.delegate clickedCheckOnReminder:self.reminder];
}

@end
