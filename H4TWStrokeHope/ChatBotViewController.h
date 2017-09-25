//
//  ChatBotViewController.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/1/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatMessages.h"
#import <ApiAI/ApiAI.h>
#import <AVFoundation/AVFoundation.h>

@interface ChatBotViewController : UICollectionViewController <UITextFieldDelegate , UICollectionViewDelegateFlowLayout>
@property (nonnull,retain) UIButton *sendButton;
@property (nonnull, retain) UITextField *textField;
@property (nonnull, retain) UIView *containerView;
@property (nonnull) ChatMessages *message;
@property (nonnull, retain) NSLayoutConstraint *bottomConstraint;
@property (nonnull, retain) NSLayoutConstraint *heightConstraint;
@property (nonnull) ApiAI *apiai;
// Temporary buttons
//Yes or NO
@property (nonnull,retain) UIButton *yesButton;
@property (nonnull,retain) UIButton *noButton;
// Lonely Options
@property (nonnull, retain) UIButton *lonelyOption1;
@property (nonnull, retain) UIButton *lonelyOption2;
@property (nonnull, retain) UIButton *lonelyOption3;
@property (nonnull, retain) UIButton *lonelyOption4;
@property (nonnull, retain) UIButton *lonelyOption5;
@property (nonnull, retain) UIButton *exitButton;
// Welcome Icons
@property (nonnull, retain) UIButton *icon1;
@property (nonnull, retain) UIButton *icon2;
@property (nonnull, retain) UIButton *icon3;
@property (nonnull, retain) UIButton *icon4;
@property (nonnull, retain) UIButton *icon5;
@property (nonnull, retain) UIButton *feelingOption1;
@property (nonnull, retain) UIButton *feelingOption2;
@property (nonnull, retain) UIButton *feelingOption3;
@property (nonnull, retain) UIButton *feelingOption4;
@property (nonnull, retain) UIButton *feelingOption5;
@property (nonnull, retain) UIButton *feelingOption6;

// Icon Button action methods
- (void) icon1ButtonPressed;
- (void) icon2ButtonPressed;
- (void) icon3ButtonPressed;
- (void) icon4ButtonPressed;
- (void) icon5ButtonPressed;

// initial Text Message
@property (nonnull, retain) NSString *welcomeText;

// AV Speech
@property (strong,nonatomic) AVSpeechUtterance * _Nullable utterance;
@property (strong,nonatomic) AVSpeechSynthesizer * _Nullable synthesizer;

@end
