//
//  Constants.h
//  H4TWStrokeHope
//
//  Created by Rachel on 3/15/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject
/* COLORS */
//#define HFTW_ACCENT [UIColor colorWithRed:0.99 green:0.37 blue:0.38 alpha:1.0] //#FC5F62, reddish-pinkish color
#define HFTW_ACCENT [UIColor colorWithRed:0.85 green:0.18 blue:0.31 alpha:1.0] // #D82F50, darker red/magenta
#define HFTW_PRIMARY [UIColor colorWithRed:0.40 green:0.80 blue:0.83 alpha:1.0] //#66CCD3, lighter turquoise
#define HFTW_DARK [UIColor colorWithRed:0.24 green:0.65 blue:0.68 alpha:1.0] //#3CA7AE, darker turquoise
#define HFTW_RED [UIColor colorWithRed:0.91 green:0.20 blue:0.29 alpha:1.0] //#E8324A red
#define HFTW_TEXT_GRAY [UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1.0] // #4A4A4A
#define HFTW_LIGHT_GRAY [UIColor colorWithRed:0.78 green:0.78 blue:0.78 alpha:1.0] // #C6C6C6
#define HFTW_LIGHTEST_GRAY [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0] // #F1F1F1
#define HFTW_MAGENTA [UIColor colorWithRed:0.85 green:0.18 blue:0.31 alpha:1.0] // #D82F50

/* IMAGES */
#define WHITE_BACK_BUTTON @"WhiteBackArrow"
#define RED_BACK_BUTTON @"RedBackArrow"
#define BLUE_BACK_BUTTON @"BlueBackArrow"
#define EXERCISE_ICON @"ExerciseIcon"
#define LEARN_ICON @"LearnIcon"
#define REMINDERS_ICON @"RemindersIcon"
#define SURVEYS_ICON @"SurveysIcon"
#define HELP_ME_SPEAK_ICON @"HelpMeSpeakIcon"
#define GENERAL_INFO_ICON @"GeneralInfoIcon"
#define X_ICON @"XIcon"
#define SEARCH_ICON @"SearchIcon"
#define YES_ICON @"YesIcon"
#define NO_ICON @"NoIcon"
#define QUESTION_ICON @"QuestionMarkIcon"
#define THANK_YOU_ICON @"ThankYouIcon"
#define IM_COLD_ICON @"ColdIcon"
#define IM_HOT_ICON @"HotIcon"
#define WATER_ICON @"WaterIcon"
#define LIGHTS_ON_ICON @"LightsOnIcon"
#define LIGHTS_OFF_ICON @"LightsOffIcon"
#define AMBULANCE_ICON @"AmbulanceIcon"
#define BATHROOM_ICON @"BathroomIcon"
#define CANT_SPEAK_ICON @"CantSpeakIcon"
#define BED_ICON @"BedIcon"
#define DIZZY_ICON @"DizzyIcon"
#define IN_A_LITTLE_ICON @"InALittleIcon"
#define NOW_ICON @"NowIcon"
#define HI_ICON @"HiIcon"
#define FOOD_ICON @"FoodIcon"
#define NOT_GIVING_UP_ICON @"NotGivingUpIcon"
#define PAIN_ICON @"PainIcon"
#define SHOWER_ICON @"ShowerIcon"
#define HEART_RATE_ICON @"HeartRateIcon"
#define BLOOD_PRESSURE_ICON @"BloodPressureIcon"
#define BLOOD_PRESSURE_ICON_WHITE @"BloodPressureWhiteIcon"
#define WHITE_HEART_RATE_ICON @"WhiteHeartRateIcon"
#define DIET_ICON @"DietIcon"
#define TOILET_ICON @"ToiletIcon"
#define TREE_ICON @"TreeIcon"
#define HOUSE_ICON @"HouseIcon"
#define BLOOD_SUGAR_ICON @"BloodSugarIcon"
#define GRAB_BARS_ILLUSTRATION @"GrabBars"
#define WEAK_SIDE_BED @"WeakSideBed"
#define SLIPPERY_CARPET @"SlipperyCarpetIcon"
#define BLUE_WATER_ICON @"BlueWater"
#define INFO_BUTTON @"RedInfoButton"
#define REMINDER_CHECK_SELECTED @"ReminderCheckSelected"
#define REMINDER_CHECK_UNSELECTED @"ReminderCheckUnselected"
#define YOGA_IMAGE @"YogaImage"
#define CANE_WALKER @"CaneWalker"
#define GOOD_FOOD @"GoodFood"
#define BAD_FOOD @"BadFood"
#define SMOKING_ICON @"SmokingIcon"
#define SLEEP_ICON @"SleepIcon"
#define CHATBOT_ICON @"ChatBotIcon"
// Premnath 
#define STRONG_ARM_ICON @"StrongArmIcon"
#define STRETCHING_ICON @"StretchingIcon"
#define FUNCTIONAL_MOBILITY_ICON @"FunctionalMobilityIcon"
#define MIND_ICON @"MindIcon"
#define STRONG_LEG_ICON @"StrongLegIcon"
#define BALANCE_ICON @"BalanceIcon"
#define LEGS_1A_TOE @"Legs1AToe"
#define LEGS_1B_KNEE @"Legs1bKnee"
#define LEGS_1C_HIP @"Legs1cHip"
#define ARMS_2A_ELBOW @"Arms2aElbow"
#define ARMS_2B_SHOULDER @"Arms2bShoulder"
#define COORDINATION_3A @"Coordination3a"
#define COORDINATION_3B @"Coordination3b"
#define FUNCTIONALMOBILITY_4A @"FunctionalMobility4a"
#define FUNCTIONALMOBILITY_4B @"FunctionalMobility4b"
#define FUNCTIONALMOBILITY_4C @"FunctionalMobility4c"
#define FEMALE_DOC_5A @"FemaleDoc5a"
#define MALE_DOC_5B @"MaleDoc5b"

/* STRETCHING CLIPS */
#define STRETCHING_LEG_STRETCH_1 @"LegStretch1"
#define STRETCHING_LEG_STRETCH_2 @"LegStretch2"
#define STRETCHING_KNEE_STRETCH_1 @"KneeStretch1"
#define STRETCHING_KNEE_STRETCH_2 @"KneeStretch2"
#define STRETCHING_ANKLE_STRETCH_1 @"AnkleStretch1"
#define STRETCHING_ANKLE_STRETCH_2 @"AnkleStretch2"
#define STRETCHING_HAND_STRETCH_1 @"HandStretch1"
#define STRETCHING_HAND_STRETCH_2 @"HandStretch2"
#define STRETCHING_SHOULDER_STRETCH_1 @"ShoulderStretch1"
#define STRETCHING_SHOULDER_STRETCH_2 @"ShoulderStretch2"
#define STRETCHING_ARM_STRETCH_1 @"ArmStretch1"
#define STRETCHING_ARM_STRETCH_2 @"ArmStretch2"

/* VR CLIPS */
#define VR_CLIP_BELLS @"bells"
#define VR_CLIP_BUDDHA @"Buddha"
#define VR_CLIP_FLAGS @"Flags"
#define VR_CLIP_MARKET_PLACE_1 @"MarketPlace1"
#define VR_CLIP_MARKET_PLACE_2 @"MarketPlace2"
#define VR_CLIP_ROCKY_BEACH @"RockyBeach"
#define VR_CLIP_SANDY_BEACH @"SandyBeach"

/* EXERCISE VIDEOS */
#define VIDEO_1A_TOE_FLEXION @"1AToeFlexion.m4v"
#define VIDEO_1B_KNEE_FLEXION @"1BKneeFlexion.m4v"
#define VIDEO_1C_HIP_FLEXION @"1CHipFlexion.m4v"
#define VIDEO_2A_ELBOW_FLEXION @"2AElbowFlexion.m4v"
#define VIDEO_2B_SHOULDER_FLEXION @"2BShoulderFlexion.m4v"
#define VIDEO_3A_LEG_CONTROL_1 @"3ALegControl1.m4v"
#define VIDEO_3B_LEG_CONTROL_2 @"3BLegControl2.m4v"
#define VIDEO_4A_BRIDGE_HIP_LIFT @"4ABridgeHipLift.m4v"
#define VIDEO_4B_ARM_AND_STRENGTHENING @"4BArmAndTrunkStrengthening.m4v"
#define VIDEO_4C_SIT_TO_STAND @"4CSitToStand.m4v"
#define VIDEO_5A_FEMALE_DOC @"5AFemaleDocWaving.m4v"		
#define VIDEO_5B_MALE_DOC @"5BMaleDocWaving.m4v"

/* EXERCISE TITLE */
#define LEGS_TITLE_1A_TOE NSLocalizedString(@"Legs.toe", nil)
#define LEGS_TITLE_1B_KNEE NSLocalizedString(@"Legs.knee", nil)
#define LEGS_TITLE_1C_HIP NSLocalizedString(@"Legs.hip", nil)
#define ARMS_TITLE_2A_ELBOW NSLocalizedString(@"Arms.elbow", nil)
#define ARMS_TITLE_2B_SHOULDER NSLocalizedString(@"Arms.shoulder", nil)
#define COORDINATION_TITLE_3A_LEG_CONTROL_1 NSLocalizedString(@"Coordination.legControl1", nil)
#define COORDINATION_TITLE_3B_LEG_CONTROL_2 NSLocalizedString(@"Coordination.legControl2", nil)
#define FUNCTIONALMOBILITY_4A_BRIDGE_HIP_LIFT NSLocalizedString(@"FunctionalMobility.bridgeHipLift", nil)
#define FUNCTIONALMOBILITY_4B_ARM_AND_TRUNK_STRENGTHENING NSLocalizedString(@"FunctionalMobility.armTrunkStrengthening", nil)
#define FUNCTIONALMOBILITY_4C_SIT_TO_STAND NSLocalizedString(@"FunctionalMobility.sitToStand", nil)

/* WEEKDAYS */
#define EVERYDAY NSLocalizedString(@"Reminders.everyday", nil)
#define SUNDAY NSLocalizedString(@"Reminders.sunday", nil)
#define MONDAY NSLocalizedString(@"Reminders.monday", nil)
#define TUESDAY NSLocalizedString(@"Reminders.tuesday", nil)
#define WEDNESDAY NSLocalizedString(@"Reminders.wednesday", nil)
#define THURSDAY NSLocalizedString(@"Reminders.thursday", nil)
#define FRIDAY NSLocalizedString(@"Reminders.friday", nil)
#define SATURDAY NSLocalizedString(@"Reminders.saturday", nil)

/* REMINDER SUGGESTIONS */
#define DOCTORS_VISIT_REMINDER NSLocalizedString(@"Reminders.doctorsVisit", nil)
#define BLOOD_TEST_REMINDER NSLocalizedString(@"Reminders.bloodTest", nil)
#define MEDICATION_REMINDER NSLocalizedString(@"Reminders.medication", nil)
#define EXERCISE_REMINDER NSLocalizedString(@"Reminders.exercise", nil)

/* EXERCISE CONTENT */
#define EXERCISE_PARAGRAPH_ONE NSLocalizedString(@"Exercises.instructions", nil)
#define STRETCHING_INTRUCTIONS_TITLE @"Stretching Instructions"
#define STRETCHING_INSTRUCTIONS_BULLETS @[@"Do the stretches 3 times and hold for 30 seconds", @"Stretch to a point of slight discomfort and hold. Reduce stretch if painful", @"Stop if it causes pain" @"If you are a patient, do these under supervision of a trained health professional first time to get right training for you and your family member and to prevent injuries."]
#define STRETCHING_ADDUCTORS_INSTRUCTIONS NSLocalizedString(@"Stretching.adductorsInstructions", nil)
#define STRETCHING_HAMSTRINGS_INSTRUCTIONS NSLocalizedString(@"Stretching.hamstringsInstructions", nil)
#define STRETCHING_DORSIFLEXORS_INSTRUCTIONS NSLocalizedString(@"Stretching.dorsiflexorsInstructions", nil)
#define STRETCHING_HAND_INSTRUCTIONS NSLocalizedString(@"Stretching.handStretchInstructions", nil)
#define STRETCHING_SHOULDER_INSTRUCTIONS NSLocalizedString(@"Stretching.shoulderStretchInstructions", nil)
#define STRETCHING_ARM_INSTRUCTIONS NSLocalizedString(@"Stretching.armStretchInstructions", nil)
#define STRETCHING_END @"WOW, YOU ARE GREAT!! YOU DID IT !"
#define EXERCISES_GENERAL_INSTRUCTIONS_TITLE @"Here are some general instructions"
#define EXERCISES_GENERAL_INSTRUCTIONS_BULLETS @[@"\"Stop if it causes pain\". Do these exercises gently. ", @"The body and brain like symmetry so whatever you do to the \"good side\" do exactly the same to the involved side.", @"If you are a patient, do these under supervision of a trained health professional first time to get right training for you  and your family member and to prevent injuries. We don't want you to be injured so be careful!.", @"Ask your health professionals which of these would work best for you and if any modifications are needed.", @"Each given exercise requires an individual judgement and approach, and this application is intended only for educational  purposes, and is not intended to be, and should not be interpreted as, medical advice. Nothing contained in any part of this application, creates or has created or is intended to create, implicitly or explicitly, any manner of patient-physician relationship. We hope you find this educational content helpful to learn how to improve mobility after  a life changing event like stroke."]

/* VR VIDEOS INSTRUCTIONS */
#define VR_BELLS_INSTRUCTIONS NSLocalizedString(@"MindExercises.bellsInstructions", nil)
#define VR_BUDDHA_INSTRUCTIONS NSLocalizedString(@"MindExercises.buddhaInstructions", nil)
#define VR_FLAGS_INSTRUCTIONS NSLocalizedString(@"MindExercises.flagsInstructions", nil)
#define VR_MARKET_PLACE_1_INSTRUCTIONS NSLocalizedString(@"MindExercises.marketplace1Instructions", nil)
#define VR_MARKET_PLACE_2_INSTRUCTIONS NSLocalizedString(@"MindExercises.marketplace2Instructions", nil)
#define VR_ROCKY_BEACH_INSTRUCTIONS NSLocalizedString(@"MindExercises.rockybeachInstructions", nil)
#define VR_SANDY_BEACH_INSTRUCTIONS NSLocalizedString(@"MindExercises.sandybeachInstructions", nil)


/* QUOTES SECTION */
#define QUOTE_LABEL NSLocalizedString(@"Quotes.title", nil)
#define QUOTES_AWS_URLS @[@"hi"]
#define QUOTES_IMAGE1 @"assembly1"
#define QUOTES_IMAGE2 @"assembly2"
#define QUOTES_IMAGE3 @"assembly3"
#define QUOTES_IMAGE4 @"assembly4"
#define QUOTES_IMAGE5 @"assembly5"

/* Relaxing Music Section*/
#define MUSIC_LABEL NSLocalizedString(@"Music.title", nil)


/* STRINGS */
#define ABOUT_US_SECTION_TITLE NSLocalizedString(@"GeneralInfo.aboutUs", nil)
#define TERMS_SECTION_TITLE NSLocalizedString(@"GeneralInfo.termsOfUse", nil)
#define PRIVACY_POLICY_SECTION_TITLE NSLocalizedString(@"GeneralInfo.privacyPolicy", nil)
#define COPYRIGHT_SECTION_TITLE NSLocalizedString(@"GeneralInfo.copyright", nil)

/* HELP ME SPEAK WORDS */
#define HELP_ME_SPEAK_YES NSLocalizedString(@"HelpMeSpeak.yes", nil)
#define HELP_ME_SPEAK_NO NSLocalizedString(@"HelpMeSpeak.no", nil)
#define HELP_ME_SPEAK_THANK_YOU NSLocalizedString(@"HelpMeSpeak.thankYou", nil)
#define HELP_ME_SPEAK_BATHROOM NSLocalizedString(@"HelpMeSpeak.bathroom", nil)
#define HELP_ME_SPEAK_WATER NSLocalizedString(@"HelpMeSpeak.water", nil)
#define HELP_ME_SPEAK_FOOD NSLocalizedString(@"HelpMeSpeak.hungry", nil)
#define HELP_ME_SPEAK_NOT_GIVING_UP NSLocalizedString(@"HelpMeSpeak.notGivingUp", nil)
#define HELP_ME_SPEAK_PAIN NSLocalizedString(@"HelpMeSpeak.pain", nil)
#define HELP_ME_SPEAK_CANT_SPEAK NSLocalizedString(@"HelpMeSpeak.cantSpeak", nil)
#define HELP_ME_SPEAK_I_LOVE_YOU NSLocalizedString(@"HelpMeSpeak.iLoveYou", nil)
#define HELP_ME_SPEAK_IM_COLD NSLocalizedString(@"HelpMeSpeak.imCold", nil)
#define HELP_ME_SPEAK_IM_HOT NSLocalizedString(@"HelpMeSpeak.imHot", nil)
#define HELP_ME_SPEAK_DIZZY NSLocalizedString(@"HelpMeSpeak.dizzy", nil)
#define HELP_ME_SPEAK_LIGHTS_ON NSLocalizedString(@"HelpMeSpeak.lightsOn", nil)
#define HELP_ME_SPEAK_LIGHTS_OFF NSLocalizedString(@"HelpMeSpeak.lightsOff", nil)
#define HELP_ME_SPEAK_GET_IN_BED NSLocalizedString(@"HelpMeSpeak.getInBed", nil)
#define HELP_ME_SPEAK_GET_OUT_OF_BED NSLocalizedString(@"HelpMeSpeak.getOutOfBed", nil)
#define HELP_ME_SPEAK_HOW_ARE_YOU NSLocalizedString(@"HelpMeSpeak.howAreYou", nil)
#define HELP_ME_SPEAK_AMBULANCE NSLocalizedString(@"HelpMeSpeak.ambulance", nil)
#define HELP_ME_SPEAK_IN_A_LITTLE NSLocalizedString(@"HelpMeSpeak.inALittle", nil)
#define HELP_ME_SPEAK_NOW NSLocalizedString(@"HelpMeSpeak.now", nil)
#define HELP_ME_SPEAK_GO_OUTSIDE NSLocalizedString(@"HelpMeSpeak.goOutside", nil)
#define HELP_ME_SPEAK_SAY_HI NSLocalizedString(@"HelpMeSpeak.sayHi", nil)

/* BEFAST */
#define BEFAST_B NSLocalizedString(@"Learn.befastB", nil)
#define BEFAST_E NSLocalizedString(@"Learn.befastE", nil)
#define BEFAST_F NSLocalizedString(@"Learn.befastF", nil)
#define BEFAST_A NSLocalizedString(@"Learn.befastA", nil)
#define BEFAST_S NSLocalizedString(@"Learn.befastS", nil)
#define BEFAST_T NSLocalizedString(@"Learn.befastT", nil)

/* LEARN - BLOOD PRESSURE */
#define BLOOD_PRESSURE_PROBLEM NSLocalizedString(@"BloodPressure.problem", nil)
#define BLOOD_PRESSURE_PROBLEM_BOLD_PART NSLocalizedString(@"BloodPressure.problemBoldPart", nil)
#define BLOOD_PRESSURE_PROBLEM_NONBOLD_PART NSLocalizedString(@"BloodPressure.problemNonBoldPart", nil)
#define BLOOD_PRESSURE_WHAT_TO_DO NSLocalizedString(@"BloodPressure.whatToDo", nil)
#define BLOOD_PRESSURE_WHAT_TO_DO_BOLD_PART NSLocalizedString(@"BloodPressure.whatToDoBoldPart", nil)

/* LEARN – BLOOD SUGAR */
#define BLOOD_SUGAR_PROBLEM NSLocalizedString(@"BloodSugar.problem", nil)
#define BLOOD_SUGAR_PROBLEM_BOLD_PART NSLocalizedString(@"BloodSugar.problemBoldPart", nil)
#define BLOOD_SUGAR_WHAT_TO_DO NSLocalizedString(@"BloodSugar.whatToDo", nil)
#define BLOOD_SUGAR_WHAT_TO_DO_FIRST_BOLD_PART NSLocalizedString(@"BloodSugar.whatToDoFirstBoldPart", nil)
#define BLOOD_SUGAR_WHAT_TO_DO_SECOND_BOLD_PART NSLocalizedString(@"BloodSugar.whatToDoSecondBoldPart", nil)

/* LEARN - FAQ */
#define FAQ_QUESTION_ONE NSLocalizedString(@"Faq.questionOne", nil)
#define FAQ_ANSWER_ONE NSLocalizedString(@"Faq.answerOne", nil)
#define FAQ_QUESTION_TWO NSLocalizedString(@"Faq.questionTwo", nil)
#define FAQ_ANSWER_TWO NSLocalizedString(@"Faq.answerTwo", nil)
#define FAQ_QUESTION_THREE NSLocalizedString(@"Faq.questionThree", nil)
#define FAQ_ANSWER_THREE NSLocalizedString(@"Faq.answerThree", nil)

/* LEARN – HEART RATE */
#define HEART_RATE_PROBLEM NSLocalizedString(@"HeartRate.problem", nil)
#define HEART_RATE_PROBLEM_BOLD_PART NSLocalizedString(@"HeartRate.problemBoldPart", nil)
#define HEART_RATE_WHAT_TO_DO NSLocalizedString(@"HeartRate.whatToDo", nil)
#define HEART_RATE_WHAT_TO_DO_FIRST_BOLD_PART NSLocalizedString(@"HeartRate.whatToDoFirstBoldPart", nil)
#define HEART_RATE_WHAT_TO_DO_SECOND_BOLD_PART NSLocalizedString(@"HeartRate.whatToDoSecondBoldPart", nil)

/* LEARN - DIET */
#define DIET_PROBLEM NSLocalizedString(@"Diet.problem", nil)
#define DIET_WHAT_TO_DO NSLocalizedString(@"Diet.whatToDo", nil)

/* LEARN - BLADDER/BOWEL */
#define BLADDER_BOWEL_PROBLEM DIET_WHAT_TO_DO (NSLocalizedString(@"BladderBowel.problem", nil))
#define BLADDER_BOWEL_WHAT_TO_DO_BULLET_ONE DIET_WHAT_TO_DO (NSLocalizedString(@"BladderBowel.whatToDoBulletOne", nil))
#define BLADDER_BOWEL_WHAT_TO_DO_BULLET_TWO DIET_WHAT_TO_DO (NSLocalizedString(@"BladderBowel.whatToDoBulletTwo", nil))
#define BLADDER_BOWEL_WHAT_TO_DO_BULLET_THREE DIET_WHAT_TO_DO (NSLocalizedString(@"BladderBowel.whatToDoBulletThree", nil))

/* LEARN - EXERCISES */
#define EXERCISES_PROBLEM NSLocalizedString(@"Exercises.problem", nil)
#define EXERCISES_PARAGRAPH_ONE NSLocalizedString(@"Exercises.parOne", nil)
#define EXERCISES_BULLET_ONE NSLocalizedString(@"Exercises.bulletOne", nil)
#define EXERCISES_BULLET_ONE_BOLD_PART NSLocalizedString(@"Exercises.bulletOneBoldPart", nil)
#define EXERCISES_BULLET_TWO NSLocalizedString(@"Exercises.bulletTwo", nil)
#define EXERCISES_BULLET_TWO_BOLD_PART NSLocalizedString(@"Exercises.bulletTwoBoldPart", nil)
#define EXERCISES_BULLET_THREE NSLocalizedString(@"Exercises.bulletThree", nil)
#define EXERCISES_BULLET_THREE_BOLD_PART NSLocalizedString(@"Exercises.bulletThreeBoldPart", nil)
#define EXERCISES_BULLET_FOUR NSLocalizedString(@"Exercises.bulletFour", nil)
#define EXERCISES_BULLET_FOUR_BOLD_PART NSLocalizedString(@"Exercises.bulletFourBoldPart", nil)
#define EXERCISES_BULLET_FIVE NSLocalizedString(@"Exercises.bulletFive", nil)
#define EXERCISES_BULLET_FIVE_BOLD_PART NSLocalizedString(@"Exercises.bulletFiveBoldPart", nil)
#define EXERCISES_BULLET_SIX NSLocalizedString(@"Exercises.bulletSix", nil)
#define EXERCISES_BULLET_SIX_BOLD_PART NSLocalizedString(@"Exercises.bulletSixBoldPart", nil)

/* LEARN - SHOWER/BATH */
#define SHOWER_BATH_PROBLEM NSLocalizedString(@"ShowerBath.problem", nil)
#define SHOWER_BATH_BULLET_ONE NSLocalizedString(@"ShowerBath.bulletOne", nil)
#define SHOWER_BATH_BULLET_ONE_BOLD_PART NSLocalizedString(@"ShowerBath.bulletOneBoldPart", nil)
#define SHOWER_BATH_BULLET_TWO NSLocalizedString(@"ShowerBath.bulletTwo", nil)
#define SHOWER_BATH_BULLET_TWO_BOLD_PART NSLocalizedString(@"ShowerBath.bulletTwoBoldPart", nil)
#define SHOWER_BATH_BULLET_THREE NSLocalizedString(@"ShowerBath.bulletThree", nil)
#define SHOWER_BATH_BULLET_THREE_BOLD_PART NSLocalizedString(@"ShowerBath.bulletThreeBoldPart", nil)
#define SHOWER_BATH_PARAGRAPH NSLocalizedString(@"ShowerBath.paragraph", nil)

/* LEARN - HOME MOD */
#define HOME_MOD_PROBLEM NSLocalizedString(@"HomeMod.problem", nil)
#define HOME_MOD_SUBHEADER_ONE NSLocalizedString(@"HomeMod.subHeaderOne", nil)
#define HOME_MOD_CONTENT_ONE NSLocalizedString(@"HomeMod.contentOne", nil)
#define HOME_MOD_SUBHEADER_TWO NSLocalizedString(@"HomeMod.subHeaderTwo", nil)
#define HOME_MOD_CONTENT_TWO NSLocalizedString(@"HomeMod.contentTwo", nil)
#define HOME_MOD_SUBHEADER_THREE NSLocalizedString(@"HomeMod.subHeaderThree", nil)
#define HOME_MOD_CONTENT_THREE NSLocalizedString(@"HomeMod.contentThree", nil)

/* ABOUT US SECTION */
#define ABOUT_US_PARAGRAPH_ONE NSLocalizedString(@"AboutUs.paragraphOne", nil)
#define ABOUT_US_PARAGRAPH_TWO NSLocalizedString(@"AboutUs.paragraphTwo", nil)
#define ABOUT_US_PARAGRAPH_THREE NSLocalizedString(@"AboutUs.paragraphThree", nil)

#define APP_FEATURE_ONE NSLocalizedString(@"AboutUs.featureOne", nil)
#define APP_FEATURE_TWO NSLocalizedString(@"AboutUs.featureTwo", nil)
#define APP_FEATURE_THREE NSLocalizedString(@"AboutUs.featureThree", nil)
#define APP_FEATURE_FOUR NSLocalizedString(@"AboutUs.featureFour", nil)

/* TERMS OF USE SECTION */

//"Thank you for using Health4TheWorld!"
#define THANK_YOU_PARAGRAPH_ONE NSLocalizedString(@"Terms.thankYouParOne", nil)
#define THANK_YOU_PARAGRAPH_TWO NSLocalizedString(@"Terms.thankYouParTwo", nil)
#define THANK_YOU_PARAGRAPH_THREE NSLocalizedString(@"Terms.thankYouParThree", nil)
//"Using Health4TheWorld"
#define USE_SECTION_ONE_HEADER NSLocalizedString(@"Terms.useSectionOneHeader", nil)
#define USE_SECTION_ONE_PARAGRAPH_ONE NSLocalizedString(@"Terms.useSectionOneParOne", nil)
#define USE_SECTION_ONE_BULLETS @[NSLocalizedString(@"Terms.useSectionOneBulletOne", nil), NSLocalizedString(@"Terms.useSectionOneBulletTwo", nil), NSLocalizedString(@"Terms.useSectionOneBulletThree", nil), NSLocalizedString(@"Terms.useSectionOneBulletFour", nil), NSLocalizedString(@"Terms.useSectionOneBulletFive", nil), NSLocalizedString(@"Terms.useSectionOneBulletSix", nil)]
#define USE_SECTION_ONE_PARAGRAPH_TWO NSLocalizedString(@"Terms.useSectionOneParTwo", nil)
#define USE_SECTION_TWO_HEADER NSLocalizedString(@"Terms.useSectionTwoHeader", nil)
#define USE_SECTION_TWO_PARAGRAPH NSLocalizedString(@"Terms.useSectionTwoParagraph", nil)
//"Our Educational Content"
#define EDU_SECTION_ONE_HEADER NSLocalizedString(@"Terms.eduSectionOneHeader", nil)
#define EDU_SECTION_ONE_PARAGRAPH NSLocalizedString(@"Terms.eduSectionOnePar", nil)
#define EDU_SECTION_TWO_HEADER NSLocalizedString(@"Terms.eduSectionTwoHeader", nil)
#define EDU_SECTION_TWO_PARAGRAPH NSLocalizedString(@"Terms.eduSectionTwoPar", nil)
#define EDU_SECTION_THREE_HEADER NSLocalizedString(@"Terms.eduSectionThreeHeader", nil)
#define EDU_SECTION_THREE_PARAGRAPH NSLocalizedString(@"Terms.eduSectionThreePar", nil)
#define EDU_SECTION_FOUR_HEADER NSLocalizedString(@"Terms.eduSectionFourHeader", nil)
#define EDU_SECTION_FOUR_PARAGRAPH NSLocalizedString(@"Terms.eduSectionFourPar", nil)
#define EDU_SECTION_FIVE_HEADER NSLocalizedString(@"Terms.eduSectionFiveHeader", nil)
#define EDU_SECTION_FIVE_PARAGRAPH NSLocalizedString(@"Terms.eduSectionFivePar", nil)
// "Your Content"
#define YOUR_CONTENT_SECTION_ONE_HEADER NSLocalizedString(@"Terms.yourContentSectionOneHeader", nil)
#define YOUR_CONTENT_SECTION_ONE_PARAGRAPH NSLocalizedString(@"Terms.yourContentSectionOnePar", nil)
#define YOUR_CONTENT_SECTION_TWO_HEADER NSLocalizedString(@"Terms.yourContentSectionTwoHeader", nil)
#define YOUR_CONTENT_SECTION_TWO_PARAGRAPH NSLocalizedString(@"Terms.yourContentSectionTwoPar", nil)
#define YOUR_CONTENT_SECTION_THREE_HEADER NSLocalizedString(@"Terms.yourContentSectionThreeHeader", nil)
#define YOUR_CONTENT_SECTION_THREE_PARAGRAPH NSLocalizedString(@"Terms.yourContentSectionThreePar", nil)
// "Security"
#define SECURITY_PARAGRAPH NSLocalizedString(@"Terms.securityParagraph", nil)
// "Third party content"
#define THIRD_PARTY_CONTENT_PARAGRAPH NSLocalizedString(@"Terms.thirdPartyContentPar", nil)
// "Copyright and trademark policy"
#define COPYRIGHT_PARAGRAPH NSLocalizedString(@"Terms.copyrightPar", nil)
// "Modifying and terminating our services"
#define MODIFYING_PARAGRAPH NSLocalizedString(@"Terms.modifyingPar", nil)
// "Disclaimers"
#define DISCLAIMERS_PARAGRAPH_ONE NSLocalizedString(@"Terms.disclaimersParOne", nil)
#define DISCLAIMERS_PARAGRAPH_TWO NSLocalizedString(@"Terms.disclaimersParTwo", nil)
// "Limitations"
#define LIMITATIONS_PARAGRAPH_ONE NSLocalizedString(@"Terms.limitationsParOne", nil)
#define LIMITATIONS_PARAGRAPH_TWO NSLocalizedString(@"Terms.limitationsParTwo", nil)
#define LIMITATIONS_PARAGRAPH_THREE NSLocalizedString(@"Terms.limitationsParThree", nil)
// "Idemnification"
#define IDEMNIFICATION_PARAGRAPH NSLocalizedString(@"Terms.idemnificationPar", nil)
// "Governing law and jurisdiction"
#define GOVERNING_PARAGRAPH_ONE NSLocalizedString(@"Terms.governingParOne", nil)
#define GOVERNING_PARAGRAPH_TWO NSLocalizedString(@"Terms.governingParTwo", nil)
// "General Terms"
#define GENERAL_TERMS_SECTION_ONE_HEADER NSLocalizedString(@"Terms.generalTermsSectionOneHeader", nil)
#define GENERAL_TERMS_SECTION_ONE_PARAGRAPH NSLocalizedString(@"Terms.generalTermsSectionOnePar", nil)
#define GENERAL_TERMS_SECTION_TWO_HEADER NSLocalizedString(@"Terms.generalTermsSectionTwoHeader", nil)
#define GENERAL_TERMS_SECTION_TWO_PARAGRAPH NSLocalizedString(@"Terms.generalTermsSectionTwoPar", nil)
#define GENERAL_TERMS_SECTION_THREE_HEADER NSLocalizedString(@"Terms.generalTermsSectionThreeHeader", nil)
#define GENERAL_TERMS_SECTION_THREE_PARAGRAPH NSLocalizedString(@"Terms.generalTermsSectionThreePar", nil)
#define GENERAL_TERMS_SECTION_FOUR_HEADER NSLocalizedString(@"Terms.generalTermsSectionFourHeader", nil)
#define GENERAL_TERMS_SECTION_FOUR_PARAGRAPH NSLocalizedString(@"Terms.generalTermsSectionFourPar", nil)
#define GENERAL_TERMS_SECTION_FIVE_HEADER NSLocalizedString(@"Terms.generalTermsSectionFiveHeader", nil)
#define GENERAL_TERMS_SECTION_FIVE_PARAGRAPH NSLocalizedString(@"Terms.generalTermsSectionFivePar", nil)
// "Referenced Policies"
#define REFERENCED_POLICIES_BULLETS @[NSLocalizedString(@"Terms.referencedPoliciesBulletOne", nil), NSLocalizedString(@"Terms.referencedPoliciesBulletTwo", nil), NSLocalizedString(@"Terms.referencedPoliciesBulletThree", nil), NSLocalizedString(@"Terms.referencedPoliciesBulletFour", nil)]
// "Acceptable Use Policy"
#define ACCEPTABLE_USE_PARAGRAPH_ONE NSLocalizedString(@"Terms.acceptableUseParOne", nil)
#define ACCEPTABLE_USE_SECTION_ONE_HEADER NSLocalizedString(@"Terms.acceptableUseSectionOneHeader", nil)
#define ACCEPTABLE_USE_SECTION_ONE_BULLETS @[NSLocalizedString(@"Terms.acceptableUseSectionOneBulletOne", nil), NSLocalizedString(@"Terms.acceptableUseSectionOneBulletTwo", nil), NSLocalizedString(@"Terms.acceptableUseSectionOneBulletThree", nil), NSLocalizedString(@"Terms.acceptableUseSectionOneBulletFour", nil), NSLocalizedString(@"Terms.acceptableUseSectionOneBulletFive", nil), NSLocalizedString(@"Terms.acceptableUseSectionOneBulletSix", nil)]
#define ACCEPTABLE_USE_SECTION_TWO_HEADER NSLocalizedString(@"Terms.acceptableUseSectionTwoHeader", nil)
#define ACCEPTABLE_USE_SECTION_TWO_BULLETS @[NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletOne", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletTwo", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletThree", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletFour", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletFive", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletSix", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletSeven", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletEight", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletNine", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletTen", nil), NSLocalizedString(@"Terms.acceptableUseSectionTwoBulletEleven", nil)]
#define ACCEPTABLE_USE_SECTION_THREE_HEADER NSLocalizedString(@"Terms.acceptableUseSectionThreeHeader", nil)
#define ACCEPTABLE_USE_SECTION_THREE_BULLETS @[NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletOne", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletTwo", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletThree", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletFour", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletFive", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletSix", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletSeven", nil), NSLocalizedString(@"Terms.acceptableUseSectionThreeBulletEight", nil)]
#define ACCEPTABLE_USE_SECTION_THREE_PARAGRAPH_ONE NSLocalizedString(@"Terms.acceptableUseSectionThreeParOne", nil)
// "User Content"
#define AU_USER_CONTENT_SECTION_ONE_HEADER NSLocalizedString(@"Terms.auUserContentSectionOneHeader", nil) // AU = acceptable use
#define AU_USER_CONTENT_SECTION_ONE_PARAGRAPH NSLocalizedString(@"Terms.auUserContentSectionOnePar", nil)
#define AU_USER_CONTENT_SECTION_TWO_HEADER NSLocalizedString(@"Terms.auUserContentSectionTwoHeader", nil)
#define AU_USER_CONTENT_SECTION_TWO_PARAGRAPH NSLocalizedString(@"Terms.auUserContentSectionTwoPar", nil)
#define AU_USER_CONTENT_SECTION_THREE_HEADER NSLocalizedString(@"Terms.auUserContentSectionThreeHeader", nil)
#define AU_USER_CONTENT_SECTION_THREE_PARAGRAPH NSLocalizedString(@"Terms.auUserContentSectionThreePar", nil)
// "Copyright and Trademark Policy"
#define COPYRIGHT_PARAGRAPH_ONE NSLocalizedString(@"Terms.copyRightParOne", nil)
#define COPYRIGHT_SECTION_ONE_HEADER NSLocalizedString(@"Terms.copyrightSectionOneHeader", nil)
#define COPYRIGHT_SECTION_ONE_PARAGRAPH_ONE NSLocalizedString(@"Terms.copyrightSectionOneParOne", nil)
#define COPYRIGHT_SECTION_ONE_PARAGRAPH_TWO NSLocalizedString(@"Terms.copyrightSectionOneParagraphTwo", nil)
#define COPYRIGHT_SECTION_ONE_PARAGRAPH_THREE NSLocalizedString(@"Terms.copyrightSectionOneParThree", nil)
#define COPYRIGHT_SECTION_ONE_BULLETS_ONE @[NSLocalizedString(@"Terms.copyrightSectionOneBulletOne", nil), NSLocalizedString(@"Terms.copyrightSectionOneBulletTwo", nil), NSLocalizedString(@"Terms.copyrightSectionOneBulletThree", nil), NSLocalizedString(@"Terms.copyrightSectionOneBulletFour", nil), NSLocalizedString(@"Terms.copyrightSectionOneBulletFive", nil), NSLocalizedString(@"Terms.copyrightSectionOneBulletSix", nil)]
#define COPYRIGHT_SECTION_ONE_PARAGRAPH_FOUR NSLocalizedString(@"Terms.copyRightSectionOneParFour", nil)
#define COPYRIGHT_SECTION_ONE_BULLETS_TWO @[NSLocalizedString(@"Terms.copyrightSectionOneBulletsTwoOne", nil), NSLocalizedString(@"Terms.copyrightSectionOneBulletsTwoTwo", nil)]
#define COPYRIGHT_SECTION_ONE_PARAGRAPH_FIVE NSLocalizedString(@"Terms.copyrightSectionOneParFive", nil)
#define COPYRIGHT_SECTION_TWO_HEADER NSLocalizedString(@"Terms.copyrightSectionTwoHeader", nil)
#define COPYRIGHT_SECTION_TWO_PARAGRAPH NSLocalizedString(@"Terms.sectionTwoPar", nil)
// Honor code
#define HONOR_CODE_PARAGRAPH_ONE NSLocalizedString(@"Terms.honorCodeParOne", nil)
#define HONOR_CODE_BULLETS @[NSLocalizedString(@"Terms.honorCodeBulletOne", nil), NSLocalizedString(@"Terms.honorCodeBulletTwo", nil), NSLocalizedString(@"Terms.honorCodeBulletThree", nil), NSLocalizedString(@"Terms.honorCodeBulletFour", nil)]

/* PRIVACY POLICY SECTION */
#define PP_SECTION_ONE_HEADER @"Purpose"
#define PP_SECTION_ONE_PARAGRAPH_ONE @"The purpose of this privacy policy (this “Privacy Policy”) is to describe how Health4TheWorld (“Health4TheWorld”, “we,” “us,” or “our”) collects, uses and shares information and data about you through our online interfaces (e.g., websites, services, products and applications, including mobile applications), including Health4TheWorld.org (collectively referred to herein as the \"Website\"). Please read this notice carefully to understand how we use and disclose information collected through our Website. If you do not understand any aspects of our Privacy Policy, please feel free to contact us at www.Health4TheWorld.org."
#define PP_SECTION_ONE_PARAGRAPH_TWO @"IMPORTANT NOTE: By accessing, using, or viewing the Website, you expressly consent to our collection, use, and disclosure of your personal information in accordance with the terms and conditions of this Privacy Policy.  This Privacy Policy is incorporated into and subject to the Terms of Use for the Website (“Terms”). When reading through this Privacy Policy please read the entire contents and do not rely on headings, which are illustrative of some but not all of the contents and should not be read so as to limit any of the terms and conditions detailed below each heading."
#define PP_SECTION_TWO_HEADER @"What Information this Privacy Policy Covers"
#define PP_SECTION_TWO_PARAGRAPH_ONE @"This Privacy Policy covers information we collect from you through use of our Website, and any personal information that you provide to us, including through email.  We shall explain in this Privacy Policy what information we collect about you through your use of the Website or when you contact us electronically and how we use that information.  Some of our Website’s functionality can be used without revealing any “Personal Information” (i.e., information that can be used to identify you); however, for features or services related to our online courses, such Personal Information is required.  If you do not use these specific features or services on the Website, then the only information we collect will be \"De-identified Information\" (i.e., information that cannot be used to identify you). De-identified Information includes information such as the web pages that you have viewed. In order to access certain features and benefits on our Website, you may need to submit Personal Information."
#define PP_SECTION_TWO_PARAGRAPH_TWO @"You are responsible for ensuring the accuracy of all Personal Information you submit to Health4TheWorld. Inaccurate information may affect your ability to use the Website, the information you receive when using the Website, and our ability to contact you."
#define PP_SECTION_THREE_HEADER @"What You Consent to by Using Our Website"
#define PP_SECTION_THREE_PARAGRAPH @"Please understand that by submitting any Personal Information to us, you consent and agree that we may collect, use and disclose such Personal Information in accordance with this Privacy Policy and our Terms, and as permitted or required by law. Participation in Forums and online classrooms on the Website requires the public release and dissemination of your information, and thus we cannot commit to treating such information confidentially in the same manner that other Personal Information will be treated under this Privacy Policy.  Participation in these features of the Website is voluntary and thus your consent to certain terms is required before participation is allowed.  If you do not agree with these terms, then please do not provide any Personal Information to us.  If you refuse or withdraw your consent, or if you choose not to provide us with any required Personal Information, we may not be able to provide you with the services that can be offered on our Website."
#define PP_SECTION_FOUR_HEADER @"What Information We Collect"
#define PP_SECTION_FOUR_PARAGRAPH_ONE @"We collect three types of information about users:  (1) \"Personal Information\" such as name, email address, IP address, geotag device data, social media account user name or ID , phone number and personal preferences, and other account-related information; (2) “De-identified Information” in which all personal and individually identifiable identifiers have been removed such as statistical information on health care services used in a particular geo-location and what web pages you visit;  and (3) \"Aggregate Information\" which is anonymous information about you that is used in a collective manner and which no single person or user can be identified by such compiled information, such as information about how many users log on to the Website on a daily basis."
#define PP_SECTION_FOUR_SUBHEADER_ONE @"De-identified Information."
#define PP_SECTION_FOUR_SUBHEADER_ONE_INFO @"When users come to our Website, we may track, collect and use De-identified Information in which all personal and individually identifiable identifiers have been removed.  Among other things, we may use De-identified Information to determine which pages of our Website were visited, the order in which they were visited, when they were visited, and which hyperlinks were \"clicked.\" We also collect information from the URLs from which you linked to our Website. Collecting such information may involve logging the IP address, operating system and browser software used by each user of the Website. Although such information is not Personal Information, we may be able to determine from an IP address a user’s Internet Service Provider and the geographic location of his or her point of connectivity."
#define PP_SECTION_FOUR_SUBHEADER_TWO @"Aggregate Information."
#define PP_SECTION_FOUR_SUBHEADER_TWO_INFO @"We also aggregate De-identified Information about users so that no single person or user can be identified.  We use such Aggregate Information to determine information such as what Website pages are most frequently accessed and the number of people logged into the Website on a particular day."
#define PP_SECTION_FOUR_SUBHEADER_THREE @"Personal Information."
#define PP_SECTION_FOUR_SUBHEADER_THREE_INFO @"We collect Personal Information that you provide to us when you register for an account, purchase products or services, complete a survey, sign-up for email updates or online courses, blog, donate, send us communications, and/or participate in online courses or other services on our Website. We may use the Personal Information that you provide to respond to your questions, provide you the specific course and/or services you select, send you updates about online courses offered by Health4TheWorld or other Health4TheWorld events, promotions by Health4TheWorld or our partners, and send you email messages about Website maintenance or updates.  We may also receive Personal Information when you access or log-in to a third party site, e.g., Facebook, from our Websites. This may include the text and/or images of your Personal Information available from a third party site.  By providing information using the Website, you further warrant to Health4TheWorld that your Personal Information is reliable for its intended uses, accurate, complete and correct, and that you will promptly notify us if such Personal Information is no longer current or correct.  Personal Information shall NOT include any information posted or sent by or to you in any Forum (such as a comment box on a particular blog or in our online classrooms or through social media accounts) on the Websites."
#define PP_SECTION_FOUR_SUBHEADER_FOUR @"Partners."
#define PP_SECTION_FOUR_SUBHEADER_FOUR_INFO @"Partner sites providing online course related tools and services to Health4TheWorld users may collect nonfinancial individual level user data regarding the individual’s use of that partner site while engaged with such online course related activities, and the partner sites may share that data with Health4TheWorld for the purpose of improving Health4TheWorld’s services, the partner site’s services, and the individual’s education experience. This data includes but is not limited to information such as the amount of time spent on the partner site and pages viewed."
#define PP_SECTION_FOUR_SUBHEADER_FIVE @"Third Party Credit Card Processing. "
#define PP_SECTION_FOUR_SUBHEADER_FIVE_INFO @"Health4TheWorld provides you with the ability to donate using a credit card through third party payment processing service providers. Please note that our service providers – not Health4TheWorld– collect and process your credit card information.  We make no representations or warranties about the acts or omissions of such third party payment processing service providers, including whether such parties will keep your information confidential.  Health4TheWorld shall not be liable for any misuse of such information by any third party payment processing service or otherwise."
#define PP_SECTION_FOUR_SUBHEADER_SIX @"Use of Cookies"
#define PP_SECTION_FOUR_SUBHEADER_SIX_INFO_ONE @"When you visit the Website, we may place one or more “cookies” on your computer.  Essentially, cookies are a user’s identification card for the Health4TheWorld servers.  They allow websites to store information such as user preferences, but do not collect Personal Information, only De-identified Information.  Cookies and web beacons allow Health4TheWorld to serve you better and more efficiently, and to personalize your experience at our Website.  From time to time we may also use cookies and/or web beacons to help us determine and identify repeat visitors, the type of content and sites to which a user of our Website links, the length of time each user spends at any particular area of our Website, to track the specific functionalities and content that users choose to use, to improve the Website’s content and conduct various other diagnostics to improve our services, and to analyze and improve Website security. Web beacons are small graphic files linked to our servers that allow us to track your use of our Website and related functionalities."
#define PP_SECTION_FOUR_SUBHEADER_SIX_INFO_TWO @"You should be able to control how and whether cookies will be accepted by your web browser. Most browsers offer instructions on how to reset the browser to reject cookies in the \"Help\" section of the toolbar.  If you reject our cookies, many functions and conveniences of this Website may not work properly."
// "How We Use the Information"
#define PP_SECTION_FIVE_HEADER @"How We Use the Information"
#define PP_SECTION_FIVE_PARAGRAPH_ONE @"The information Health4TheWorld collects is used to for multiple purposes as described below.  "
#define PP_SECTION_FIVE_SUBHEADER_ONE @"De-identified Information."
#define PP_SECTION_FIVE_SUBHEADER_ONE_INFO @"We use De-identified Information to build higher quality, more useful services by performing statistical analyses of the collective characteristics and behavior of our users, and by measuring demographics and interests regarding specific areas of our Website. We may also use it for other business purposes."
#define PP_SECTION_FIVE_SUBHEADER_TWO @"Aggregate Information."
#define PP_SECTION_FIVE_SUBHEADER_TWO_INFO @"We use aggregate, anonymous, non-personally identifiable information about you in a collective manner, so that no single person or user can be identified. We use such Aggregate information to determine information such as what Website pages are most frequently accessed and the number of people logged into the Website on a particular day.  We may also use it for other business purposes."
#define PP_SECTION_FIVE_SUBHEADER_THERE @"Personal Information."
#define PP_SECTION_FIVE_SUBHEADER_THREE_INFO @"Except as set forth in this Privacy Policy or as specifically agreed to by you, Health4TheWorld will not disclose any Personal Information we gather from you on the Website. In addition to the other uses set forth in this Privacy Policy, we may disclose and otherwise use Personal Information as described below. We may also use it for research and business purposes, including improving and customizing the Website and the products and services we offer. The Personal Information (including your email address) we collect is not sold to other organizations for commercial or marketing purposes."
#define PP_SECTION_FIVE_SUBHEADER_FOUR @"Updates."
#define PP_SECTION_FIVE_SUBHEADER_FOUR_INFO @"We use Personal Information collected when you sign-up for our various email or update services to send you the messages in connection with the Website or an online course. We may also archive this information and/or use it for future communications with you."
#define PP_SECTION_FIVE_SUBHEADER_FIVE @"Forums."
#define PP_SECTION_FIVE_SUBHEADER_FIVE_INFO @"Health4TheWorld may offer public forums from time to time (the \"Forums\") where you can share comments and thoughts. In order to participate in the Forums, you may be required to register with us and/or provide us with Personal Information such as your name and email address.  To facilitate your use of the Forums, we may also use De-identified Information and other non-Personal Information  collected during your use of the Forums for business purposes, and may publish this information via extensions of our platform that use third party services, like mobile applications and via social media applications. We also reserve the right to reuse Forum posts to enhance future course offerings. We may archive this information and/or use it for future communications with you and/or your designee(s), and/or provide it to the university or the instructor(s) associated with the courses you have taken. We may also use or publish posts submitted on the Forums without using Personal Information. Please keep in mind that information you post or make available in Forums will be publicly available. Accordingly, you should be careful when posting any personal or sensitive information."
#define PP_SECTION_FIVE_SUBHEADER_SIX @"Participation in online courses."
#define PP_SECTION_FIVE_SUBHEADER_SIX_INFO @"We use the Personal Information that we collect from you when you participate in an online course through the Website for processing purposes, including but not limited to tracking attendance, progress and completion of an online course. We may also share your Personal Information and your performance in a given online course with the instructor or instructors who taught the course, with teaching assistants or other individuals designated by the instructor or instructors to assist with the creation, modification or operation of the course, and with the institution or institutions with which they are affiliated. Also, we may archive this information and/or use it for future communications with you."
#define PP_SECTION_FIVE_SUBHEADER_SEVEN @"Communications with Us."
#define PP_SECTION_FIVE_SUBHEADER_SEVEN_INFO @"When you send us an email message or otherwise contact us, we may use the information provided by you to respond to your communication and/or as described in this Privacy Policy. We may also archive this information and/or use it for future communications with you."
#define PP_SECTION_FIVE_SUBHEADER_EIGHT @"Communications with Our Partners."
#define PP_SECTION_FIVE_SUBHEADER_EIGHT_INFO @"We may share your Personal Information with university partners and other business partners of Health4TheWorld so that university partners and other business partners may share information about their products and services that may be of interest to you."
#define PP_SECTION_FIVE_SUBHEADER_NINE @"Research."
#define PP_SECTION_FIVE_SUBHEADER_NINE_INFO @"We may share general course data (including quiz or assignment submissions, grades, and Forum discussions), information about your activity on our Website, and demographic data from surveys operated by us with our university partners and other business partners so that our university partners and other business partners may use the data for research related to online education."
#define PP_SECTION_FIVE_SUBHEADER_TEN @"Disclosure to Third Party Contractors. "
#define PP_SECTION_FIVE_SUBHEADER_TEN_INFO @"We use various third party service providers, vendors and contractors (collectively, \"Contractors\") to assist us in providing our products and services to you. Our Contractors may have limited access to your Personal Information in the course of providing their products or services to us, so that we in turn can provide our products and services to you. These Contractors may include vendors and suppliers that provide us with technology, services, and/or content related to the operation and maintenance of the Website or the online courses. Access to your Personal Information by these Contractors is limited to the information reasonably necessary for the Contractor to perform its limited function for us. We make no representations or warranties about the acts or omissions of such Contractors, including whether such parties will keep such information confidential.  When you contact Health4TheWorld and provide information to us pursuant to your use of the Website, you do so at your own risk, and Health4TheWorld shall not be liable for any misuse of such information by any third party or Contractor."
#define PP_SECTION_FIVE_SUBHEADER_ELEVEN @"Government Authorities, Legal Rights and Actions."
#define PP_SECTION_FIVE_SUBHEADER_ELEVEN_INFO @"Health4TheWorld may share your Personal Information with various government authorities in response to subpoenas, court orders, or other legal process; to establish or exercise our legal rights or to protect our property; to defend against legal claims; or as otherwise required by law. In such cases we reserve the right to raise or waive any legal objection or right available to us. We also may share your Personal Information when we believe it is appropriate to investigate, prevent, or take action regarding illegal or suspected illegal activities; to protect and defend the rights, property, or safety of Health4TheWorld, the Website, our users, customers, or others; and in connection with verifying or enforcing compliance with our Terms and other agreements."
#define PP_SECTION_FIVE_SUBHEADER_TWELVE @"Disclosure to Acquirers."
#define PP_SECTION_FIVE_SUBHEADER_TWELVE_INFO @"Health4TheWorld may disclose and/or transfer your Personal Information to an acquirer, assignee or other successor entity in connection with a sale, merger, or reorganization of all or substantially all of the equity, business or assets of Health4TheWorld to which your Personal Information relates."
#define PP_SECTION_FIVE_SUBHEADER_THIRTEEN @"e-Readers."
#define PP_SECTION_FIVE_SUBHEADER_THIRTEEN_INFO @"If we receive any Personal Information related to the extent to which you use designated e-Readers to access Health4TheWorld materials, we may archive it, and use it for research, business, or other purposes."
// "External Links"
#define PP_SECTION_SIX_HEADER @"External Links"
#define PP_SECTION_SIX_PARAGRAPH @"For your convenience we may provide links to sites operated by organizations other than Health4TheWorld (\"Third Party Websites\") that we believe may be of interest to you. We do not disclose your Personal Information to these Third Party Websites without obtaining your consent. We do not endorse and are not responsible for the privacy practices of these Third Party Websites. The policies and procedures we describe here do not apply to Third Party websites, and Health4TheWorld expressly disclaims any and all liability related to the use of any Third Party Websites.  If you choose to click on a link to one of these Third Party Websites, you should review the privacy policy posted on the other site to understand how that Third Party Website collects and uses your Personal Information."
// "Confidentiality & Security of Personal Information"
#define PP_SECTION_SEVEN_HEADER @"Confidentiality & Security of Personal Information"
#define PP_SECTION_SEVEN_PARAGRAPH @"importance. We will use industry standard physical, technical and administrative security measures to keep your Personal Information confidential and secure and will not share it with third parties, except as otherwise provided in this Privacy Policy, or unless we have good faith belief that such disclosure is necessary in special cases, such as a physical threat to you or others. Because the Internet is not a 100% secure environment we cannot guarantee the security of Personal Information, and there is some risk that an unauthorized third party may find a way to circumvent our security systems or that transmission of your information over the Internet will be intercepted. Accordingly, neither Health4TheWorld, nor its partners, nor any of their respective employees, officers or agents or the provider of the internet services on behalf of Health4TheWorld or the creator of the Website (nor any other person involving the management or establishment of the Website or otherwise involved in respect of the Website) can give any representation or warranty as to the absolute security of the data transmitted using the Website, and cannot give any guarantee that such data will not be compromised by bad actors.  It is your responsibility to protect the security of your login information. Please note that e-mails and other communications you send to us through our Website are not encrypted.  If you choose to provide data to or allow collection of data by Health4TheWorld or any of our partners or any of their respective officers, directors or employees or agents through use of the Website, then you do so understanding your own risks. If you choose to visit the Website, your visit and any dispute over privacy is subject to the Website Terms, including this Privacy Policy."
// "Updating or Deleting Your Personal Information"
#define PP_SECTION_EIGHT_HEADER @"Updating or Deleting Your Personal Information"
#define PP_SECTION_EIGHT_PARAGRAPH_ONE @"You can access your Personal Information and confirm that it remains correct and up-to-date or choose whether or not you wish to receive material from us or some of our partners by logging into the Website and visiting your user account page. You may also contact us via contact@Health4TheWorld.org. We try to answer every email promptly, but may not always be able to do so. Keep in mind, however, that there will be residual information that will remain within our databases, access logs and other records, which may or may not contain your Personal Information."
#define PP_SECTION_EIGHT_PARAGRAPH_TWO @"If you have any privacy-related questions, unresolved problems, or complaints you may contact us via contact@health4theworld.org"
// "California Privacy Rights"
#define PP_SECTION_NINE_HEADER @"California Privacy Rights"
#define PP_SECTION_NINE_PARAGRAPH_ONE @"Under California’s \"Shine the Light\" law, California residents who provide personal information in obtaining products or services for personal, family or household use are entitled to request and obtain from us once a calendar year information about the customer information we shared, if any, with other businesses for their own direct marketing uses. If applicable, this information would include the categories of customer information and the names and addresses of those businesses with which we shared customer information for the immediately prior calendar year (e.g. requests made in 2012 will receive information regarding 2011 sharing activities)."
#define PP_SECTION_NINE_PARAGRAPH_TWO @"To obtain this information, please send an email message to contact@health4theworld.org with \"Request for California Privacy Information\" on the subject line and in the body of your message. We will provide the requested information to you at your e-mail address in response. Please be aware that not all information sharing is covered by the \"Shine the Light\" requirements and only information on covered sharing will be included in our response."
// "International Privacy Practices"
#define PP_SECTION_TEN_HEADER @"International Privacy Practices"
#define PP_SECTION_TEN_PARAGRAPH @"Health4TheWorld Websites are primarily operated and managed on servers located and operated within the United States. In order to provide our products and services to you, we may send and store your Personal Information (outside of the country where you reside or are located, including to the United States. Accordingly, if you reside or are located outside of the United States, your personal information may be transferred outside of the country where you reside or are located, including to countries that may not or do not provide the same level of protection for your personal information. We are committed to protecting the privacy and confidentiality of personal information when it is transferred. If you reside or are located within the European Economic Area and such transfers occur, we take appropriate steps to provide the same level of protection for the processing carried out in any such countries as you would have within the European Economic Area to the extent feasible under applicable law. By using and accessing our products and services, users who reside or are located in countries outside of the United States agree and consent to the transfer to and processing of personal information on servers located outside of the country where they reside, and that the protection of such information may be different than required under the laws of their residence or location."
// "Changing Our Privacy Policy"
#define PP_SECTION_ELEVEN_HEADER @"Changing Our Privacy Policy"
#define PP_SECTION_ELEVEN_PARAGRAPH @"Please note that we review our privacy practices from time to time, and that these practices are subject to change. We expressly reserve the right to modify the terms of this Privacy Policy at any time and in our reasonable discretion.   Any change, update, or modification will be effective immediately upon posting on our Website. We will notify you of any material change to this Privacy Policy by posting a notice on our Website’s homepage for a reasonable period of time following such update, and by changing the effective date (located at the bottom of this page). Be sure to return to this page periodically to ensure familiarity with the most current version of this Privacy Policy. Your continued use of the Website following our posting of a change notice will constitute binding acceptance of this Privacy Policy and all changes thereto. "
// "No Information from Children Under 13"
#define PP_SECTION_TWELVE_HEADER @"No Information from Children Under 13"
#define PP_SECTION_TWELVE_PARAGRAPH @"Health4TheWorld strongly believes in protecting the privacy of children. In line with this belief, we do not knowingly collect or maintain Personal Information on our Website from persons under 13 years of age, and no part of our Website is directed to persons under 13 years of age. If you are under 13 years of age, then please do not use or access this Website at any time or in any manner. We will take appropriate steps to delete any Personal Information of persons less than 13 years of age that has been collected on our Website without verified parental consent upon learning of the existence of such Personal Information."
@end
