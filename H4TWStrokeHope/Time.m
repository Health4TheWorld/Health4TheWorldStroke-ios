//
//  Time.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Time.h"

@implementation Time

- (id)initWithString:(NSString *)timeStr {
    self = [super init];
    if (self) {
        self.timeStr = timeStr;
    }
    return self;
}

@end
