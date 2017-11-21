//
//  NSBundle+RunTimeLanguage.h
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 10/20/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef USE_LOCALIZATION

@interface NSBundle (Language)

+ (void)setLanguage:(NSString *)language;

@end

#endif

