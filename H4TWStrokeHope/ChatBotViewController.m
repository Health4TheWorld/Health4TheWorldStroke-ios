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
#import "ChatBotViewCell.h"
#import "ChatMessages.h"
#import "MindExercisesViewController.h"
#import "QuotesViewController.h"

@interface ChatBotViewController ()
@property (nonatomic,retain) UIButton *sendButton;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIView *containerView;
@property ChatMessages *message;
@property (nonatomic, retain) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, retain) NSLayoutConstraint *heightConstraint;
@property ApiAI *apiai;
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
@property (nonatomic, retain) UIButton *exitButton;
@end


#define PROFILE_IMAGE @"ChatBotProfile"
#define NO_BUTTON @"NO"
#define YES_BUTTON @"YES"
#define LONELY_BUTTON1 @"Watch 360 videos"
#define LONELY_BUTTON2 @"Listen to music"
#define LONELY_BUTTON3 @"Today's Inspiring quotes"
#define LONELY_BUTTON4 @"Stroke survivor video"
#define LONELY_BUTTON5 @"Get tips to tackle this"
#define TIPS_INTENT_TEXT @"know more"
#define FALLBACK_NO_INTENT @"FALLBACK-NO"
#define LONELY_OPTIONS_TEXT @"What do you want to do"
#define EXIT_BUTTON @"EXIT"
#define HEIGHT_CONSTRAINT_DEFAULT 48

@implementation ChatBotViewController
static NSString * const reuseIdentifier = @"Cell";
NSMutableArray *messages;

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
    
    // Instantiate API shared instance
    self.apiai = [ApiAI sharedApiAI];
    
    [self setUpView];
    
    //Set Up Data Source
    
    messages = [[NSMutableArray alloc] init];

}

- (void)setUpView {
    // Set up collection view
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout: layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ChatBotViewCell" bundle:nil] forCellWithReuseIdentifier: reuseIdentifier];
    [self.collectionView setBackgroundColor: [UIColor whiteColor]];
    [self.collectionView setDataSource: self];
    [self.collectionView setDelegate: self];
    [self.collectionView setBounces:true];
    [self.collectionView setAlwaysBounceVertical:true];
    
    [self.view addSubview:self.collectionView];
    
    // Create text box to enter and send button to print the message on screen
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = UIColor.whiteColor;
    self.containerView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview: self.containerView];
    
    NSDictionary *views = @{ @"containerView" : self.containerView };
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[containerView]|" options:0 metrics:nil views: views]];
    [self.view addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:[containerView]" options:0 metrics:nil views: views]];
    
    self.heightConstraint = [NSLayoutConstraint constraintWithItem: self.containerView attribute: NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:HEIGHT_CONSTRAINT_DEFAULT];
    
    [self.view addConstraint: self.heightConstraint];
    
    //Set constraint for keyboard resizing
    self.bottomConstraint = [NSLayoutConstraint constraintWithItem: self.containerView attribute: NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    [self.view addConstraint: self.bottomConstraint];
    
//    tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                            action:@selector(didTapAnywhere:)];
    
    // Adding button to container view
    self.sendButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [self.sendButton setTitle: @"Send" forState:UIControlStateNormal];
    [self.sendButton addTarget:self action:@selector(sendButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.sendButton.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.containerView addSubview:self.sendButton];
    
    //Add constraints - x,y,w,h
    
    NSDictionary *viewSendButton = @{ @"sendButton" : self.sendButton };
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[sendButton]|" options:0 metrics:nil views: viewSendButton]];
    
    //Add text field
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"Enter message...";
    [self.textField setClearButtonMode:UITextFieldViewModeAlways];
    self.textField.translatesAutoresizingMaskIntoConstraints = false;
    
    //self.textField.inputView = [UIView alloc];
    [self.textField setDelegate:self];
    
    [self.containerView addSubview: self.textField];
    
    //Add constraints - x,y,w,h
    
    NSDictionary *viewsTextField = @{ @"textField" : self.textField, @"sendButton" : self.sendButton };
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-8-[textField][sendButton(60)]|" options:0 metrics:nil views: viewsTextField]];
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[textField]|" options:0 metrics:nil views: viewsTextField]];
    
    //Separator line view
    UIView *separatorLine = [[UIView alloc] init];
    separatorLine.backgroundColor = HFTW_LIGHT_GRAY;
    separatorLine.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.containerView addSubview: separatorLine];
    
    // Add constratins - x,y,w,h
    NSDictionary *viewsLine = @{ @"separatorLine" : separatorLine };
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[separatorLine]|" options:0 metrics:nil views: viewsLine]];
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[separatorLine(0.5)]" options:0 metrics:nil views: viewsLine]];
    
    // Observers for keyboard to resize the text field
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleKeyboardNotification:) name: UIKeyboardWillShowNotification object:nil];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(handleKeyboardNotification:) name: UIKeyboardWillHideNotification object:nil];
    
    [self.collectionView setContentInset: UIEdgeInsetsMake(0, 0, 100, 0)];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //self.heightConstraint.constant = 48;
    [self.collectionView reloadData];
}

/* UITextField Delegates */
// Send message when user presses return key
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self sendButtonPressed];
    return YES;
}

// process response text to simulate the views
- (void) processResponse: (NSString*) text withIntent: (NSString*) intent{
    
    //Tips Intent
    if([text localizedCaseInsensitiveContainsString: TIPS_INTENT_TEXT]){
        NSLog(@" Display Tips View");
        [self displayTipsView ];
    }
    
    // Fallback Intent
    if([intent localizedCaseInsensitiveContainsString:FALLBACK_NO_INTENT]){
        NSLog(@" Display default View");
        [self defaultView];
    }
    
    // Lonely Options
    if([text localizedCaseInsensitiveContainsString:LONELY_OPTIONS_TEXT]){
        NSLog(@" Display Lonely options View");
        [self lonelyOptionsView];
    }
    
}

//FallBack Intent - Fallback to Default View
- (void) defaultView {
    [self.yesButton setHidden:true];
    [self.noButton setHidden:true];
    
    [self.textField setHidden:false];
    [self.sendButton setHidden:false];

}

//Lonely Options View - 5 different choices
- (void) lonelyOptionsView {
    if(self.lonelyOption1 == NULL){
        // Setup buttons for lonely options 1 through 5
        self.lonelyOption1 = [self createButton:self.lonelyOption1 withTitle:LONELY_BUTTON1];
        self.lonelyOption1.translatesAutoresizingMaskIntoConstraints = false;
        [self.lonelyOption1 addTarget:self action:@selector(lonely1ButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview: self.lonelyOption1];

        
        // Adding lonely2 button to container view
        
        self.lonelyOption2 = [self createButton:self.lonelyOption2 withTitle:LONELY_BUTTON2];
        self.lonelyOption2.translatesAutoresizingMaskIntoConstraints = false;
        [self.lonelyOption2 addTarget:self action:@selector(lonely2ButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:self.lonelyOption2];
        
        
        //Add constraints - x,y,w,h
        
        NSDictionary *viewsLonely12Buttons = @{ @"lonely1" : self.lonelyOption1, @"lonely2" : self.lonelyOption2 };
        [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-10-[lonely1(170)]-20-[lonely2]-10-|" options:0 metrics:nil views: viewsLonely12Buttons]];
        
        // Add Lonely Option 3 button
        self.lonelyOption3 = [self createButton:self.lonelyOption3 withTitle:LONELY_BUTTON3];
        self.lonelyOption3.translatesAutoresizingMaskIntoConstraints = false;
        [self.lonelyOption3 addTarget:self action:@selector(lonely3ButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview: self.lonelyOption3];
        
        // Adding lonely4 button to container view
        
        self.lonelyOption4 = [self createButton:self.lonelyOption4 withTitle:LONELY_BUTTON4];
        self.lonelyOption4.translatesAutoresizingMaskIntoConstraints = false;
        [self.lonelyOption4 addTarget:self action:@selector(lonely4ButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:self.lonelyOption4];
        
        
        //Add constraints - x,y,w,h
        
        NSDictionary *viewsLonely34Buttons = @{ @"lonely2" : self.lonelyOption2, @"lonely3" : self.lonelyOption3, @"lonely4" : self.lonelyOption4 };
        [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-10-[lonely3(170)]-20-[lonely4]-10-|" options:0 metrics:nil views: viewsLonely34Buttons]];
        
        // Add Lonely Option 5 button
        self.lonelyOption5 = [self createButton:self.lonelyOption5 withTitle:LONELY_BUTTON5];
        self.lonelyOption5.translatesAutoresizingMaskIntoConstraints = false;
        [self.lonelyOption5 addTarget:self action:@selector(lonely5ButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview: self.lonelyOption5];
        
        // Adding exit button to container view
        
        self.exitButton = [self createButton:self.exitButton withTitle:EXIT_BUTTON];
        self.exitButton.translatesAutoresizingMaskIntoConstraints = false;
        [self.exitButton addTarget:self action:@selector(exitButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView addSubview:self.exitButton];
        
        
        //Add constraints - x,y,w,h
        
        NSDictionary *viewsLonely56Buttons = @{ @"lonely5" : self.lonelyOption5, @"exit" : self.exitButton, @"lonely4" : self.lonelyOption4 };
        [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-10-[lonely5(170)]-20-[exit]-10-|" options:0 metrics:nil views: viewsLonely56Buttons]];
        
        //Vertical Constraints
        
        NSDictionary *viewsLonely246Button = @{ @"lonely2" : self.lonelyOption2, @"lonely4" : self.lonelyOption4 ,@"exit" : self.exitButton};
        [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-10-[lonely2]-10-[lonely4]-10-[exit]-10-|" options:0 metrics:nil views: viewsLonely246Button]];
        
        NSDictionary *viewsLonely135Button = @{ @"lonely1" : self.lonelyOption1, @"lonely3" : self.lonelyOption3 ,@"lonely5" : self.lonelyOption5};
        [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-10-[lonely1]-10-[lonely3]-10-[lonely5]-10-|" options:0 metrics:nil views: viewsLonely135Button]];
        
    }else{
        [self.lonelyOption1 setHidden:false];
        [self.lonelyOption2 setHidden:false];
        [self.lonelyOption3 setHidden:false];
        [self.lonelyOption4 setHidden:false];
        [self.lonelyOption5 setHidden:false];
        [self.exitButton setHidden:false];
    }
    
    self.heightConstraint.constant = 130;
    
    
    [self.yesButton setHidden:true];
    [self.noButton setHidden:true];
    [self.textField setHidden:true];
    [self.sendButton setHidden:true];
    
    
}

// Tips - Yes or No buttons view
- (void) displayTipsView {
    
    if(self.yesButton == NULL || self.noButton==NULL){
    // Adding Yes button to container view
    
    self.yesButton = [self createButton:self.yesButton withTitle:YES_BUTTON];
    self.yesButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.yesButton addTarget:self action:@selector(YesButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview: self.yesButton];
    
    //Add constraints - x,y,w,h
    
    NSDictionary *viewsYesButton = @{ @"yesButton" : self.yesButton };
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-10-[yesButton]-10-|" options:0 metrics:nil views: viewsYesButton]];
    
    // Adding Yes button to container view
    
    self.noButton = [self createButton:self.noButton withTitle:NO_BUTTON];
    self.noButton.translatesAutoresizingMaskIntoConstraints = false;
    [self.noButton addTarget:self action:@selector(noButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:self.noButton];
    
    
    //Add constraints - x,y,w,h
    
    NSDictionary *viewsButtons = @{ @"noButton" : self.noButton, @"yesButton" : self.yesButton };
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-50-[yesButton(100)][noButton(100)]-50-|" options:0 metrics:nil views: viewsButtons]];
    [self.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-10-[noButton]-10-|" options:0 metrics:nil views: viewsButtons]];
    
    }
    else{
        [self.yesButton setHidden:false];
        [self.noButton setHidden:false];
    }
    [self.textField setHidden:true];
    [self.sendButton setHidden:true];
}

- (void) storeResponse: (NSString*) text withIntent: (NSString*) intent{
    self.message = [[ChatMessages alloc] initWithText:text withDate: [NSDate date] withSender:false];
    
        @try {
            [messages addObject:self.message];
            NSInteger item = messages.count - 1;
            NSIndexPath *insertIndexPath = [NSIndexPath indexPathForItem:item inSection:0 ];
            NSArray *items = [[NSArray alloc] initWithObjects:insertIndexPath, nil ];
            
            [self.collectionView insertItemsAtIndexPaths: items];
            [self.collectionView scrollToItemAtIndexPath:insertIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:true];
            
            [self processResponse:text withIntent:intent];
            
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
}

- (void) storeRequest: (NSString*) text {
    self.message = [[ChatMessages alloc] initWithText:text withDate: [NSDate date] withSender:true];
    @try {
        [messages addObject:self.message];
        NSInteger item = messages.count - 1 ;
        NSIndexPath *insertIndexPath = [NSIndexPath indexPathForItem:item inSection:0 ];
        NSArray *items = [[NSArray alloc] initWithObjects:insertIndexPath, nil ];
        
        [self.collectionView insertItemsAtIndexPaths: items];
        [self.collectionView scrollToItemAtIndexPath:insertIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:true];
        
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

#pragma MARK - AITextRequest Creator

-(AITextRequest*) createAndFetchRequest: (NSString*) textRequest {
    AITextRequest *request = [self.apiai textRequest];
    request.query = @[textRequest];
    return request;
}

//Action listeners
- (void) sendButtonPressed {
    NSLog(@"send button pressed");
    
    if(self.textField.isFirstResponder){
        [self.textField resignFirstResponder];
    }
    
    AITextRequest *request = [self createAndFetchRequest:self.textField.text];
    
    if(![self.textField.text  isEqual: @""] ){
    [self storeRequest: self.textField.text];
    
    [self retrieveAPIResponseWithRequest:request withSharedInstance: self.apiai];
    }

}

#pragma MARK - AITextRequest Response Retriever

- (void) retrieveAPIResponseWithRequest: (AITextRequest*) request withSharedInstance: (ApiAI*) apiai{
//    __weak typeof(self) selfWeak = self;
    
    [request setMappedCompletionBlockSuccess:^(AIRequest *request, AIResponse *response) {
//        __strong typeof(selfWeak) selfStrong = selfWeak;
        
        NSString *textResponse =  response.result.fulfillment.messages.firstObject.allValues.lastObject;
        
        // Store current intent
        NSString *intent = response.result.metadata.intentName.uppercaseString;
        
        
        [self storeResponse:textResponse withIntent:intent];
        NSLog(@"%@",textResponse);
        
        //clear the textField
        self.textField.text = @"";
        
    } failure:^(AIRequest *request, NSError *error) {
//        __strong typeof(selfWeak) selfStrong = selfWeak;
        
        [self customAlertMessageWithTitle:@"Error" withMessage:[error localizedDescription]];
        
    }];
    
    [apiai enqueue:request];
}

// keyboard listener
- (void) handleKeyboardNotification:(NSNotification*) notification{
    CGRect  keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if(notification.name == UIKeyboardWillShowNotification){
        NSLog(@"Keyboard is displayed");
        self.bottomConstraint.constant = -keyboardFrame.size.height;
        
        // Animate the keyboard
        [UIView animateWithDuration:0 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            if(notification.name == UIKeyboardWillShowNotification ){
                if(messages.count >= 1){
            NSIndexPath *indexpath = [NSIndexPath indexPathForItem: messages.count - 1 inSection:0];
            [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionBottom animated:true];
                }
            }
        }];
    } else {
        NSLog(@"Keyboard will hide");
        self.bottomConstraint.constant = 0;
    }
    
    
}
// Custom Button creator for Container View
- (UIButton*) createButton: (UIButton*) button withTitle: (NSString*) title{
    button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle: title forState:UIControlStateNormal];
    button.layer.cornerRadius = 6;
    button.clipsToBounds = YES;
    [button setBackgroundColor:HFTW_PRIMARY];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}

// Action listeners of Container view

- (void) YesButtonPressed {
    NSString *text = YES_BUTTON;
    [self storeRequest: text];
    AITextRequest *request = [self createAndFetchRequest:text];
    [self retrieveAPIResponseWithRequest:request withSharedInstance: self.apiai];
}

- (void) noButtonPressed {
    NSString *text = NO_BUTTON;
    [self storeRequest: text];
    AITextRequest *request = [self createAndFetchRequest:text];
    [self retrieveAPIResponseWithRequest:request withSharedInstance: self.apiai];
}

//Lonely Options clicked
- (void) lonely1ButtonPressed {
    // Re-direct to VR vidoes section
    MindExercisesViewController *vc = [[MindExercisesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void) lonely2ButtonPressed {
    [self customAlertMessageWithTitle:@"Music" withMessage:@"Music section Coming soon!"];
}
- (void) lonely3ButtonPressed {
    QuotesViewController *vc = [[QuotesViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    // Inspiring Quotes
    NSString *text = @"Quotes";
    [self storeRequest: text];
    AITextRequest *request = [self createAndFetchRequest:text];
    [self retrieveAPIResponseWithRequest:request withSharedInstance: self.apiai];
    
    //                NSURL *imageURL = [NSURL URLWithString:@"https://www.dropbox.com/s/me38dats39m92sw/80%25%20of%20success%22.png?dl=0"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        //                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            //                        cell.quoteImageView.image = [UIImage imageWithData:imageData];
//            cell.quoteImageView.image = [UIImage imageNamed: @"quote1"] ;
        });
    });
}
- (void) lonely4ButtonPressed {
    [self customAlertMessageWithTitle:@"Stroke Survivor Video" withMessage:@"Stroke Survivor video Coming soon!"];

}
- (void) lonely5ButtonPressed {
    // Get Tips from API.AI
    NSString *text = @"5";
    [self storeRequest:text];
    AITextRequest *request = [self createAndFetchRequest:text];
    [self retrieveAPIResponseWithRequest:request withSharedInstance: self.apiai];
    //hide all other buttons
    [self hideLonelyButtons];
    self.heightConstraint.constant = HEIGHT_CONSTRAINT_DEFAULT;
}
//Exit Button clicked
- (void) exitButtonPressed {
    [self.textField setHidden:false];
    [self.sendButton setHidden:false];
//hide all other buttons
    [self hideLonelyButtons];
    self.heightConstraint.constant = HEIGHT_CONSTRAINT_DEFAULT;
}

-(void) hideLonelyButtons {
    [self.lonelyOption1 setHidden:true];
    [self.lonelyOption2 setHidden:true];
    [self.lonelyOption3 setHidden:true];
    [self.lonelyOption4 setHidden:true];
    [self.lonelyOption5 setHidden:true];
    [self.exitButton setHidden:true];
}

// Create Custom Alert Message
- (void) customAlertMessageWithTitle: (NSString*) title withMessage:(NSString*) message
{
UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
[alertView show];
}

//-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
//    [self.textField resignFirstResponder];
//}

#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (messages){
    return messages.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     ChatBotViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];

    ChatMessages *message = [messages objectAtIndex: indexPath.item];
    
    cell.messageView.text = message.text;
    
    if(message){
        cell.profileImage.image = [UIImage imageNamed: PROFILE_IMAGE];
        
        CGSize size = CGSizeMake(250, 1000);
        NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
        NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:14] };
        CGSize estimatedFrame = [message.text boundingRectWithSize:size options: options attributes:attributes context: nil].size;
        int padding = 20;
        int profileImageSpace = 45;
        
        // Check if sender or receiver and change the UI based on the boolean
        if(!message.isSender){
                cell.messageView.frame = CGRectMake(profileImageSpace + 8, 0, estimatedFrame.width + padding, estimatedFrame.height + padding);
                cell.bubbleView.frame = CGRectMake(profileImageSpace - 8, 0, estimatedFrame.width + padding + 8, estimatedFrame.height + padding);
                
                // text color - black
                cell.messageView.textColor = [UIColor blackColor];
                // Set up chatbubble view
                cell.chatBubbleView.image = cell.leftChatBubble;
                // background color of bubble view
                cell.chatBubbleView.tintColor = [UIColor colorWithWhite:0.95 alpha:1];
                cell.profileImage.hidden = false;
        }
        
        else{
            
        cell.messageView.frame = CGRectMake(self.view.frame.size.width - estimatedFrame.width - padding - 8, 0, estimatedFrame.width + padding, estimatedFrame.height + padding);
        
        cell.bubbleView.frame = CGRectMake(self.view.frame.size.width - estimatedFrame.width - 8 - padding - 8 - 4, -4, estimatedFrame.width + padding + 8 + 10, estimatedFrame.height + padding + 6);
            cell.profileImage.hidden = true;
            

            //text color white
            cell.messageView.textColor = [UIColor whiteColor];
            
            // Set up chatbubble view
            cell.chatBubbleView.image = cell.rightChatBubble;
            // change the background color of bubble view
            cell.chatBubbleView.tintColor = HFTW_DARK;
            
        }
    }
    
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChatMessages *message = [messages objectAtIndex: indexPath.item];
    NSLog(@"%@", message);
    if(message){
        CGSize size = CGSizeMake(250, 1000);
       NSStringDrawingOptions options = NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin;
        NSDictionary *attributes = @{ NSFontAttributeName : [UIFont systemFontOfSize:14] };
        CGSize estimatedFrame  = [message.text boundingRectWithSize:size options: options attributes:attributes context: nil].size;
        int padding = 20;
        
        return CGSizeMake(self.view.frame.size.width, estimatedFrame.height + padding);
    }
    
    return CGSizeMake(self.view.frame.size.width,  100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(8, 0, 0, 0);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.textField endEditing:true];
}

@end
