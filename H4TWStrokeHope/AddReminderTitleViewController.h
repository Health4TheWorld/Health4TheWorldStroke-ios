//
//  AddReminderTitleViewController.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RemindersViewController.h"
#import "Reminder.h"

@protocol ReminderTitleProtocol
- (void)editedReminderTitle:(NSString *)newTitle;
@end

@interface AddReminderTitleViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate>
@property Reminder *reminder;
@property BOOL isEditing; /* YES if user is editing an existing reminder, NO if user is creating a reminder. */
@property (weak, nonatomic) id delegate;
@property RemindersViewController *remindersVC; /* We pass this along so that when we get to the last step of create reminder, we can call its delegate method. */
@end
