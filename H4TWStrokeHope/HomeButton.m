//
//  HomeButton.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HomeButton.h"
#import "Constants.h"
#import "Utils.h"

@implementation HomeButton

- (id)initWithText:(NSString *)text withFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6;
        self.clipsToBounds = YES;
        [self setBackgroundColor:HFTW_PRIMARY];
        UIFont *labelFont = [UIFont fontWithName:@"Lato-regular" size:18.0];
        self.myTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 10, 0, 0)];
        self.myTitleLabel.font = labelFont;
        self.myTitleLabel.textColor = [UIColor whiteColor];
        self.myTitleLabel.text = text;
        self.myTitleLabel.numberOfLines = 0;
        self.myTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.myTitleLabel sizeToFit];
        
        CGFloat heightForLabel = [Utils heightOfString:text containedToWidth:(self.frame.size.width  - 24) withFont:self.myTitleLabel.font];
        CGRect myTitleFrame = self.myTitleLabel.frame;
        myTitleFrame.size.width = self.frame.size.width  - 24;
        myTitleFrame.size.height = heightForLabel;
        self.myTitleLabel.frame = myTitleFrame;
        
        [self addSubview:self.myTitleLabel];
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
    [self bringSubviewToFront:self.myTitleLabel];
}

- (void)addImageBottomLeft:(UIImage *)image {
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
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, imgWidth/2 - 10, imgHeight/2)];
    [imgView setImage:image];
    [self addSubview:imgView];
    [self bringSubviewToFront:self.myTitleLabel];
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
    [self bringSubviewToFront:self.myTitleLabel];
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
    [self bringSubviewToFront:self.myTitleLabel];
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
    [self bringSubviewToFront:self.myTitleLabel];
}

- (void)addRoundImageCentered:(UIImage *)image {
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
    //imgView.layer.cornerRadius = imgView.frame.size.width / 2;
    //imgView.clipsToBounds = YES;
    imgView.layer.borderWidth = 3.0f;
    imgView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:imgView];
    [self bringSubviewToFront:self.myTitleLabel];
}

- (void)addSquaredImageCentered:(UIImage *)image withSize: (float) size{
    float imgWidth, imgHeight;
    if (image.size.width > image.size.height) {
        /* If the image is wider than it is tall, then set the width to be this button's width - 30 and scale the height proportionally. */
        imgWidth = self.frame.size.width - size;
        imgHeight = (image.size.height * imgWidth) / (image.size.width);
    } else {
        /* If the image is taller than it is wide, then set the height to be this button's width - 30 and scale the height proportionally. */
        imgHeight = self.frame.size.height - size;
        imgWidth = (image.size.width * imgHeight) / (image.size.height);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgWidth, imgHeight)];
    [imgView setImage:image];
    CGRect frame = imgView.frame;
    frame.origin.x = (self.frame.size.width / 2.0) - (imgView.frame.size.width / 2.0);
    frame.origin.y = (self.frame.size.height / 2.0) - (imgView.frame.size.height / 2.0) + 15;
    imgView.frame = frame;
    //imgView.layer.cornerRadius = imgView.frame.size.width / 2;
    //imgView.clipsToBounds = YES;
    imgView.layer.borderWidth = 3.0f;
    imgView.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:imgView];
    [self bringSubviewToFront:self.myTitleLabel];
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
    [self bringSubviewToFront:self.myTitleLabel];
}

@end
