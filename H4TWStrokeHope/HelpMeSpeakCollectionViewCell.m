//
//  HelpMeSpeakCollectionViewCell.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/9/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HelpMeSpeakCollectionViewCell.h"
#import "Constants.h"

@implementation HelpMeSpeakCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

/* Lays out a cell with the given text. */
- (void)layoutCellWithWord:(NSString *)word withImage:(UIImage *)image {
    self.label.text = word;
    self.label.textColor = HFTW_ACCENT;
    
    /* Image */
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        [imageView setImage:image];
        [self addSubview:imageView];
    }
}

@end
