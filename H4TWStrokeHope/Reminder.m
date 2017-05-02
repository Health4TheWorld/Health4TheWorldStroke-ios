//
//  Reminder.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/29/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

#define REMINDER_NAME_KEY @"reminderName"
#define REMINDER_DAYS_KEY @"reminderDays"
#define REMINDER_TIMES_KEY @"reminderTimes"
#define REMINDER_IS_COMPLETE_KEY @"reminderIsCompleted"
#define REMINDER_LAST_DAY_SEEN @"lastDaySeen"

- (id)init {
    self = [super init];
    if (self) {
        self.lastDaySeen = [NSDate date];
        self.isCompleted = NO;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.reminderName = [decoder decodeObjectForKey:REMINDER_NAME_KEY];
    self.reminderDays = [decoder decodeObjectForKey:REMINDER_DAYS_KEY];
    self.isCompleted = [decoder decodeBoolForKey:REMINDER_IS_COMPLETE_KEY];
    self.times = [decoder decodeObjectForKey:REMINDER_TIMES_KEY];
    self.lastDaySeen = [decoder decodeObjectForKey:REMINDER_LAST_DAY_SEEN];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.reminderName forKey:REMINDER_NAME_KEY];
    [encoder encodeObject:self.reminderDays forKey:REMINDER_DAYS_KEY];
    [encoder encodeBool:self.isCompleted forKey:REMINDER_IS_COMPLETE_KEY];
    [encoder encodeObject:self.times forKey:REMINDER_TIMES_KEY];
    [encoder encodeObject:self.lastDaySeen forKey:REMINDER_LAST_DAY_SEEN];
}

- (NSString *)description {
    NSString *isCompletedStr = @"NO";
    if (self.isCompleted) {
        isCompletedStr = @"YES";
    }
    return [NSString stringWithFormat:@"Name: %@, times: %@, Is Completed: %@", self.reminderName, self.times, isCompletedStr];
}

@end
