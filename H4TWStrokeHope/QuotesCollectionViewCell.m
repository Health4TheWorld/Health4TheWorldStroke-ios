//
//  QuotesCollectionViewCell.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "QuotesCollectionViewCell.h"

@implementation QuotesCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupView];
}

-(void) setupView{
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.layer.masksToBounds =true;
    [self addSubview:self.imageView];
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //add constraints for profile image
    NSDictionary *views = @{ @"imageView" : self.imageView };
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[imageView]|" options:0 metrics:nil views: views]];
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[imageView]|" options:0 metrics:nil views: views]];
}

@end
