//
//  AddReminderFrequencyViewController.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"
#import "RemindersViewController.h"

@protocol ReminderFrequencyProtocol
- (void)editedReminderFrequency:(NSMutableArray *)days;
@end

@interface AddReminderFrequencyViewController : UIViewController
@property Reminder *reminder;
@property RemindersViewController *remindersVC; /* We pass this along for the create reminder flow so that when we get to the last step of create reminder, we can call its delegate method. */
@property BOOL isEditing; /* YES if user is editing an existing reminder, NO if user is creating a reminder. */
@property (weak, nonatomic) id delegate;
@end
