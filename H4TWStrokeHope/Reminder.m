//
//  Reminder.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/29/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

- (id)initWithName:(NSString *)name withTime:(NSString *)time {
    self = [super init];
    if (self) {
        self.reminderName = name;
        self.reminderTime = time;
        self.isCompleted = NO;
    }
    return self;
}

- (NSString *)description {
    NSString *isCompletedStr = @"NO";
    if (self.isCompleted) {
        isCompletedStr = @"YES";
    }
    return [NSString stringWithFormat:@"Name: %@, time: %@, Is Completed: %@", self.reminderName, self.reminderTime, isCompletedStr];
}

@end
