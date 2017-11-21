//
//  LanguageManager.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 10/26/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LanguageManager.h"
#import "NSBundle+Language.h"

static NSString * const LanguageCodes[] = { @"en", @"es-MX", @"fr", @"fil-PH",@"zh-Hans",@"ne-NP",@"sw" };
static NSString * const LanguageStrings[] = { @"English", @"Español", @"Français", @"Filipino",@"汉语/漢語",@"नेपाली", @"Kiswahili" };
static NSString * const LanguageSaveKey = @"currentLanguageKey";

@implementation LanguageManager

+ (void)setupCurrentLanguage
{
    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
    if (!currentLanguage) {
        NSArray *languages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        if (languages.count > 0) {
            currentLanguage = languages[0];
            [[NSUserDefaults standardUserDefaults] setObject:currentLanguage forKey:LanguageSaveKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
#ifndef USE_LOCALIZATION
    [[NSUserDefaults standardUserDefaults] setObject:@[currentLanguage] forKey:@"AppleLangua ges"];
    [[NSUserDefaults standardUserDefaults] synchronize];
#else
    [NSBundle setLanguage:currentLanguage];
#endif
}

+ (NSArray *)languageStrings
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        [array addObject:NSLocalizedString(LanguageStrings[i], @"")];
    }
    return [array copy];
}

+ (NSString *)currentLanguageString
{
    NSString *string = @"";
    NSString *currentCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        if ([currentCode isEqualToString:LanguageCodes[i]]) {
            string = NSLocalizedString(LanguageStrings[i], @"");
            break;
        }
    }
    return string;
}

+ (NSString *)currentLanguageCode
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
}

+ (NSInteger)currentLanguageIndex
{
    NSInteger index = 0;
    NSString *currentCode = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageSaveKey];
    for (NSInteger i = 0; i < ELanguageCount; ++i) {
        if ([currentCode isEqualToString:LanguageCodes[i]]) {
            index = i;
            break;
        }
    }
    return index;
}

+ (void)saveLanguageByIndex:(NSInteger)index
{
    if (index >= 0 && index < ELanguageCount) {
        NSString *code = LanguageCodes[index];
        [[NSUserDefaults standardUserDefaults] setObject:code forKey:LanguageSaveKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [NSBundle setLanguage:code];
#ifdef USE_LOCALIZATION
        [NSBundle setLanguage:code];
#endif
    }
}
@end

