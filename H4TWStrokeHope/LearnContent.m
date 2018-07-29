//
//  LearnContent.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/14/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LearnContent.h"
#import "Constants.h"
#import "CareGiverViewController.h"

@implementation LearnContent

- (id)initWithContentTitle:(NSString *)title {
    self = [super init];
    if (self) {
        if ([title isEqualToString:CONTENT_TYPE_CareGiver]) {//MM
            [self setUpCareGiver];
        }else if ([title isEqualToString:CONTENT_TYPE_SIGNSOFSTROKE]) {//MM
            [self setUpSignsOFStroke];
        }else if ([title isEqualToString:CONTENT_TYPE_RISKFACTORS]) {//MM
            [self setUpRiskFactors];
        }else if ([title isEqualToString:CONTENT_TYPE_BLOOD_PRESSURE]) {
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
        /* Care giver section */
        else if([title isEqualToString:CONTENT_TYPE_PostStrokeConcerns]){
            [self setUpPostStrokeConcerns];
        }
        else if([title isEqualToString:CONTENT_TYPE_Aphasia]){
            [self setUpAphasia];
        }
        else if([title isEqualToString:CONTENT_TYPE_Cognition]){
            [self setUpCognition];
        }
        else if([title isEqualToString:CONTENT_TYPE_Dysphagia]){
            [self setUpDysphagia];
        }
        else if([title isEqualToString:CONTENT_TYPE_Confinement]){
            [self setUpConfinement];
        }
        else if([title isEqualToString:CONTENT_TYPE_HomeModifications]){
            [self setUpHomeModifications];
        }
        else if([title isEqualToString:CONTENT_TYPE_Incontinence]){
            [self setUpIncontinence];
        }
        else if([title isEqualToString:CONTENT_TYPE_MuscleParalysisAndWeakness]){
            [self setUpMuscleParalysisAndWeakness];
        }
        else if([title isEqualToString:CONTENT_TYPE_MedicationAdherenceAndCompliance]){
            [self setUpMedicationAdherenceAndCompliance];
        }
        else if([title isEqualToString:CONTENT_TYPE_MedicationAdherence]){
            [self setUpMedicationAdherence];
        }
        else if([title isEqualToString:CONTENT_TYPE_Nutrition]){
            [self setUpNutrition];
        }
        else if([title isEqualToString:CONTENT_TYPE_PersonalCare]){
            [self setUpPersonalCare];
        }
        else if([title isEqualToString:CONTENT_TYPE_SelfCareForTheCaregiver]){
            [self setUpSelfCareForCareGiver];
        }
        else if([title isEqualToString:CONTENT_TYPE_RespiteCare]){
            [self setUpRespiteCare];
        }
        else if([title isEqualToString:CONTENT_TYPE_Seizures]){
            [self setUpSeizures];
        }
        else if([title isEqualToString:CONTENT_TYPE_Sleep]){
            [self setUpSleep];
        }
        else if([title isEqualToString:CONTENT_TYPE_EmotionalReactionsPostStroke]){
            [self setUpEmotionalReactions];
        }
        else if([title isEqualToString:CONTENT_TYPE_NavigatingEmotionalAndBehavioralChanges]){
            [self setUpNavEmoAndBehavChanges];
        }
        else if([title isEqualToString:CONTENT_TYPE_WorksCited]){
            [self setUpWorksCited];
        }
    }
    return self; 
}

+ (NSString *)getImageNameForType:(NSString *)type {
    NSString *imageName = @"";
    if ([type isEqualToString:CONTENT_TYPE_PostStrokeConcerns]) {//MM
        return POST_STROKE_ICON;//MM
    } else  if ([type isEqualToString:CONTENT_TYPE_Aphasia]) {//MM
        return Aphasia_ICON;//MM
    } else  if ([type isEqualToString:CONTENT_TYPE_Cognition]) {//MM
        return Cognition_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_ManagingAndImprovingCognitiveDeficits]) {//MM
        return ManagingCognitiveDeficits_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_Dysphagia]) {//MM
        return Dysphagia_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_Confinement]) {//MM
        return Confinement_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_HomeModifications]) {//MM
        return HomeModifications_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_Incontinence]) {//MM
        return Incontinence_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_ManagingIncontinence]) {//MM
        return ManagingIncontinence_ICON;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_MuscleParalysisAndWeakness]) {//MM
        return MuscleParalysis_ICON;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_MedicationAdherenceAndCompliance]) {//MM
        return MedicationAdherence_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_MedicationAdherence]) {//MM
        return MedicationAdherence_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_Nutrition]) {//MM
        return Nutrition_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_PersonalCare]) {//MM
        return PersonalCare_Icon;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_SelfCareForTheCaregiver]) {//MM
        return SelfCareImage;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_RespiteCare]) {//MM
        return RespiteCareImage;//MM
    }
    else if ([type isEqualToString:CONTENT_TYPE_Seizures]) {//MM
            return CAREGIVER_ICON;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_Sleep]) {//MM
            return CAREGIVER_ICON;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_Seizures]) {//MM
        return CAREGIVER_ICON;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_EmotionalReactionsPostStroke]) {//MM
        return EmoReactionsImage;//MM
    }
    else if ([type isEqualToString:CONTENT_TYPE_NavigatingEmotionalAndBehavioralChanges]) {//MM
        return EmoReactionsImage2;//MM
    }
    else if ([type isEqualToString:CONTENT_TYPE_WorksCited]) {//MM
        return CAREGIVER_ICON;//MM
    }
    else if ([type isEqualToString:CONTENT_TYPE_CareGiver]) {//MM
        return CAREGIVER_ICON;//MM
    } else if ([type isEqualToString:CONTENT_TYPE_SIGNSOFSTROKE]) {//MM
        return AMBULANCE_ICON;//MM
    }
    else if ([type isEqualToString:CONTENT_TYPE_RISKFACTORS]) {//MM
        return CANE_WALKER;//MM
    }else if ([type isEqualToString:CONTENT_TYPE_BLOOD_PRESSURE]) {
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
    } else if ([type isEqualToString:CONTENT_TYPE_SMOKING]) {
        imageName = SMOKING_ICON;
    } else if ([type isEqualToString:CONTENT_TYPE_SLEEP]) {
        imageName = SLEEP_ICON;
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
- (void)setUpRiskFactors {//MM
    self.contentTitle = CONTENT_TYPE_RISKFACTORS;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.riskFactorsForStroke", nil)]];
    NSArray *bullets = @[(NSLocalizedString(@"Learn.riskFactorsOne", nil)), (NSLocalizedString(@"Learn.riskFactorsTwo", nil)), (NSLocalizedString(@"Learn.riskFactorsThree", nil)),(NSLocalizedString(@"Learn.riskFactorsFour", nil)),         (NSLocalizedString(@"Learn.riskFactorsFive", nil))];
    [self.content addObject:[self bulletsWithText:bullets]];
}//MM

-(void) setUpCareGiver{//MM
    self.contentTitle = CONTENT_TYPE_CareGiver;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
  
}//MM

- (void)setUpSignsOFStroke {//MM
    self.contentTitle = CONTENT_TYPE_SIGNSOFSTROKE;
    self.contentBGColor = HFTW_RED;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = RED_BACK_BUTTON;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:BEFAST]];
    imgView.frame = CGRectMake(imgView.frame.origin.x, imgView.frame.origin.y, screenWidth, 300);
    imgView.bounds = CGRectMake(0, 0, screenWidth, 300);//786, 587)
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.images = @[imgView];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.signsOfStroke", nil)]];
    NSArray *bullets = @[(NSLocalizedString(@"Learn.befastB", nil)), (NSLocalizedString(@"Learn.befastE", nil)), (NSLocalizedString(@"Learn.befastF", nil)),(NSLocalizedString(@"Learn.befastA", nil)), (NSLocalizedString(@"Learn.befastS", nil)),(NSLocalizedString(@"Learn.befastT", nil))];
    [self.content addObject:[self bulletsWithText:bullets]];
}//MM


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
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    /* Problem text */
    NSRange nonBoldRange = [BLOOD_PRESSURE_PROBLEM rangeOfString:BLOOD_PRESSURE_PROBLEM_NONBOLD_PART];
    NSRange boldRange = [BLOOD_PRESSURE_PROBLEM rangeOfString:BLOOD_PRESSURE_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_PRESSURE_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self attributedParagraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
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
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    /* Problem text */
    NSRange nonBoldRange = [BLOOD_SUGAR_PROBLEM rangeOfString:BLOOD_SUGAR_PROBLEM];
    NSRange boldRange = [BLOOD_SUGAR_PROBLEM rangeOfString:BLOOD_SUGAR_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:BLOOD_SUGAR_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self attributedParagraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
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
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    /* Problem text */
    NSRange nonBoldRange = [HEART_RATE_PROBLEM rangeOfString:HEART_RATE_PROBLEM];
    NSRange boldRange = [HEART_RATE_PROBLEM rangeOfString:HEART_RATE_PROBLEM_BOLD_PART];
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:HEART_RATE_PROBLEM];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT range:nonBoldRange];
    [attributedStr addAttribute:NSFontAttributeName value:LEARN_PARAGRAPH_FONT_BOLD range:boldRange];
    [self.content addObject:[self attributedParagraphWithText:attributedStr]];
    
    /* What to do header */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
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
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 250)];
    [imgView setImage:[UIImage imageNamed:GOOD_FOOD]];
    UIImageView *imgViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 250)];
    [imgViewTwo setImage:[UIImage imageNamed:BAD_FOOD]];
    self.images = @[imgView, imgViewTwo];
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    [self.content addObject:[self paragraphWithText:DIET_PROBLEM]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
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
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    [self.content addObject:[self paragraphWithText:(NSLocalizedString(@"BladderBowel.problem", nil))]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];

    NSArray *bullets = @[(NSLocalizedString(@"BladderBowel.whatToDoBulletOne", nil)), (NSLocalizedString(@"BladderBowel.whatToDoBulletTwo", nil)), (NSLocalizedString(@"BladderBowel.whatToDoBulletThree", nil))];
    [self.content addObject:[self bulletsWithText:bullets]];
}

- (void)setUpExercises {
    self.contentTitle = CONTENT_TYPE_EXERCISES;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    [imgView setImage:[UIImage imageNamed:YOGA_IMAGE]];
    UIImageView *imgViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [imgViewTwo setImage:[UIImage imageNamed:CANE_WALKER]];
    self.images = @[imgView, imgViewTwo];
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    [self.content addObject:[self paragraphWithText:EXERCISES_PROBLEM]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
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
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    [self.content addObject:[self paragraphWithText:SHOWER_BATH_PROBLEM]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
    
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
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.problem", nil)]];
    [self.content addObject:[self paragraphWithText:HOME_MOD_PROBLEM]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Learn.whatToDo", nil)]];
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

/*Care-giver section Content types
 *----------------------------------
 */

-(void)setUpPostStrokeConcerns {
    self.contentTitle = CONTENT_TYPE_PostStrokeConcerns;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];

    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [imgView setImage:[UIImage imageNamed:POST_STROKE_ICON]];
    self.images = @[imgView];

    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"PostStroke.title", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"PostStroke.bulletOne", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"PostStroke.bulletTwo", nil), NSLocalizedString(@"PostStroke.bulletThree", nil),NSLocalizedString(@"PostStroke.bulletFour", nil),NSLocalizedString(@"PostStroke.bulletFive", nil),NSLocalizedString(@"PostStroke.bulletSix", nil),NSLocalizedString(@"PostStroke.bulletSeven", nil)]]];
}

-(void)setUpAphasia {
    self.contentTitle = CONTENT_TYPE_Aphasia;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 228, 228)];
    [imgView setImage:[UIImage imageNamed:Aphasia_ICON]];
    self.images = @[imgView];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Aphasia.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Aphasia.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Aphasia.bullet1.1", nil), NSLocalizedString(@"Aphasia.bullet1.2", nil),NSLocalizedString(@"Aphasia.bullet1.3", nil),NSLocalizedString(@"Aphasia.bullet1.4", nil),NSLocalizedString(@"Aphasia.bullet1.5", nil)]]];
    
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Aphasia.bullet2", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Aphasia.bullet2.1", nil), NSLocalizedString(@"Aphasia.bullet2.2", nil)]]];
}

-(void)setUpCognition {
    self.contentTitle = CONTENT_TYPE_Cognition;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *zero = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 135, 135)];
    [zero setImage:[UIImage imageNamed:Cognition_ICON]];
    UIImageView *one = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 61)];
    [one setImage:[UIImage imageNamed:ManagingCognitiveDeficits_ICON]];
    UIImageView *two = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 157, 157)];
    [two setImage:[UIImage imageNamed:ManagingCognitiveDeficits2_ICON]];
    UIImageView *three = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 224, 149)];
    [three setImage:[UIImage imageNamed:ManagingCognitiveDeficits3_ICON]];
    self.images = @[zero, one, two, three];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Cognition.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Cognition.bullet1", nil)]]];
    [self.content addObject:[self headerWithTitle:CONTENT_TYPE_ManagingAndImprovingCognitiveDeficits]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"CognitiveDeficits.bullet1", nil), NSLocalizedString(@"CognitiveDeficits.bullet2",nil),
        NSLocalizedString(@"CognitiveDeficits.bullet3",nil),
        NSLocalizedString(@"CognitiveDeficits.bullet4",nil),
        NSLocalizedString(@"CognitiveDeficits.bullet5",nil),
        NSLocalizedString(@"CognitiveDeficits.bullet6",nil),
        NSLocalizedString(@"CognitiveDeficits.bullet7",nil),
        NSLocalizedString(@"CognitiveDeficits.bullet8", nil)]]];
}

-(void)setUpDysphagia{
    self.contentTitle = CONTENT_TYPE_Dysphagia;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 228, 228)];
    [imgView setImage:[UIImage imageNamed:Dysphagia_ICON]];
    self.images = @[imgView];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Dysphagia.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Dysphagia.bullet1", nil), NSLocalizedString(@"Dysphagia.bullet2",nil), NSLocalizedString(@"Dysphagia.bullet3",nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Dysphagia.bullet3.1", nil), NSLocalizedString(@"Dysphagia.bullet3.2", nil),NSLocalizedString(@"Dysphagia.bullet3.3", nil),NSLocalizedString(@"Dysphagia.bullet3.4", nil)]]];
}

//Confinement
-(void)setUpConfinement{
    self.contentTitle = CONTENT_TYPE_Confinement;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *one = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 112, 84)];
    [one setImage:[UIImage imageNamed:Confinement_ICON]];
    UIImageView *two = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 134, 89)];
    [two setImage:[UIImage imageNamed:Confinement2_ICON]];
    UIImageView *three = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 98, 65)];
    [three setImage:[UIImage imageNamed:Confinement3_ICON]];
    self.images = @ [one, two, three];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Confinement.header", nil)]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"Confinement.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Confinement.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Confinement.bullet1.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Confinement.bullet2", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Confinement.bullet2.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Confinement.bullet2.2", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Confinement.bullet3", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Confinement.bullet4", nil)]]];
}

//Home Modifications
-(void)setUpHomeModifications{
    self.contentTitle = CONTENT_TYPE_HomeModifications;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *two = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 111, 110)];
    [two setImage:[UIImage imageNamed:HomeModifications_ICON]];
    UIImageView *three = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 135, 202)];
    [three setImage:[UIImage imageNamed:HomeModifications2_ICON]];
    self.images = @  [two, three];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"HomeModifications.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"HomeModifications.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"HomeModifications.bullet1.1", nil), NSLocalizedString(@"HomeModifications.bullet1.2", nil),NSLocalizedString(@"HomeModifications.bullet1.3", nil),NSLocalizedString(@"HomeModifications.bullet1.4", nil),NSLocalizedString(@"HomeModifications.bullet1.5", nil)]]];
}
//Incontinence

-(void)setUpIncontinence{
    self.contentTitle = CONTENT_TYPE_Incontinence;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *two = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 113, 112)];
    [two setImage:[UIImage imageNamed:Incontinence_ICON]];
    UIImageView *three = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 180, 120)];
    [three setImage:[UIImage imageNamed:Incontinence2_ICON]];
    UIImageView *four = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 108, 140)];
    [four setImage:[UIImage imageNamed:ManagingIncontinence1_ICON]];
    UIImageView *five = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 126, 78)];
    [five setImage:[UIImage imageNamed:ManagingIncontinence_ICON]];
    self.images = @  [two, three,four,five];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"Incontinence.pargraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Incontinence.bullet1", nil),NSLocalizedString(@"Incontinence.bullet2",nil),NSLocalizedString(@"Incontinence.bullet3",nil),]]];
    [self.content addObject:[self headerWithTitle:CONTENT_TYPE_ManagingIncontinence]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"ManagingIncontinence.paragraph", nil)]];    
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"ManagingIncontinence.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"ManagingIncontinence.bullet1.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"ManagingIncontinence.bullet1.1.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"ManagingIncontinence.bullet2", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"ManagingIncontinence.bullet2.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"ManagingIncontinence.bullet2.1.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"ManagingIncontinence.bullet3", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"ManagingIncontinence.bullet4", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"ManagingIncontinence.bullet5", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"ManagingIncontinence.bullet5.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"ManagingIncontinence.bullet5.2", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"ManagingIncontinence.bullet6", nil)]]];
}

-(void) setUpMuscleParalysisAndWeakness{
    self.contentTitle = CONTENT_TYPE_MuscleParalysisAndWeakness;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 94, 125)];
    [imgView setImage:[UIImage imageNamed:MuscleParalysis_ICON]];
    self.images = @[imgView];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"MuscleParalysisWeakness.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MuscleParalysisWeakness.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"MuscleParalysisWeakness.bullet1.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"MuscleParalysisWeakness.bullet1.2", nil)]]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"MuscleParalysisWeakness.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MuscleParalysisWeakness.bullet2", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MuscleParalysisWeakness.bullet3", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MuscleParalysisWeakness.bullet4", nil)]]];
    
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MuscleParalysisWeakness.bullet5", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MuscleParalysisWeakness.bullet6", nil)]]];
}

-(void)setUpMedicationAdherenceAndCompliance{
    self.contentTitle = CONTENT_TYPE_MedicationAdherenceAndCompliance;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 104, 207)];
    [imgView setImage:[UIImage imageNamed:MedicationAdherence_ICON]];
    self.images = @[imgView];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"MuscleParalysisWeakness.paragraph", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherenceCompliance.bullet1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherenceCompliance.bullet2", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherenceCompliance.bullet3", nil)]]];
}

-(void)setUpMedicationAdherence{
    self.contentTitle = CONTENT_TYPE_MedicationAdherence;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 104, 207)];
    [imgView setImage:[UIImage imageNamed:MedicationAdherence_ICON]];
    self.images = @[imgView];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"MedicationAdherence.header1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherenceCompliance.bullet1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherence.bullet1", nil),NSLocalizedString(@"MedicationAdherence.bullet2", nil),NSLocalizedString(@"MedicationAdherence.bullet3", nil),NSLocalizedString(@"MedicationAdherence.bullet4",
        nil),NSLocalizedString(@"MedicationAdherence.bullet5",
    nil),NSLocalizedString(@"MedicationAdherence.bullet6",
    nil),NSLocalizedString(@"MedicationAdherence.bullet7",
    nil),NSLocalizedString(@"MedicationAdherence.bullet8",
    nil),NSLocalizedString(@"MedicationAdherence.bullet9",
    nil),NSLocalizedString(@"MedicationAdherence.bullet10", nil)]]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"MedicationAdherence.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherence.bullet11", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"MedicationAdherence.bullet0", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"MedicationAdherence.bullet0.1", nil), NSLocalizedString(@"MedicationAdherence.bullet0.2", nil),
        NSLocalizedString(@"MedicationAdherence.bullet0.3", nil),
        NSLocalizedString(@"MedicationAdherence.bullet0.4",nil),
        NSLocalizedString(@"MedicationAdherence.bullet0.5",                                                                                                                                                                                                                                               nil),
        NSLocalizedString(@"MedicationAdherence.bullet0.6",nil),
        NSLocalizedString(@"MedicationAdherence.bullet0.7", nil)]]];
}

-(void)setUpNutrition{
    self.contentTitle = CONTENT_TYPE_Nutrition;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    UIImageView *one = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 275, 161)];
    [one setImage:[UIImage imageNamed:Nutrition_ICON]];
    UIImageView *two = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 138, 92)];
    [two setImage:[UIImage imageNamed:Nutrition2_ICON]];
    self.images = @ [one, two];
    self.content = [[NSMutableArray alloc] init];
    [self.content addObject:[self headerWithTitle:CONTENT_TYPE_Nutrition]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"Nutrition.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet1.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet2", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet3", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Nutrition.bullet3.1", nil), NSLocalizedString(@"Nutrition.bullet3.2", nil),NSLocalizedString(@"Nutrition.bullet3.3", nil),NSLocalizedString(@"Nutrition.bullet3.4", nil)]]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"Nutrition.paragraph2", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet22", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet22.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet3", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet3.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet4", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet4.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet5", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet5.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet5.2", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet5.2.1", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet5.2.2", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet5.2.3", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet5.2.4", nil)]]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"Nutrition.paragraph3", nil)]];

    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet6", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet7", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet7.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet8", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet9", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet10", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet11", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Nutrition.bullet11.1", nil), NSLocalizedString(@"Nutrition.bullet11.2", nil),
        NSLocalizedString(@"Nutrition.bullet11.3", nil),
        NSLocalizedString(@"Nutrition.bullet11.4",nil),
        NSLocalizedString(@"Nutrition.bullet11.5",                                                                                                                                                                                                                                          nil),NSLocalizedString(@"Nutrition.bullet11.6",nil),
        NSLocalizedString(@"Nutrition.bullet11.7", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet12", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet13", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Nutrition.bullet13.1", nil), NSLocalizedString(@"Nutrition.bullet13.2", nil),
              NSLocalizedString(@"Nutrition.bullet13.3", nil),
              NSLocalizedString(@"Nutrition.bullet13.4",nil),
NSLocalizedString(@"Nutrition.bullet13.5",nil),NSLocalizedString(@"Nutrition.bullet13.6",nil),
NSLocalizedString(@"Nutrition.bullet13.7",nil),NSLocalizedString(@"Nutrition.bullet13.8",nil),
              NSLocalizedString(@"Nutrition.bullet13.9", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet14", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Nutrition.bullet14.1", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet15", nil)]]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Nutrition.bullet16", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Nutrition.bullet16.1", nil), NSLocalizedString(@"Nutrition.bullet16.2", nil),
                NSLocalizedString(@"Nutrition.bullet16.3", nil)]]];
}
-(void)setUpPersonalCare {
    /*
     "PersonalCare.bullet1"
     "PersonalCare.bullet1.1"
     "PersonalCare.bullet1.2"
     "PersonalCare.bullet1.3"
     "PersonalCare.bullet1.4"     
     "PersonalCare.bullet2"
     "PersonalCare.paragraph1"
     "PersonalCare.bullet3"
     "PersonalCare.bullet3.1"
     "PersonalCare.bullet3.1.1"
     "PersonalCare.bullet3.1.2"
     "PersonalCare.bullet3.1.3"
     "PersonalCare.bullet3.1.4"
     "PersonalCare.bullet3.1.5"
     "PersonalCare.bullet4"
     "PersonalCare.bullet5"
     "PersonalCare.bullet6"
     "PersonalCare.paragraph2"
     "PersonalCare.bullet7"
     "PersonalCare.bullet7.1"
     "PersonalCare.bullet7.2"
     "PersonalCare.bullet7.3"
     "PersonalCare.bullet7.4"
     "PersonalCare.bullet7.5"
     "PersonalCare.bullet8"
     "PersonalCare.bullet9"
     "PersonalCare.bullet9.1"
     "PersonalCare.bullet9.2"
     */
    self.contentTitle = CONTENT_TYPE_PersonalCare;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 330, 237)];
    [imgView setImage:[UIImage imageNamed:PersonalCare_Icon]];
    self.images = @[imgView];
    NSArray *bullet1 = @[(NSLocalizedString(@"PersonalCare.bullet1", nil))];
    [self.content addObject:[self bulletsWithText:bullet1]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"PersonalCare.bullet1.1", nil), NSLocalizedString(@"PersonalCare.bullet1.2", nil),NSLocalizedString(@"PersonalCare.bullet1.3", nil),NSLocalizedString(@"PersonalCare.bullet1.4", nil)]]];
    NSArray *bullet2 = @[(NSLocalizedString(@"PersonalCare.bullet2", nil))];
    [self.content addObject:[self bulletsWithText:bullet2]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"PersonalCare.paragraph1", nil)]];
    NSArray *bullet3 = @[(NSLocalizedString(@"PersonalCare.bullet3", nil))];
    [self.content addObject:[self bulletsWithText:bullet3]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"PersonalCare.bullet3.1", nil), NSLocalizedString(@"PersonalCare.bullet3.2", nil),NSLocalizedString(@"PersonalCare.bullet3.3", nil),NSLocalizedString(@"PersonalCare.bullet3.4", nil),NSLocalizedString(@"PersonalCare.bullet3.5", nil)]]];
    NSArray *bullet4 = @[(NSLocalizedString(@"PersonalCare.bullet4", nil))];
    [self.content addObject:[self bulletsWithText:bullet4]];
    NSArray *bullet5 = @[(NSLocalizedString(@"PersonalCare.bullet5", nil))];
    [self.content addObject:[self bulletsWithText:bullet5]];
    NSArray *bullet6 = @[(NSLocalizedString(@"PersonalCare.bullet6", nil))];
    [self.content addObject:[self bulletsWithText:bullet6]];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"PersonalCare.paragraph2", nil)]];
    NSArray *bullet7 = @[(NSLocalizedString(@"PersonalCare.bullet7", nil))];
    [self.content addObject:[self bulletsWithText:bullet7]];
        [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"PersonalCare.bullet7.1", nil), NSLocalizedString(@"PersonalCare.bullet7.2", nil),NSLocalizedString(@"PersonalCare.bullet7.3", nil),NSLocalizedString(@"PersonalCare.bullet7.4", nil),NSLocalizedString(@"PersonalCare.bullet7.5", nil)]]];
    NSArray *bullet8 = @[(NSLocalizedString(@"PersonalCare.bullet8", nil))];
    [self.content addObject:[self bulletsWithText:bullet8]];
    NSArray *bullet9 = @[(NSLocalizedString(@"PersonalCare.bullet9", nil))];
    [self.content addObject:[self bulletsWithText:bullet9]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"PersonalCare.bullet9.1", nil), NSLocalizedString(@"PersonalCare.bullet9.2", nil)]]];
}
-(void)setUpSelfCareForCareGiver {
    self.contentTitle = CONTENT_TYPE_SelfCareForTheCaregiver;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    [imgView setImage:[UIImage imageNamed:SelfCareImage]];
    self.images = @[imgView];
    
    /* First bullet */
    NSArray *bullet1 = @[(NSLocalizedString(@"SelfCare.bulletOne", nil))];
    NSArray *bullet11 = @[(NSLocalizedString(@"SelfCare.bulletOne.1", nil))];
    NSArray *bullet2 = @[(NSLocalizedString(@"SelfCare.bulletTwo", nil))];
    
    [self.content addObject:[self bulletsWithText:bullet1]];
    [self.content addObject:[self bulletsWithText:bullet11]];
    [self.content addObject:[self bulletsWithText:bullet2]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"SelfCare.bulletTwo.1", nil), NSLocalizedString(@"SelfCare.bulletTwo.2", nil),NSLocalizedString(@"SelfCare.bulletTwo.3", nil),NSLocalizedString(@"SelfCare.bulletTwo.4", nil)]]];
    
}
-(void)setUpRespiteCare {
    self.contentTitle = CONTENT_TYPE_RespiteCare;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    [imgView setImage:[UIImage imageNamed:RespiteCareImage]];
    self.images = @[imgView];
    NSArray *bullet1 = @[(NSLocalizedString(@"RespiteCare.bullet1", nil))];
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"RespiteCare.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText:bullet1]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"RespiteCare.bullet1.1", nil), NSLocalizedString(@"RespiteCare.bullet1.2", nil),NSLocalizedString(@"RespiteCare.bullet1.3", nil),NSLocalizedString(@"RespiteCare.bullet1.4", nil)]]];
}

-(void)setUpSeizures {
    self.contentTitle = CONTENT_TYPE_Seizures;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    // UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    // [imgView setImage:[UIImage imageNamed:YOGA_IMAGE]];
    
    /* First bullet */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Seizures.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Seizures.bullet1.1", nil), NSLocalizedString(@"Seizures.bullet1.2", nil),NSLocalizedString(@"Seizures.bullet1.3", nil),NSLocalizedString(@"Seizures.bullet1.4", nil)]]];
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Seizures.paragraph2", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Seizures.bullet2.1", nil), NSLocalizedString(@"Seizures.bullet2.2", nil),NSLocalizedString(@"Seizures.bullet2.3", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Seizures.bullet2.3.1", nil)]]];
    
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Seizures.paragraph3", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Seizures.bullet3.1", nil), NSLocalizedString(@"Seizures.bullet3.2", nil),NSLocalizedString(@"Seizures.bullet3.3", nil)]]];
    
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Seizures.paragraph4", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Seizures.bullet4.1", nil), NSLocalizedString(@"Seizures.bullet4.2", nil),NSLocalizedString(@"Seizures.bullet4.3", nil),NSLocalizedString(@"Seizures.bullet4.4", nil),NSLocalizedString(@"Seizures.bullet4.5", nil),NSLocalizedString(@"Seizures.bullet4.6", nil),NSLocalizedString(@"Seizures.bullet4.7", nil),NSLocalizedString(@"Seizures.bullet4.8", nil),NSLocalizedString(@"Seizures.bullet4.9", nil)]]];
    
}

-(void)setUpSleep {
    self.contentTitle = CONTENT_TYPE_Sleep;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    // UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    // [imgView setImage:[UIImage imageNamed:YOGA_IMAGE]];
    
    /* First bullet */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"Sleep.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Sleep.bullet1", nil)]]];
    [self.content addObject:[self subBulletsWithText: @[NSLocalizedString(@"Sleep.bullet1.1", nil), NSLocalizedString(@"Sleep.bullet1.2", nil),NSLocalizedString(@"Sleep.bullet1.3", nil),NSLocalizedString(@"Sleep.bullet1.4", nil),NSLocalizedString(@"Sleep.bullet1.5", nil)]]];

    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"Sleep.bullet2", nil), NSLocalizedString(@"Sleep.bullet3", nil),NSLocalizedString(@"Sleep.bullet4", nil),NSLocalizedString(@"Sleep.bullet5", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"Sleep.bullet5.1", nil)]]];
    [self.content addObject:[self bulletsWithText:@[NSLocalizedString(@"Sleep.bullet6", nil),NSLocalizedString(@"Sleep.bullet7", nil)]]];
    
}

-(void)setUpEmotionalReactions {
    self.contentTitle = CONTENT_TYPE_EmotionalReactionsPostStroke;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    [imgView setImage:[UIImage imageNamed:EmoReactionsImage]];
    self.images = @[imgView];
    
    /* First bullet */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"EmotionalReactions.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"EmotionalReactions.bullet1", nil),NSLocalizedString(@"EmotionalReactions.bullet2", nil),NSLocalizedString(@"EmotionalReactions.bullet3", nil),NSLocalizedString(@"EmotionalReactions.bullet4", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"EmotionalReactions.bullet4.1", nil)]]];
    [self.content addObject:[self bulletsWithText:@[NSLocalizedString(@"EmotionalReactions.bullet5", nil), NSLocalizedString(@"EmotionalReactions.bullet6", nil),NSLocalizedString(@"EmotionalReactions.bullet7", nil)]]];
    
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"EmotionalReactions.bullet7.1", nil)]]];
    [self.content addObject:[self bulletsWithText:@[NSLocalizedString(@"EmotionalReactions.bullet8", nil),NSLocalizedString(@"EmotionalReactions.bullet9", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"EmotionalReactions.bullet9.1", nil),NSLocalizedString(@"EmotionalReactions.bullet9.2", nil)]]];
    [self.content addObject:[self bulletsWithText:@[NSLocalizedString(@"EmotionalReactions.bullet10", nil),NSLocalizedString(@"EmotionalReactions.bullet11", nil)]]];
}
-(void)setUpNavEmoAndBehavChanges {
    self.contentTitle = CONTENT_TYPE_NavigatingEmotionalAndBehavioralChanges;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    // UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    // [imgView setImage:[UIImage imageNamed:YOGA_IMAGE]];
    
    /* First bullet */
    [self.content addObject:[self headerWithTitle:NSLocalizedString(@"NavEmoAndBehavChanges.header1", nil)]];
    [self.content addObject:[self paragraphWithText:NSLocalizedString(@"NavEmoAndBehavChanges.paragraph1", nil)]];
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"NavEmoAndBehavChanges.bullet1", nil),NSLocalizedString(@"NavEmoAndBehavChanges.bullet2", nil),NSLocalizedString(@"NavEmoAndBehavChanges.bullet3", nil),NSLocalizedString(@"NavEmoAndBehavChanges.bullet4", nil),NSLocalizedString(@"NavEmoAndBehavChanges.bullet5", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"NavEmoAndBehavChanges.bullet5.1", nil)]]];
    [self.content addObject:[self bulletsWithText:@[NSLocalizedString(@"NavEmoAndBehavChanges.bullet6", nil)]]];
    [self.content addObject:[self subBulletsWithText:@[NSLocalizedString(@"NavEmoAndBehavChanges.bullet6.1", nil),NSLocalizedString(@"NavEmoAndBehavChanges.bullet6.2", nil)]]];

}

-(void)setUpWorksCited {
    self.contentTitle = CONTENT_TYPE_WorksCited;
    self.contentBGColor = HFTW_DARK;
    self.textColor = [UIColor whiteColor];
    self.backButtonImageStr = BLUE_BACK_BUTTON;
    self.content = [[NSMutableArray alloc] init];
    // UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 350)];
    // [imgView setImage:[UIImage imageNamed:YOGA_IMAGE]];
    
    /* First bullet */
    [self.content addObject:[self bulletsWithText: @[NSLocalizedString(@"WorksCited.bullet1", nil),NSLocalizedString(@"WorksCited.bullet2", nil),NSLocalizedString(@"WorksCited.bullet3", nil),NSLocalizedString(@"WorksCited.bullet4", nil),NSLocalizedString(@"WorksCited.bullet5", nil),NSLocalizedString(@"WorksCited.bullet6", nil)]]];
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

- (NSDictionary *)subBulletsWithText:(NSArray *)bullets {
    NSMutableDictionary *bulletDict = [[NSMutableDictionary alloc] init];
    [bulletDict setObject:TEXT_TYPE_SUB_BULLETS forKey:TEXT_TYPE_KEY];
    [bulletDict setObject:bullets forKey:TEXT_KEY];
    return bulletDict;
}


@end
