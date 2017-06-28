//
//  ChatMessages.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatMessages : NSObject
@property NSString *text;
@property NSString *date;
@property Boolean isSender;

- (id)initWithText: (NSString*) text withDate: (NSDate*) date withSender: (BOOL) isSender;
@end
