//
//  ChatBotViewCell.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/8/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatBotViewCell : UICollectionViewCell
@property (strong, nonatomic) UITextView *messageView;
@property (strong ,nonatomic) UIView *bubbleView;
@property (strong, nonatomic) UIImageView *profileImage;
@property (strong, nonatomic) UIImageView *chatBubbleView;
@property (strong, nonatomic) UIImage *rightChatBubble;
@property (strong, nonatomic) UIImage *leftChatBubble;
@end
