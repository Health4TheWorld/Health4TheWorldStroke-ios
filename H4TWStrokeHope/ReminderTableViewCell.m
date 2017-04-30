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
    self.reminderNameLabel.text = reminder.reminderName;
    self.reminderTimeLabel.text = reminder.reminderTime;
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
