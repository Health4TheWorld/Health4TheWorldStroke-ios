//
//  main.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/15/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "LanguageManager.h"
#import "Defines.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [LanguageManager setupCurrentLanguage];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
