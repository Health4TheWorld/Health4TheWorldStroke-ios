//
//  ChatMessages.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "ChatMessages.h"

@implementation ChatMessages

- (id)initWithText: (NSString*) text withDate: (NSDate*) date withSender: (BOOL) isSender
{
    self = [super init];
    if (self) {
        self.text = text;
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss a"];
        self.date = [dateFormatter stringFromDate:[NSDate date]];
        self.isSender = isSender;
    }
    return self;
}


@end
