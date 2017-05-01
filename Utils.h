//
//  Utils.h
//  H4TWStrokeHope
//
//  Created by Rachel on 3/17/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject
/* Returns the height of the given string when contained to the given width. Useful for figuring out how many lines a certain label takes
 Example:
 CGFloat unitHeight = [GraphicUtils heightOfString:@"A" containedToWidth:width withFont:descFont];
 CGFloat descriptionHeight = [GraphicUtils heightOfString:someString containedToWidth:width withFont:someFont];
 NSInteger numberOfLines = ceilf(descriptionHeight / unitHeight);
 */
+ (CGFloat)heightOfString:(NSString *)string containedToWidth:(CGFloat)width withFont:(UIFont *)font;
+ (CGFloat)heightOfAttributedString:(NSAttributedString *)attrStr containedToWidth:(CGFloat)width withFont:(UIFont *)font;
+ (NSInteger)numberOfLinesForString:(NSString *)str constrainedToWidth:(float)width withFont:(UIFont *)font;
@end
