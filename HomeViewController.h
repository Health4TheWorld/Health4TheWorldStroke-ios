//
//  HomeViewController.h
//  H4TWStrokeHope
//
//  Created by Rachel on 3/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MessageUI.h>

@interface HomeViewController : UIViewController<MFMailComposeViewControllerDelegate>
// Smiley icons 
@property (nonnull, retain) UIButton *chatbotsmiley1;
@property (nonnull, retain) UIButton *chatbotsmiley2;
@property (nonnull, retain) UIButton *chatbotsmiley3;
@property (nonnull, retain) UIButton *chatbotsmiley4;
@property (nonnull, retain) UIButton *chatbotsmiley5;

@end
