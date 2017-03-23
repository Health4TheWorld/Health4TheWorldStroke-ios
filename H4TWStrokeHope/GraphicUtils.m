//
//  GraphicUtils.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/23/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "GraphicUtils.h"
#import "Constants.h"

#define BUTTON_HEIGHT 50

@implementation GraphicUtils

+ (void)styleButton:(UIButton *)button {
    [button setBackgroundColor:HFTW_ACCENT];
    CGRect buttonFrame = button.frame;
    buttonFrame.size.height = BUTTON_HEIGHT;
    button.frame = buttonFrame;
    button.layer.cornerRadius = 12;
    button.clipsToBounds = YES;
    /* Font */
    button.titleLabel.font = [UIFont fontWithName:@"Lato-regular" size:24.0];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
@end
