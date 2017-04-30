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

@interface AddReminderFrequencyViewController : UIViewController
@property Reminder *reminder;
@property RemindersViewController *remindersVC; /* We pass this along so that when we get to the last step of create reminder, we can call its delegate method. */
@end
