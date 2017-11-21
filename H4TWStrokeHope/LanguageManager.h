//
//  LanguageManager.h
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 10/26/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ELanguage)
{
    ELanguageEnglish,
    ELanguageEspañol,
    ELanguageFrançais,
    ELanguageFilipino,
    ELanguagechinese,
    ELanguageNepali,
    ELanguageKiswahili,
    ELanguageCount
};
@interface LanguageManager : NSObject

+ (void)setupCurrentLanguage;
+ (NSArray *)languageStrings;
+ (NSString *)currentLanguageString;
+ (NSString *)currentLanguageCode;
+ (NSInteger)currentLanguageIndex;
+ (void)saveLanguageByIndex:(NSInteger)index;

@end

