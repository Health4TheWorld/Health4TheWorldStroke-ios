//
//  HomeButton.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HomeButton.h"
#import "Constants.h"

@implementation HomeButton

- (id)initWithText:(NSString *)text withFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6;
        self.clipsToBounds = YES;
        [self setBackgroundColor:HFTW_PRIMARY];
        UIFont *labelFont = [UIFont fontWithName:@"Lato-regular" size:18.0];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, 10, 0, 0)];
        label.font = labelFont;
        label.textColor = [UIColor whiteColor];
        label.text = text;
        [label sizeToFit];
        [self addSubview:label];
    }
    return self;
}

@end
