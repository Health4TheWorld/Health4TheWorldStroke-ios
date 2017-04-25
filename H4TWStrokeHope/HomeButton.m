//
//  HomeButton.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HomeButton.h"
#import "Constants.h"

@implementation HomeButton

- (id)initWithText:(NSString *)text withFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6;
        self.clipsToBounds = YES;
        [self setBackgroundColor:HFTW_PRIMARY];
        UIFont *labelFont = [UIFont fontWithName:@"Lato-regular" size:18.0];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, 10, 0, 0)];
        label.font = labelFont;
        label.textColor = [UIColor whiteColor];
        label.text = text;
        [label sizeToFit];
        [self addSubview:label];
    }
    return self;
}

- (void)addImageBottomRight:(UIImage *)image {
    float imgWidth, imgHeight;
    if (image.size.width > image.size.height) {
        /* If the image is wider than it is tall, then set the width to be this button's width - 30 and scale the height proportionally. */
        imgWidth = self.frame.size.width - 30;
        imgHeight = (image.size.height * imgWidth) / (image.size.width);
    } else {
        /* If the image is taller than it is wide, then set the height to be this button's width - 30 and scale the height proportionally. */
        imgHeight = self.frame.size.height - 30;
        imgWidth = (image.size.width * imgHeight) / (image.size.height);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - imgWidth, self.frame.size.height - imgHeight, imgWidth, imgHeight)];
    [imgView setImage:image];
    [self addSubview:imgView];
}

- (void)addImageTopRight:(UIImage *)image {
    float imgWidth, imgHeight;
    if (image.size.width > image.size.height) {
        /* If the image is wider than it is tall, then set the width to be this button's width - 30 and scale the height proportionally. */
        imgWidth = self.frame.size.width - 30;
        imgHeight = (image.size.height * imgWidth) / (image.size.width);
    } else {
        /* If the image is taller than it is wide, then set the height to be this button's width - 30 and scale the height proportionally. */
        imgHeight = self.frame.size.height - 30;
        imgWidth = (image.size.width * imgHeight) / (image.size.height);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - imgWidth, 0, imgWidth, imgHeight)];
    [imgView setImage:image];
    [self addSubview:imgView];
}

- (void)addImageRightCenter:(UIImage *)image {
    float imgWidth, imgHeight;
    if (image.size.width > image.size.height) {
        /* If the image is wider than it is tall, then set the width to be this button's width - 30 and scale the height proportionally. */
        imgWidth = self.frame.size.width - 30;
        imgHeight = (image.size.height * imgWidth) / (image.size.width);
    } else {
        /* If the image is taller than it is wide, then set the height to be this button's width - 30 and scale the height proportionally. */
        imgHeight = self.frame.size.height - 30;
        imgWidth = (image.size.width * imgHeight) / (image.size.height);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - imgWidth, self.frame.size.height - imgHeight, imgWidth, imgHeight)];
    [imgView setImage:image];
    /* Set center to be center of this button, just so we get the y centered. */
    imgView.center = self.center;
    CGRect imgViewFrame = imgView.frame;
    /* Now adjust the x origin to where it needs to be, keeping the y centered. */
    imgViewFrame.origin.x = self.frame.size.width - imgWidth;
    imgView.frame = imgViewFrame;
    [self addSubview:imgView];
}

- (void)addImageCentered:(UIImage *)image {
    float imgWidth, imgHeight;
    if (image.size.width > image.size.height) {
        /* If the image is wider than it is tall, then set the width to be this button's width - 30 and scale the height proportionally. */
        imgWidth = self.frame.size.width - 60;
        imgHeight = (image.size.height * imgWidth) / (image.size.width);
    } else {
        /* If the image is taller than it is wide, then set the height to be this button's width - 30 and scale the height proportionally. */
        imgHeight = self.frame.size.height - 60;
        imgWidth = (image.size.width * imgHeight) / (image.size.height);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgWidth, imgHeight)];
    [imgView setImage:image];
    CGRect frame = imgView.frame;
    frame.origin.x = (self.frame.size.width / 2.0) - (imgView.frame.size.width / 2.0);
    frame.origin.y = (self.frame.size.height / 2.0) - (imgView.frame.size.height / 2.0) + 15;
    imgView.frame = frame;
    [self addSubview:imgView];
}

- (void)addImageFullSize:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)addCoordinationImage:(UIImage *)image {
    float imgWidth, imgHeight;
    if (image.size.width > image.size.height) {
        /* If the image is wider than it is tall, then set the width to be this button's width - 30 and scale the height proportionally. */
        imgWidth = self.frame.size.width - 180;
        imgHeight = (image.size.height * imgWidth) / (image.size.width);
    } else {
        /* If the image is taller than it is wide, then set the height to be this button's width - 30 and scale the height proportionally. */
        imgHeight = self.frame.size.height - 180;
        imgWidth = (image.size.width * imgHeight) / (image.size.height);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - imgWidth - 20, self.frame.size.height - imgHeight, imgWidth, imgHeight)];
    [imgView setImage:image];
    [self addSubview:imgView];
}

@end
