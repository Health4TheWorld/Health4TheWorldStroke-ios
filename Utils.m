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

+ (CGFloat)heightOfAttributedString:(NSAttributedString *)attrStr containedToWidth:(CGFloat)width withFont:(UIFont *)font {
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize labelSize = (CGSize){width, FLT_MAX};
    CGRect r = [attrStr boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin context:context];
    return r.size.height;
}

+ (CGFloat)heightOfString:(NSString *)string forWidth:(CGFloat)width usingFont:(UIFont *)font
{
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize labelSize = (CGSize){width, FLT_MAX};
    CGRect r = [string boundingRectWithSize:labelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:context];
    return r.size.height;
}

+ (NSInteger)numberOfLinesForString:(NSString *)str constrainedToWidth:(float)width withFont:(UIFont *)font {
    CGFloat unitHeight = [Utils heightOfString:@"A" forWidth:width usingFont:font];
    CGFloat blockHeight = [Utils heightOfString:str forWidth:width usingFont:font];
    NSInteger numberOfLines = ceilf(blockHeight / unitHeight);
    return numberOfLines;
}

+ (BOOL)day:(NSDate *)dayOne isSameDayAs:(NSDate *)dayTwo {
    NSDateComponents *dayOneComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:dayOne];
    NSDateComponents *dayTwoComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:dayTwo];
    return ([dayOneComponents day] == [dayTwoComponents day] &&
            [dayOneComponents month] == [dayTwoComponents month] &&
            [dayOneComponents year] == [dayTwoComponents year] &&
            [dayOneComponents era] == [dayTwoComponents era]);
}

@end
