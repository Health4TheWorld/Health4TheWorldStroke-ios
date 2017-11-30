//
//  Utils.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/17/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Utils.h"
#import <sys/utsname.h>

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

+ (int)getDayOfWeekFromString:(NSString *)weekday {
    if ([weekday isEqualToString:NSLocalizedString(@"Reminders.sunday", nil)]) {
        return 1;
    } else if ([weekday isEqualToString:NSLocalizedString(@"Reminders.monday", nil)]) {
        return 2;
    } else if ([weekday isEqualToString:NSLocalizedString(@"Reminders.tuesday", nil)]) {
        return 3;
    } else if ([weekday isEqualToString:NSLocalizedString(@"Reminders.wednesday", nil)]) {
        return 4;
    } else if ([weekday isEqualToString:NSLocalizedString(@"Reminders.thursday", nil)]) {
        return 5;
    } else if ([weekday isEqualToString:NSLocalizedString(@"Reminders.friday", nil)]) {
        return 6;
    } else if ([weekday isEqualToString:NSLocalizedString(@"Reminders.saturday", nil)]) {
        return 7;
    }
               
    return 1;
}

+ (NSDate *)getDateFromTime:(NSString *)time weekday:(NSString *)weekday {
    NSDate *referenceDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday) fromDate:referenceDate];
    
    /* Get weekday */
    int targetWeekday = [self getDayOfWeekFromString:weekday];
    
    // Sunday == 1, Saturday == 7
    if (dateComponents.weekday >= targetWeekday)
    {
        [dateComponents setWeekOfYear:(dateComponents.weekOfYear+1)];
    }
    dateComponents.weekday = targetWeekday;
    
    /* Get time */
    NSArray *myArray = [time componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":"]];
    
    int hour = [[myArray objectAtIndex:0] intValue];
    int minute = [[[myArray objectAtIndex:1] substringToIndex:2] intValue];
    NSString *amPm = [[myArray objectAtIndex:1] substringFromIndex:3];
    if ([amPm isEqualToString:@"PM"] && (hour != 12)) {
        hour += 12;
    } else if ([amPm isEqualToString:@"AM"] && (hour == 12)) {
        hour = 0;
    }
    NSLog(@"Hour: %d, Min: %d", hour, minute);
    [dateComponents setHour: hour];
    [dateComponents setMinute: minute];

    return [calendar dateFromComponents:dateComponents];
}

+ (NSString *) getUDID {
    /* User device ID */
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return uniqueIdentifier;
}

+ (NSString *) getCurrentDateTime {
    /* Current date time */
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSString *) getCurrentDate {
    /* Current date time */
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd-yyyy"];
    
    return [dateFormatter stringFromDate:[NSDate date]];
}

+ (NSString *) deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}

@end
