//
//  LearnContent.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/14/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LearnContent.h"
#import "Constants.h"

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
        } else if ([title isEqualToString:CONTENT_TYPE_FAQ]) {
            [self setUpFAQ];
        } else if ([title isEqualToString:CONTENT_TYPE_EXERCISES]) {
            [self setUpExercises];
        } else if ([title isEqualToString:CONTENT_TYPE_HOME_MOD]) {
            [self setUpHomeMod];
        } else if ([title isEqualToString:CONTENT_TYPE_SHOWER_BATH]) {
            [self setUpShowerBath];
        } else if ([title isEqualToString:CONTENT_TYPE_BLADDER_BOWEL]) {
            [self setUpBladderBowel];
        } else if ([title isEqualToString:CONTENT_TYPE_DIET]) {
            [self setUpDiet];
        } 
    }
    return self; 
}

+ (NSString *)getImageNameForType:(NSString *)type {
    NSString *imageName = @"";
    if ([type isEqualToString:CONTENT_TYPE_BLOOD_PRESSURE]) {
        return BLOOD_PRESSURE_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_BLOOD_SUGAR]) {
        return BLOOD_SUGAR_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_HEART_RATE]) {
        imageName = HEART_RATE_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_FAQ]) {
        return GENERAL_INFO_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_EXERCISES]) {
        imageName = STRONG_ARM_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_HOME_MOD]) {
        return HOUSE_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_SHOWER_BATH]) {
        imageName = SHOWER_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_BLADDER_BOWEL]) {
        imageName = TOILET_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_DIET]) {
        imageName = DIET_ICON;
    }
    return imageName;
}

- (void)setUpFAQ {
    self.contentTitle = CONTENT_TYPE_FAQ;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    [self.content addObject:[self headerWithTitle:FAQ_QUESTION_ONE]];
    [self.content addObject:[self paragraphWithText:FAQ_ANSWER_ONE]];
    [self.content addObject:[self headerWithTitle:FAQ_QUESTION_TWO]];
    [self.content addObject:[self paragraphWithText:FAQ_ANSWER_TWO]];
    [self.content addObject:[self headerWithTitle:FAQ_QUESTION_THREE]];
    [self.content addObject:[self paragraphWithText:FAQ_ANSWER_THREE]];
}

- (void)setUpBloodPressure {
    self.contentTitle = CONTENT_TYPE_BLOOD_PRESSURE;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [imgView setImage:[UIImage imageNamed:BLOOD_PRESSURE_ICON_WHITE]];
    self.images = @[imgView];
    
    /* Problem header */
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    /* Problem text */
    NSRange nonBoldRange = [BLOOD_PRESSURE_PROBLEM rangeOfString:BLOOD_PRESSURE_PROBLEM_NONBOLD_PART];
    NSRange boldRange = [BLOOD_PRESSURE_PROBLEM rangeOfString:BLOOD_PRESSURE_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_PRESSURE_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self attributedParagraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* What to do text */
    NSRange whatToDoBoldRange = [BLOOD_PRESSURE_WHAT_TO_DO rangeOfString:BLOOD_PRESSURE_WHAT_TO_DO_BOLD_PART];
    NSMutableAttributedString *whatToDoStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_PRESSURE_WHAT_TO_DO];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[BLOOD_PRESSURE_WHAT_TO_DO rangeOfString:BLOOD_PRESSURE_WHAT_TO_DO]];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:whatToDoBoldRange];
    [self.content addObject:[self attributedParagraphWithText:whatToDoStr]];
}

- (void)setUpBloodSugar {
    self.contentTitle = CONTENT_TYPE_BLOOD_SUGAR;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [imgView setImage:[UIImage imageNamed:BLOOD_SUGAR_ICON]];
    self.images = @[imgView];
    
    /* Problem header */
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    /* Problem text */
    NSRange nonBoldRange = [BLOOD_SUGAR_PROBLEM rangeOfString:BLOOD_SUGAR_PROBLEM];
    NSRange boldRange = [BLOOD_SUGAR_PROBLEM rangeOfString:BLOOD_SUGAR_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_SUGAR_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self attributedParagraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* What to do text */
    NSRange whatToDoBoldRangeOne = [BLOOD_SUGAR_WHAT_TO_DO rangeOfString:BLOOD_SUGAR_WHAT_TO_DO_FIRST_BOLD_PART];
    NSRange whatToDoBoldRangeTwo = [BLOOD_SUGAR_WHAT_TO_DO rangeOfString:BLOOD_SUGAR_WHAT_TO_DO_SECOND_BOLD_PART];
    NSMutableAttributedString *whatToDoStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_SUGAR_WHAT_TO_DO];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[BLOOD_SUGAR_WHAT_TO_DO rangeOfString:BLOOD_SUGAR_WHAT_TO_DO]];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeOne];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeTwo];
    [self.content addObject:[self attributedParagraphWithText:whatToDoStr]];
}

- (void)setUpHeartRate {
    self.contentTitle = CONTENT_TYPE_HEART_RATE;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [imgView setImage:[UIImage imageNamed:WHITE_HEART_RATE_ICON]];
    self.images = @[imgView];
    
    /* Problem header */
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    /* Problem text */
    NSRange nonBoldRange = [HEART_RATE_PROBLEM rangeOfString:HEART_RATE_PROBLEM];
    NSRange boldRange = [HEART_RATE_PROBLEM rangeOfString:HEART_RATE_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:HEART_RATE_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self attributedParagraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* What to do text */
    NSRange whatToDoBoldRangeOne = [HEART_RATE_WHAT_TO_DO rangeOfString:HEART_RATE_WHAT_TO_DO_FIRST_BOLD_PART];
     NSRange whatToDoBoldRangeTwo = [HEART_RATE_WHAT_TO_DO rangeOfString:HEART_RATE_WHAT_TO_DO_SECOND_BOLD_PART];
    NSMutableAttributedString *whatToDoStr = [[NSMutableAttributedString alloc] initWithString:HEART_RATE_WHAT_TO_DO];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[HEART_RATE_WHAT_TO_DO rangeOfString:HEART_RATE_WHAT_TO_DO]];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeOne];
    [whatToDoStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:whatToDoBoldRangeTwo];
    [self.content addObject:[self attributedParagraphWithText:whatToDoStr]];
}

- (void)setUpDiet {
    self.contentTitle = CONTENT_TYPE_DIET;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    [self.content addObject:[self paragraphWithText:DIET_PROBLEM]];
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    [self.content addObject:[self paragraphWithText:DIET_WHAT_TO_DO]];
}

- (void)setUpBladderBowel {
    self.contentTitle = CONTENT_TYPE_BLADDER_BOWEL;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    UIImageView *water = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 170)];
    [water setImage:[UIImage imageNamed:BLUE_WATER_ICON]];
    self.images = @[water];
    
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    [self.content addObject:[self paragraphWithText:BLADDER_BOWEL_PROBLEM]];
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];

    NSArray *bullets = @[BLADDER_BOWEL_WHAT_TO_DO_BULLET_ONE, BLADDER_BOWEL_WHAT_TO_DO_BULLET_TWO, BLADDER_BOWEL_WHAT_TO_DO_BULLET_THREE];
    [self.content addObject:[self bulletsWithText:bullets]];
}

- (void)setUpExercises {
    self.contentTitle = CONTENT_TYPE_EXERCISES;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    [self.content addObject:[self paragraphWithText:EXERCISES_PROBLEM]];
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    [self.content addObject:[self paragraphWithText:EXERCISES_PARAGRAPH_ONE]];
    
    /* First bullet */
    NSRange bulletOneBoldRange = [EXERCISES_BULLET_ONE rangeOfString:EXERCISES_BULLET_ONE_BOLD_PART];
    NSMutableAttributedString *bulletOne = [[NSMutableAttributedString alloc] initWithString:EXERCISES_BULLET_ONE];
    [bulletOne addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[EXERCISES_BULLET_ONE rangeOfString:EXERCISES_BULLET_ONE]];
    [bulletOne addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletOneBoldRange];
    
    /* Second bullet */
    NSRange bulletTwoBoldRange = [EXERCISES_BULLET_TWO rangeOfString:EXERCISES_BULLET_TWO_BOLD_PART];
    NSMutableAttributedString *bulletTwo = [[NSMutableAttributedString alloc] initWithString:EXERCISES_BULLET_TWO];
    [bulletTwo addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[EXERCISES_BULLET_TWO rangeOfString:EXERCISES_BULLET_TWO]];
    [bulletTwo addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletTwoBoldRange];
    
    /* Third bullet */
    NSRange bulletThreeBoldRange = [EXERCISES_BULLET_THREE rangeOfString:EXERCISES_BULLET_THREE_BOLD_PART];
    NSMutableAttributedString *bulletThree = [[NSMutableAttributedString alloc] initWithString:EXERCISES_BULLET_THREE];
    [bulletThree addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[EXERCISES_BULLET_THREE rangeOfString:EXERCISES_BULLET_THREE]];
    [bulletThree addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletThreeBoldRange];
    
    /* Fourth bullet */
    NSRange bulletFourBoldRange = [EXERCISES_BULLET_FOUR rangeOfString:EXERCISES_BULLET_FOUR_BOLD_PART];
    NSMutableAttributedString *bulletFour = [[NSMutableAttributedString alloc] initWithString:EXERCISES_BULLET_FOUR];
    [bulletFour addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[EXERCISES_BULLET_FOUR rangeOfString:EXERCISES_BULLET_FOUR]];
    [bulletFour addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletFourBoldRange];
    
    /* Fifth bullet */
    NSRange bulletFiveBoldRange = [EXERCISES_BULLET_FIVE rangeOfString:EXERCISES_BULLET_FIVE_BOLD_PART];
    NSMutableAttributedString *bulletFive = [[NSMutableAttributedString alloc] initWithString:EXERCISES_BULLET_FIVE];
    [bulletFive addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[EXERCISES_BULLET_FIVE rangeOfString:EXERCISES_BULLET_FOUR]];
    [bulletFive addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletFiveBoldRange];
    
    /* Sixth bullet */
    NSRange bulletSixBoldRange = [EXERCISES_BULLET_SIX rangeOfString:EXERCISES_BULLET_SIX_BOLD_PART];
    NSMutableAttributedString *bulletSix = [[NSMutableAttributedString alloc] initWithString:EXERCISES_BULLET_SIX];
    [bulletSix addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[EXERCISES_BULLET_SIX rangeOfString:EXERCISES_BULLET_SIX]];
    [bulletSix addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletSixBoldRange];
    
    NSArray *attributedBullets = @[bulletOne, bulletTwo, bulletFour, bulletFive, bulletSix];
    [self.content addObject:[self attributedBulletsWithText:attributedBullets]];
}

- (void)setUpShowerBath {
    self.contentTitle = CONTENT_TYPE_SHOWER_BATH;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    [imgView setImage:[UIImage imageNamed:GRAB_BARS_ILLUSTRATION]];
    self.images = @[imgView];
    
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    [self.content addObject:[self paragraphWithText:SHOWER_BATH_PROBLEM]];
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    
    /* First bullet */
    NSRange bulletOneBoldRange = [SHOWER_BATH_BULLET_ONE rangeOfString:SHOWER_BATH_BULLET_ONE_BOLD_PART];
    NSMutableAttributedString *bulletOne = [[NSMutableAttributedString alloc] initWithString:SHOWER_BATH_BULLET_ONE];
    [bulletOne addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[SHOWER_BATH_BULLET_ONE rangeOfString:SHOWER_BATH_BULLET_ONE]];
    [bulletOne addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletOneBoldRange];
    
    /* Second bullet */
    NSRange bulletTwoBoldRange = [SHOWER_BATH_BULLET_TWO rangeOfString:SHOWER_BATH_BULLET_TWO_BOLD_PART];
    NSMutableAttributedString *bulletTwo = [[NSMutableAttributedString alloc] initWithString:SHOWER_BATH_BULLET_TWO];
    [bulletTwo addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[SHOWER_BATH_BULLET_TWO rangeOfString:SHOWER_BATH_BULLET_TWO]];
    [bulletTwo addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletTwoBoldRange];
    
    /* Third bullet */
    NSRange bulletThreeBoldRange = [SHOWER_BATH_BULLET_THREE rangeOfString:SHOWER_BATH_BULLET_THREE_BOLD_PART];
    NSMutableAttributedString *bulletThree = [[NSMutableAttributedString alloc] initWithString:SHOWER_BATH_BULLET_THREE];
    [bulletThree addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:[SHOWER_BATH_BULLET_THREE rangeOfString:SHOWER_BATH_BULLET_THREE]];
    [bulletThree addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:bulletThreeBoldRange];
    
    [self.content addObject:[self paragraphWithText:SHOWER_BATH_PARAGRAPH]];
    
    NSArray *attributedBullets = @[bulletOne, bulletTwo, bulletThree];
    [self.content addObject:[self attributedBulletsWithText:attributedBullets]];
}

- (void)setUpHomeMod {
    self.contentTitle = CONTENT_TYPE_HOME_MOD;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    
    UIImageView *weakSideBed = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    [weakSideBed setImage:[UIImage imageNamed:WEAK_SIDE_BED]];
    UIImageView *slipperyCarpet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 200)];
    [slipperyCarpet setImage:[UIImage imageNamed:SLIPPERY_CARPET]];
    self.images = @[weakSideBed, slipperyCarpet];
    
    [self.content addObject:[self headerWithTitle:@"PROBLEM"]];
    [self.content addObject:[self paragraphWithText:HOME_MOD_PROBLEM]];
    [self.content addObject:[self headerWithTitle:@"WHAT TO DO"]];
    /* BEDROOM */
    NSMutableAttributedString *subheaderOne = [[NSMutableAttributedString alloc] initWithString:HOME_MOD_SUBHEADER_ONE];
    [subheaderOne addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:[HOME_MOD_SUBHEADER_ONE rangeOfString:HOME_MOD_SUBHEADER_ONE]];
    [self.content addObject:[self attributedParagraphWithText:subheaderOne]];
    [self.content addObject:[self paragraphWithText:HOME_MOD_CONTENT_ONE]];
    /* General: */
    NSMutableAttributedString *subheaderTwo = [[NSMutableAttributedString alloc] initWithString:HOME_MOD_SUBHEADER_TWO];
    [subheaderTwo addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:[HOME_MOD_SUBHEADER_TWO rangeOfString:HOME_MOD_SUBHEADER_TWO]];
    [self.content addObject:[self attributedParagraphWithText:subheaderTwo]];
    [self.content addObject:[self paragraphWithText:HOME_MOD_CONTENT_TWO]];
    /* Bath: */
    NSMutableAttributedString *subheaderThree = [[NSMutableAttributedString alloc] initWithString:HOME_MOD_SUBHEADER_THREE];
    [subheaderThree addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:[HOME_MOD_SUBHEADER_THREE rangeOfString:HOME_MOD_SUBHEADER_THREE]];
    [self.content addObject:[self attributedParagraphWithText:subheaderThree]];
    [self.content addObject:[self paragraphWithText:HOME_MOD_CONTENT_THREE]];
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

- (NSDictionary *)attributedParagraphWithText:(NSAttributedString *)text {
    NSMutableDictionary *paragraph = [[NSMutableDictionary alloc] init];
    [paragraph setObject:TEXT_TYPE_ATTRIBUTED_PARAGRAPH forKey:TEXT_TYPE_KEY];
    [paragraph setObject:text forKey:TEXT_KEY];
    return paragraph;
}

- (NSDictionary *)paragraphWithText:(NSString *)text {
    NSMutableDictionary *paragraph = [[NSMutableDictionary alloc] init];
    [paragraph setObject:TEXT_TYPE_PARAGRAPH forKey:TEXT_TYPE_KEY];
    [paragraph setObject:text forKey:TEXT_KEY];
    return paragraph;
}

- (NSDictionary *)bulletsWithText:(NSArray *)bullets {
    NSMutableDictionary *bulletDict = [[NSMutableDictionary alloc] init];
    [bulletDict setObject:TEXT_TYPE_BULLETS forKey:TEXT_TYPE_KEY];
    [bulletDict setObject:bullets forKey:TEXT_KEY];
    return bulletDict;
}

- (NSDictionary *)attributedBulletsWithText:(NSArray *)bullets {
    NSMutableDictionary *bulletDict = [[NSMutableDictionary alloc] init];
    [bulletDict setObject:TEXT_TYPE_ATTRIBUTED_BULLETS forKey:TEXT_TYPE_KEY];
    [bulletDict setObject:bullets forKey:TEXT_KEY];
    return bulletDict;
}


@end
