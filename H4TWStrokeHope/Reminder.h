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
@property NSString *reminderTime;
@property BOOL isCompleted;
@property NSMutableArray *times;

- (id)initWithName:(NSString *)name withTime:(NSString *)time;
@end
