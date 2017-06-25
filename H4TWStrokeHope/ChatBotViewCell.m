//
//  ChatBotViewCell.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/8/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "ChatBotViewCell.h"

#define CHAT_BUBBLE_LEFT @"bubble_left"
#define CHAT_BUBBLE_RIGHT @"bubble_right"
@implementation ChatBotViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setUpCell];
}

- (void) setUpCell {
    // Set up message view
    self.messageView = [[UITextView alloc] init];
    self.messageView.backgroundColor = [UIColor clearColor];
    self.messageView.font = [UIFont systemFontOfSize:14];
    self.messageView.textColor = [UIColor blackColor];
    self.messageView.editable = false;
    
    // Set up bubble View
    self.bubbleView = [[UIView alloc] init];
    self.bubbleView.layer.cornerRadius = 15;
    self.bubbleView.layer.masksToBounds = true;
    
    
    //Setting up chat bubble images
    self.rightChatBubble = [[[UIImage imageNamed: CHAT_BUBBLE_RIGHT] resizableImageWithCapInsets: UIEdgeInsetsMake(22, 26, 22, 26) ] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    //self.rightChatBubble = [UIImage imageNamed: CHAT_BUBBLE_RIGHT];
    
    self.leftChatBubble = [[[UIImage imageNamed: CHAT_BUBBLE_LEFT] resizableImageWithCapInsets: UIEdgeInsetsMake(22, 26, 22, 26)] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    self.leftChatBubble = [UIImage imageNamed: CHAT_BUBBLE_LEFT];
    
    // Set up chat bubble view
    self.chatBubbleView = [[UIImageView alloc] init];
    self.chatBubbleView.image = self.leftChatBubble;
    self.chatBubbleView.tintColor = [UIColor colorWithWhite:0.90 alpha:1];
    self.chatBubbleView.layer.masksToBounds = true;

    
    //Set up profile image view
    self.profileImage = [[UIImageView alloc] init];
    self.profileImage.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImage.layer.cornerRadius = 15;
    self.profileImage.layer.masksToBounds =true;
    
    [self addSubview: self.bubbleView];
    [self addSubview: self.messageView];
    [self addSubview: self.profileImage];
    
    self.profileImage.translatesAutoresizingMaskIntoConstraints = NO;
 
    
    //add constraints for profile image
    NSDictionary *views = @{ @"profileImage" : self.profileImage };
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-8-[profileImage(30)]" options:0 metrics:nil views: views]];
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[profileImage(30)]|" options:0 metrics:nil views: views]];
    
    [self.bubbleView addSubview:self.chatBubbleView];
    self.chatBubbleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // add constraints for chat bubble view
    NSDictionary *view = @{ @"chatBubbleView" : self.chatBubbleView };
    [self.bubbleView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[chatBubbleView]|" options:0 metrics:nil views: view]];
    [self.bubbleView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[chatBubbleView]|" options:0 metrics:nil views: view]];
    
    
}

@end
