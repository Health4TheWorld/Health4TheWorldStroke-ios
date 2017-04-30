//
//  ReminderTableViewCell.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/28/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@protocol ReminderProtocol
- (void)clickedCheckOnReminder:(Reminder *)reminder;
@end

@interface ReminderTableViewCell : UITableViewCell
@property Reminder *reminder;
@property (weak, nonatomic) id delegate;
@property (strong, nonatomic) IBOutlet UILabel *reminderNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *reminderTimeLabel;
@property (strong, nonatomic) IBOutlet UIButton *checkButton;
- (void)layoutCellWithReminder:(Reminder *)reminder;
@end
