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
@property NSString *reminderTime;
@property BOOL isCompleted;

- (id)initWithName:(NSString *)name withTime:(NSString *)time;
@end
