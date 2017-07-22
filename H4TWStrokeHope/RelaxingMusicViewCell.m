//
//  RelaxingMusicViewCell.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 7/20/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "RelaxingMusicViewCell.h"

@implementation RelaxingMusicViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupView];
}

-(void) setupView {
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.layer.masksToBounds =true;
    [self addSubview:self.imageView];
    
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.label = [[UILabel alloc] init];
    self.label.layer.masksToBounds =true;
    UIFont *labelFont = [UIFont fontWithName:@"Lato-regular" size:15.0];
    self.label.font = labelFont;
    [self addSubview:self.label];
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //add constraints for profile image
    NSDictionary *views = @{ @"imageView" : self.imageView, @"label" : self.label };
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[imageView]|" options:0 metrics:nil views: views]];
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[imageView]-2-[label(30)]|" options:0 metrics:nil views: views]];
     [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[label]|" options:0 metrics:nil views: views]];
    
}

@end
