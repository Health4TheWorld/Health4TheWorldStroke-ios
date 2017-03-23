//
//  Utils.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/17/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (CGFloat)heightOfString:(NSString *)string containedToWidth:(CGFloat)width withFont:(UIFont *)font {
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize labelSize = (CGSize){width, FLT_MAX};
    CGRect r = [string boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:context];
    return r.size.height;
}

@end
