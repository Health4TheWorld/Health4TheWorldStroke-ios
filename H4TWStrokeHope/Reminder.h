//
//  Reminder.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/29/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reminder : NSObject
@property NSString *reminderName;
@property NSArray *reminderDays; /* Days of the week to be reminded */
@property BOOL isCompleted;
@property NSMutableArray *times;
@property NSDate *lastDaySeen; /* Used so that we know if we should set isCompleted to NO for the day */
@property BOOL isOneTimeReminder;
@end
