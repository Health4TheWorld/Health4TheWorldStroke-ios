//
//  LearnContent.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/14/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define CONTENT_TYPE_BLOOD_PRESSURE @"Blood Pressure"
#define CONTENT_TYPE_BLOOD_SUGAR @"Blood Sugar"
#define CONTENT_TYPE_HEART_RATE @"Heart Rate"

/* Content dictionary  keys & values */
#define TEXT_TYPE_KEY @"TextType" // key
#define TEXT_TYPE_HEADER @"Header" // value
#define TEXT_TYPE_PARAGRAPH @"Paragraph" // value
#define TEXT_TYPE_BULLETS @"BulletPoints" // value

#define TEXT_KEY @"Text"


/*
 * LearnContent Data Model
 * ------------------------
 * Contains all the data for a learn content section (e.g. "Blood Pressure"): 
 * the title, the headers, the paragraphs, the background color, and any images.
 *
 */

@interface LearnContent : NSObject
@property NSString *contentTitle;
@property UIColor *contentBGColor;
@property UIColor *textColor;
@property NSMutableArray *content; /* Array of dictionaries in the "problem" section */
@property NSArray *images;
@property NSString *backButtonImageStr; /* Name of image for back button */

/* Given a title, returns the LearnContent object containing all the information for that section. */
- (id)initWithContentTitle:(NSString *)title;
@end
