//
//  LearnContent.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/14/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LearnContent.h"
#import "Constants.h"

#define PARAGRAPH_FONT [UIFont fontWithName:@"Lato-light" size:18.0]
#define PARAGRAPH_FONT_BOLD [UIFont fontWithName:@"Lato-bold" size:18.0]

@implementation LearnContent
- (id)initWithContentTitle:(NSString *)title {
    self = [super init];
    if (self) {
        if ([title isEqualToString:CONTENT_TYPE_BLOOD_PRESSURE]) {
            [self setUpBloodPressure];
        } else if ([title isEqualToString:CONTENT_TYPE_BLOOD_SUGAR]) {
            [self setUpBloodSugar];
        } else if ([title isEqualToString:CONTENT_TYPE_HEART_RATE]) {
            [self setUpHeartRate];
        }
    }
    return self; 
}

- (void)setUpBloodPressure {
    self.contentTitle = CONTENT_TYPE_BLOOD_PRESSURE;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    /* Problem header */
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    /* Problem text */
    NSRange nonBoldRange = [BLOOD_PRESSURE_PROBLEM rangeOfString:BLOOD_PRESSURE_PROBLEM_NONBOLD_PART];
    NSRange boldRange = [BLOOD_PRESSURE_PROBLEM rangeOfString:BLOOD_PRESSURE_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_PRESSURE_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self paragraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* What to do text */
    NSRange whatToDoBoldRange = [BLOOD_PRESSURE_WHAT_TO_DO rangeOfString:BLOOD_PRESSURE_WHAT_TO_DO_BOLD_PART];
    NSMutableAttributedString *whatToDoStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_PRESSURE_WHAT_TO_DO];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT range:[BLOOD_PRESSURE_WHAT_TO_DO rangeOfString:BLOOD_PRESSURE_WHAT_TO_DO]];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:whatToDoBoldRange];
    [self.content addObject:[self paragraphWithText:whatToDoStr]];
}

- (void)setUpBloodSugar {
    self.contentTitle = CONTENT_TYPE_BLOOD_SUGAR;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    /* Problem header */
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    /* Problem text */
    NSRange nonBoldRange = [BLOOD_SUGAR_PROBLEM rangeOfString:BLOOD_SUGAR_PROBLEM];
    NSRange boldRange = [BLOOD_SUGAR_PROBLEM rangeOfString:BLOOD_SUGAR_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_SUGAR_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self paragraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* What to do text */
    NSRange whatToDoBoldRangeOne = [BLOOD_SUGAR_WHAT_TO_DO rangeOfString:BLOOD_SUGAR_WHAT_TO_DO_FIRST_BOLD_PART];
    NSRange whatToDoBoldRangeTwo = [BLOOD_SUGAR_WHAT_TO_DO rangeOfString:BLOOD_SUGAR_WHAT_TO_DO_SECOND_BOLD_PART];
    NSMutableAttributedString *whatToDoStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_SUGAR_WHAT_TO_DO];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT range:[BLOOD_SUGAR_WHAT_TO_DO rangeOfString:BLOOD_SUGAR_WHAT_TO_DO]];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeOne];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeTwo];
    [self.content addObject:[self paragraphWithText:whatToDoStr]];
}

- (void)setUpHeartRate {
    self.contentTitle = CONTENT_TYPE_HEART_RATE;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    /* Problem header */
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    /* Problem text */
    NSRange nonBoldRange = [HEART_RATE_PROBLEM rangeOfString:HEART_RATE_PROBLEM];
    NSRange boldRange = [HEART_RATE_PROBLEM rangeOfString:HEART_RATE_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:HEART_RATE_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self paragraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* What to do text */
    NSRange whatToDoBoldRangeOne = [HEART_RATE_WHAT_TO_DO rangeOfString:HEART_RATE_WHAT_TO_DO_FIRST_BOLD_PART];
     NSRange whatToDoBoldRangeTwo = [HEART_RATE_WHAT_TO_DO rangeOfString:HEART_RATE_WHAT_TO_DO_SECOND_BOLD_PART];
    NSMutableAttributedString *whatToDoStr = [[NSMutableAttributedString alloc] initWithString:HEART_RATE_WHAT_TO_DO];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT range:[HEART_RATE_WHAT_TO_DO rangeOfString:HEART_RATE_WHAT_TO_DO]];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeOne];
    [whatToDoStr addAttribute:NSFontAttributeName value:PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeTwo];
    [self.content addObject:[self paragraphWithText:whatToDoStr]];
}

/* Dictionaries that represent a chunk of text
 * --------------------------------------------
 */

- (NSDictionary *)headerWithTitle:(NSString *)title {
    NSMutableDictionary *header = [[NSMutableDictionary alloc] init];
    [header setObject:TEXT_TYPE_HEADER forKey:TEXT_TYPE_KEY];
    [header setObject:title forKey:TEXT_KEY];
    return header;
}

- (NSDictionary *)paragraphWithText:(NSAttributedString *)text {
    NSMutableDictionary *header = [[NSMutableDictionary alloc] init];
    [header setObject:TEXT_TYPE_PARAGRAPH forKey:TEXT_TYPE_KEY];
    [header setObject:text forKey:TEXT_KEY];
    return header;
}


@end
