//
//  EditReminderViewController.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reminder.h"

@protocol EditReminderProtocol
- (void)savedEditChanges:(Reminder *)reminder;
@end

@interface EditReminderViewController : UIViewController <UIPopoverPresentationControllerDelegate>
@property Reminder *reminder;
@property (weak, nonatomic) id delegate;
@end
