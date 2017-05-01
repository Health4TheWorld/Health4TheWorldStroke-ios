//
//  ReminderTableViewCell.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/28/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Constants.h"
#import "ReminderTableViewCell.h"

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

- (void)layoutCellWithReminder:(Reminder *)reminder {
    self.reminder = reminder;
    
    /* Reminder title */
    self.reminderNameLabel.text = reminder.reminderName;

    /* Reminder frequency */
    NSString *timeStr = @"";
    if (reminder.reminderDays.count == 7) {
        timeStr = @"Daily || ";
    } else if (reminder.reminderDays.count == 1) {
        timeStr = @"Weekly || ";
    }
    NSString *days = @"";
    for (int i=0; i < reminder.reminderDays.count; i++) {
        NSString *day = @"";
        if (i == (reminder.reminderDays.count - 1)) {
            day = [NSString stringWithFormat:@"%@s", [[reminder.reminderDays objectAtIndex:i] capitalizedString]];
        } else {
            day = [NSString stringWithFormat:@"%@s, ", [[reminder.reminderDays objectAtIndex:i] capitalizedString]];
        }
        days = [days stringByAppendingString:day];
    }
    if (reminder.reminderDays.count != 7) {
        timeStr = [timeStr stringByAppendingString:days];
    }
    self.reminderTimeLabel.text = timeStr;
    
    /* Reminder time */
    
    /* Check mark */
    if (self.reminder.isCompleted) {
        [self.checkButton setImage:[UIImage imageNamed:REMINDER_CHECK_SELECTED] forState:UIControlStateNormal];
    } else {
        [self.checkButton setImage:[UIImage imageNamed:REMINDER_CHECK_UNSELECTED] forState:UIControlStateNormal];
    }
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
