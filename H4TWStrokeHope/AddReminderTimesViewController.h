//
//  AddReminderTimesViewController.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@protocol CreateReminderProtocol
- (void)createdReminder:(Reminder *)reminder;
- (void)editedReminderTimes:(NSMutableArray *)times;
@end

@interface AddReminderTimesViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>
@property Reminder *reminder;
@property (weak, nonatomic) id delegate;
@property BOOL isEditing; /* YES if user is editing an existing reminder, NO if user is creating a reminder. */
@end
