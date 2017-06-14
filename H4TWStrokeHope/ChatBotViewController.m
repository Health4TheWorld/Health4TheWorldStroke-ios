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

@interface ChatBotViewController ()
@property (nonatomic,retain) UIButton *sendButton;
@property (nonatomic, retain) UITextField *textField;
@property ChatMessages *message;
@end


#define PROFILE_IMAGE @"ChatBotProfile"

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
    [self.collectionView alwaysBounceVertical];
    
    [self.view addSubview:self.collectionView];
    
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
    
    //self.textField.inputView = [UIView alloc];
    [self.textField setDelegate:self];
    [self.textField setClearsOnBeginEditing: true];
    [self.textField becomeFirstResponder];
    
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

/* UITextField Delegates */
// Send message when user presses return key
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self sendButtonPressed];
    return YES;
}


- (void) storeResponse: (NSString*) text {
    self.message = [[ChatMessages alloc] initWithText:text withDate: [NSDate date] withSender:false];
    [messages addObject:self.message];
}

- (void) storeRequest: (NSString*) text {
    self.message = [[ChatMessages alloc] initWithText:text withDate: [NSDate date] withSender:true];
    [messages addObject:self.message];
}

//Action listeners
- (void) sendButtonPressed {
    NSLog(@"send button pressed");
    
    ApiAI *apiai = [ApiAI sharedApiAI];
    
    AITextRequest *request = [apiai textRequest];
    request.query = @[self.textField.text?:@""];
    
    [self storeRequest: self.textField.text];
    [self.collectionView reloadData];
    
    
    __weak typeof(self) selfWeak = self;
    
    [request setMappedCompletionBlockSuccess:^(AIRequest *request, AIResponse *response) {
        __strong typeof(selfWeak) selfStrong = selfWeak;
        
        NSString *textResponse =  response.result.fulfillment.messages.firstObject.allValues.lastObject;
        
        [self storeResponse:textResponse];
        NSLog(@"%@",textResponse);
        
        [self.collectionView reloadData];
        
        //clear the textField
        self.textField.text = @"";

    } failure:^(AIRequest *request, NSError *error) {
        __strong typeof(selfWeak) selfStrong = selfWeak;
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];

    }];
    
    [apiai enqueue:request];

}

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
        CGSize estimatedFrame  = [message.text boundingRectWithSize:size options: options attributes:attributes context: nil].size;
        int padding = 20;
        int profileImageSpace = 45;
        
        // Check if sender or receiver and change the UI based on the boolean
        if(!message.isSender){
            cell.messageView.frame = CGRectMake(profileImageSpace + 8, 0, estimatedFrame.width + padding, estimatedFrame.height + padding);
            
            cell.bubbleView.frame = CGRectMake(profileImageSpace - 8, 0, estimatedFrame.width + padding + 8, estimatedFrame.height + padding);
            cell.profileImage.hidden = false;
            
            // text color - black
            cell.messageView.textColor = [UIColor blackColor];
            
            // Set up chatbubble view
            cell.chatBubbleView.image = cell.leftChatBubble;
            // background color of bubble view
             cell.chatBubbleView.tintColor = [UIColor colorWithWhite:0.95 alpha:1];
            
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

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
