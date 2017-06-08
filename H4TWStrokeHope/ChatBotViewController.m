//
//  ChatBotViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/1/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "ChatBotViewController.h"
#import "Utils.h"
#import "Constants.h"
#import <ApiAI/ApiAI.h>

@interface ChatBotViewController ()
@property (nonatomic,retain) UIButton *sendButton;
@property (nonatomic, retain) UITextField *textField;
@end

@implementation ChatBotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Home.chatBot", nil) uppercaseString];
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    //self.view.backgroundColor = UIColor.whiteColor;
    self.collectionView.backgroundColor = UIColor.whiteColor;
    
    [self setUpView];
}

- (void)setUpView {
    // Create text box to enter and send button to print the message on screen
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = UIColor.whiteColor;
    containerView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:containerView];
    
    //Adding constraints to fix the container view at the bottom of the screen - constaint anchors - x,y,w,h
    [containerView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor].active = true;
    [containerView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor].active = true;
    [containerView.widthAnchor constraintEqualToAnchor: self.view.widthAnchor].active = true;
    [containerView.heightAnchor constraintEqualToConstant: 50].active = true;
    
    // Adding button to container view
    self.sendButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.sendButton setTitle: @"Send" forState:UIControlStateNormal];
    [self.sendButton addTarget:self action:@selector(sendButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.sendButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [containerView addSubview:self.sendButton];
    
    //Add constraints - x,y,w,h
    [self.sendButton.rightAnchor constraintEqualToAnchor: containerView.rightAnchor].active =true;
    [self.sendButton.centerYAnchor constraintEqualToAnchor: containerView.centerYAnchor].active = true;
    [self.sendButton.widthAnchor constraintEqualToConstant: 80].active = true;
    [self.sendButton.heightAnchor constraintEqualToAnchor: containerView.heightAnchor].active = true;
    
    //Add text field
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"Enter message...";
    self.textField.translatesAutoresizingMaskIntoConstraints = false;
    
    [containerView addSubview: self.textField];
    
    //Add constraints - x,y,w,h
    [self.textField.leftAnchor constraintEqualToAnchor: containerView.leftAnchor constant: 8].active = true;
    [self.textField.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor].active = true;
    [self.textField.rightAnchor constraintEqualToAnchor: self.sendButton.leftAnchor].active = true;
    [self.textField.heightAnchor constraintEqualToAnchor: containerView.heightAnchor].active = true;
    
    //Separator line view
    UIView *separtorLine = [[UIView alloc] init];
    separtorLine.backgroundColor = HFTW_LIGHT_GRAY;
    separtorLine.translatesAutoresizingMaskIntoConstraints = false;
    
    [containerView addSubview: separtorLine];
    
    // Add constratins - x,y,w,h
    [separtorLine.leftAnchor constraintEqualToAnchor:containerView.leftAnchor].active = true;
    [separtorLine.topAnchor constraintEqualToAnchor: containerView.topAnchor].active = true;
    [separtorLine.widthAnchor constraintEqualToAnchor: containerView.widthAnchor].active = true;
    [separtorLine.heightAnchor constraintEqualToConstant: 1].active = true;
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

//Action listeners
- (void) sendButtonPressed {
    NSLog(@"send button pressed");
    
    ApiAI *apiai = [ApiAI sharedApiAI];
    
    AITextRequest *request = [apiai textRequest];
    request.query = @[self.textField.text?:@""];
    
    __weak typeof(self) selfWeak = self;
    
    [request setMappedCompletionBlockSuccess:^(AIRequest *request, AIResponse *response) {
        __strong typeof(selfWeak) selfStrong = selfWeak;
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:response.status.errorType
                                                            message:response.result.fulfillment.speech
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        //[MBProgressHUD hideHUDForView:selfStrong.view animated:YES];
    } failure:^(AIRequest *request, NSError *error) {
        __strong typeof(selfWeak) selfStrong = selfWeak;
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        
        //[MBProgressHUD hideHUDForView:selfStrong.view animated:YES];
    }];
    
    [apiai enqueue:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
