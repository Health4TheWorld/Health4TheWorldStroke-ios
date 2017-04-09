//
//  HelpMeSpeakViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/4/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HelpMeSpeakViewController.h"
#import "Constants.h"
#import "Utils.h"

@interface HelpMeSpeakViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIView *searchUnderBar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchUnderBarLeading;
@end

#define SEARCH_UNDERBAR_LEADING_CONSTRAINT 26

@implementation HelpMeSpeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HELP ME SPEAK";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    /* Dismiss keyboard */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.delegate = self;
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    
    [self setUpColors];
}

- (void)setUpColors {
    [self.searchButton setTintColor:HFTW_LIGHT_GRAY];
    [self.searchUnderBar setBackgroundColor:HFTW_LIGHT_GRAY];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – UITextField Delegate

/* Called when the user starts typing. Sets the text to reddish/pink, and animates the bottom bar. */
-(void)goIntoSearchMode {
    self.searchTextField.textColor = HFTW_ACCENT;
    [self.view layoutIfNeeded];
    self.searchUnderBarLeading.constant = 0;
    [UIView animateWithDuration:0.3
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         // completion
                     }
     ];
}

/* Animates the bottom bar back to how it was before. */
-(void)exitSearchMode {
    [self.view layoutIfNeeded];
    self.searchUnderBarLeading.constant = SEARCH_UNDERBAR_LEADING_CONSTRAINT;
    [UIView animateWithDuration:0.3
                          delay: 0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         // completion
                     }
     ];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self goIntoSearchMode];
}


- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    if (textField == self.searchTextField) {
        if (newLength == 0) {
            // set the right image to be a search icon
            [self.searchButton setImage:[UIImage imageNamed:SEARCH_ICON] forState:UIControlStateNormal];
            self.searchButton.enabled = NO;
        } else {
            // set the right image to be a clear button
            [self.searchButton setImage:[UIImage imageNamed:X_ICON] forState:UIControlStateNormal];
            self.searchButton.enabled = YES;
        }
    }
    return YES;
}

- (IBAction)clearButtonPressed:(id)sender {
    self.searchTextField.text = @"";
    [self.searchButton setImage:[UIImage imageNamed:SEARCH_ICON] forState:UIControlStateNormal];
    self.searchButton.enabled = NO;
    [self exitSearchMode];
}

#pragma mark - UITextField Methods

- (void)dismissKeyboard {
    [self.searchTextField resignFirstResponder];
    [self exitSearchMode];
}

#pragma mark – Collection View delegate and data source



@end
