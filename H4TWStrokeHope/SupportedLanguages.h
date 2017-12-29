//
//  SupportedLanguages.h
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 10/19/17.
//  Copyright © 2017 Rachel. All rights reserved.
//
#define USE_ON_FLY_LOCALIZATION

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ELanguage)
{
    ELanguageEnglish,
    ELanguageSpanish,
    ELanguageFrench,
    ELanguageNepali,
    ELanguagePhilippines,
    ELanguageChinese,
    ELanguageSwahili,
    ELanguageCount
};

@interface SupportedLanguages : NSObject

+ (void)setupCurrentLanguage;
+ (NSArray *)languageStrings;
+ (NSString *)currentLanguageString;
+ (NSString *)currentLanguageCode;
+ (NSInteger)currentLanguageIndex;
+ (void)saveLanguageByIndex:(NSInteger)index;
+ (BOOL)isCurrentLanguageRTL;

@end
