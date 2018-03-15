//
//  FeedbackViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 2/21/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "FeedbackViewController.h"
#import "Constants.h"
#import "GraphicUtils.h"
#import "AWSDynamoDBHelper.h"

@interface FeedbackViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) UITextView *textFeedback;
@end

@implementation FeedbackViewController

UITextView* textFeedback;
UILabel *lbl;
NSString *rate;
static int rating;
// Custom icon creator for Container View
- (UIButton*) createButton: (UIButton*) button withImage: (NSString*) imageName{
    button = [UIButton buttonWithType: UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    [button setImage:image forState:UIControlStateNormal];
    button.layer.cornerRadius = 15;
    button.clipsToBounds = YES;
    return button;
}
- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
}

- (void)submitPressed {
    [self.navigationController popViewControllerAnimated:YES];
    //Save to AWS
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM-dd-yyyy HH:mm:ss";
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    NSString *dateForToday = [formatter stringFromDate:[NSDate date]];
    NSString *uniqueIdentifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"%@",textFeedback.text);//comment
    NSLog(@"%d",rating);//rating
    NSLog(@"%@",dateForToday);
    NSLog(@"%f",timeStamp);//timestamp
    NSLog(@"%@", uniqueIdentifier);//DeviceId
    NSLog(@"%@",[[UIDevice currentDevice] systemVersion]);
    if ([textFeedback.text length] == 0)
        textFeedback.text = @" ";
    [AWSDynamoDBHelper InsertDataIntoFeedbackTable: @[uniqueIdentifier,textFeedback.text,[NSString stringWithFormat:@"%d",rating], @"Tell us your story", [NSString stringWithFormat:@"%@",dateForToday]]];
    /* insert app usage info into table
         Feedback : DeviceId, comment, rating, story, timestamp
     */
    //if not selected ask alert select your rating by selecting any smily.
}

- (void)setUpView {
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(10, 0, 15, 20);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
//    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
//    [submitBtn addTarget:self action:@selector(submitPressed) forControlEvents:UIControlEventTouchUpInside];
//    submitBtn.frame = CGRectMake(0, 0, 55, 50);
//    UIBarButtonItem *submitButton = [[UIBarButtonItem alloc] initWithCustomView:submitBtn];
//    self.navigationItem.rightBarButtonItem = submitButton;

    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    float startingY = SPACE_BETWEEN_CELLS;
    UIView *chatbotView = [[UIView alloc] initWithFrame: CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth/6 - 20)];
    //UIImageView *chatbotMessageImage = [[UIImageView alloc] init];
    UIButton *chatbotMessageImage = [[UIButton alloc] init];
    chatbotMessageImage.enabled = NO;
    [chatbotMessageImage setTitle:@"How would you rate the app ?" forState:UIControlStateDisabled];
    [chatbotMessageImage setBackgroundImage:[UIImage imageNamed:@"Chat"] forState:UIControlStateDisabled];
    chatbotMessageImage.titleLabel.font = [UIFont fontWithName:@"Lato-regular" size:18.0];
    chatbotMessageImage.contentMode = UIViewContentModeScaleAspectFit;
    chatbotMessageImage.layer.masksToBounds =true;
    chatbotMessageImage.titleLabel.font = [UIFont fontWithName:@"Lato-regular" size:18.0];
    chatbotMessageImage.translatesAutoresizingMaskIntoConstraints = false;
    
//    UIImage *img = [UIImage imageNamed:@"Chat"];
//    CGSize imgSize = chatbotMessageImage.frame.size;
//    UIGraphicsBeginImageContext(imgSize);
//    [img drawInRect:CGRectMake(0,0,imgSize.width,imgSize.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    chatbotMessageImage.backgroundColor = [UIColor colorWithPatternImage:newImage];
    //chatbotMessageImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Chat"]];
    UIImageView *chatbotDoctorImage = [[UIImageView alloc] init];
    chatbotDoctorImage.image = [UIImage imageNamed:@"Doctor"];
  
    chatbotDoctorImage.contentMode = UIViewContentModeScaleAspectFit;
    chatbotDoctorImage.layer.masksToBounds =true;
    chatbotDoctorImage.translatesAutoresizingMaskIntoConstraints = false;
    [chatbotView addSubview: chatbotMessageImage];
    [chatbotView addSubview: chatbotDoctorImage];
    
    //add constraints for  images
    NSDictionary *views = @{ @"chatbotMessageImage" :  chatbotMessageImage, @"chatbotDoctorImage" : chatbotDoctorImage};
    [chatbotView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|[chatbotDoctorImage][chatbotMessageImage]|" options:0 metrics:nil views: views]];
    [chatbotView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[chatbotMessageImage]|" options:0 metrics:nil views: views]];
    [chatbotView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|[chatbotDoctorImage]|" options:0 metrics:nil views: views]];
    
    //chatbot  smiley icons
    startingY += (cellWidth/6);
    UIView *chatbotView2 = [[UIView alloc] initWithFrame: CGRectMake(SPACE_BETWEEN_CELLS, startingY - 15, cellWidth, (cellWidth/8))];
    chatbotView2 = [self smileyIconsSetup: chatbotView2];
    [self.contentView addSubview:chatbotView];
    [self.contentView addSubview:chatbotView2];
    CGRect rect1 = CGRectMake(SPACE_BETWEEN_CELLS, startingY + 50, cellWidth - SPACE_BETWEEN_CELLS/2  , 40);
    lbl = [[UILabel alloc] initWithFrame:rect1];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.textColor = [UIColor whiteColor];
    lbl.text = @"Select one smiley";
    lbl.backgroundColor = HFTW_PRIMARY;
    [self.contentView addSubview:lbl];
    
    CGRect rect2 = CGRectMake(SPACE_BETWEEN_CELLS, startingY + 90, cellWidth - SPACE_BETWEEN_CELLS/2, 30);
    UILabel *lbl1 = [[UILabel alloc] initWithFrame:rect2];
    lbl1.textAlignment = NSTextAlignmentLeft;
    lbl1.textColor = HFTW_PRIMARY;
    lbl1.text = @"Tell Us Your Feedback :";
    //lbl1.backgroundColor = HFTW_PRIMARY;
    [self.contentView addSubview:lbl1];

    CGRect rect = CGRectMake(SPACE_BETWEEN_CELLS, startingY + 125, cellWidth - SPACE_BETWEEN_CELLS/2  ,160);
    textFeedback = [[UITextView alloc] initWithFrame:rect];
    textFeedback.textAlignment = NSTextAlignmentLeft;
    textFeedback.font = [UIFont fontWithName:@"Lato-light" size:16.0];
    textFeedback.backgroundColor = HFTW_PRIMARY;
    textFeedback.textColor = [UIColor whiteColor];
    [textFeedback becomeFirstResponder];
    [self.contentView addSubview:textFeedback];
    textFeedback.delegate = self;

    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"Submit" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitPressed) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.frame = CGRectMake(SPACE_BETWEEN_CELLS, textFeedback.frame.origin.y + rect.size.height + 10, cellWidth, 50);
    [GraphicUtils styleButton:submitBtn];
    [self.contentView addSubview:submitBtn];
    self.scrollView.contentSize = CGSizeMake(cellWidth,180);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        textFeedback.text = [NSString stringWithFormat:@"%@\n\t",textView.text];
    } else {
    }
    return YES;
}

- (void) icon1Pressed {
    lbl.text = @"Today's Rating for App : 5";
    rating = 5;
}

- (void) icon2Pressed {
    lbl.text = @"Today's Rating for App  : 4";
    rating = 4;
}

- (void) icon3Pressed {
    lbl.text = @"Today's Rating for App  : 3";
    rating = 3;
}
- (void) icon4Pressed {
    lbl.text = @"Today's Rating for App  : 2";
    rating = 2;
}
- (void) icon5Pressed {
    lbl.text = @"Today's Rating for App  : 1";
    rating = 1;
}
// Smiley icons setup
- (UIView*) smileyIconsSetup: (UIView*) chatbotView2{
    // Setup welcome Icons
    self.chatbotsmiley1 = [self createButton:self.chatbotsmiley1 withImage:QUOTES_IMAGE1];
    self.chatbotsmiley1.translatesAutoresizingMaskIntoConstraints = false;
    [self.chatbotsmiley1 addTarget:self action:@selector(icon1Pressed) forControlEvents:UIControlEventTouchUpInside];
    self.chatbotsmiley1.contentMode = UIViewContentModeScaleAspectFit;
    self.chatbotsmiley1.layer.masksToBounds = true;
    
    self.chatbotsmiley2 = [self createButton:self.chatbotsmiley2 withImage:QUOTES_IMAGE2];
    self.chatbotsmiley2.translatesAutoresizingMaskIntoConstraints = false;
    [self.chatbotsmiley2 addTarget:self action:@selector(icon2Pressed) forControlEvents:UIControlEventTouchUpInside];
    self.chatbotsmiley2.contentMode = UIViewContentModeScaleAspectFit;
    self.chatbotsmiley2.layer.masksToBounds = true;
    
    self.chatbotsmiley3 = [self createButton:self.chatbotsmiley3 withImage:QUOTES_IMAGE3];
    self.chatbotsmiley3.translatesAutoresizingMaskIntoConstraints = false;
    [self.chatbotsmiley3 addTarget:self action:@selector(icon3Pressed) forControlEvents:UIControlEventTouchUpInside];
    self.chatbotsmiley3.contentMode = UIViewContentModeScaleAspectFit;
    self.chatbotsmiley3.layer.masksToBounds = true;
    
    self.chatbotsmiley4 = [self createButton:self.chatbotsmiley4 withImage:QUOTES_IMAGE4];
    self.chatbotsmiley4.translatesAutoresizingMaskIntoConstraints = false;
    [self.chatbotsmiley4 addTarget:self action:@selector(icon4Pressed) forControlEvents:UIControlEventTouchUpInside];
    self.chatbotsmiley4.contentMode = UIViewContentModeScaleAspectFit;
    self.chatbotsmiley4.layer.masksToBounds = true;
    
    self.chatbotsmiley5 = [self createButton:self.chatbotsmiley5 withImage:QUOTES_IMAGE5];
    self.chatbotsmiley5.translatesAutoresizingMaskIntoConstraints = false;
    [self.chatbotsmiley5 addTarget:self action:@selector(icon5Pressed) forControlEvents:UIControlEventTouchUpInside];
    self.chatbotsmiley5.contentMode = UIViewContentModeScaleAspectFit;
    self.chatbotsmiley5.layer.masksToBounds = true;
    
    [chatbotView2 addSubview:self.chatbotsmiley1];
    [chatbotView2 addSubview:self.chatbotsmiley2];
    [chatbotView2 addSubview:self.chatbotsmiley3];
    [chatbotView2 addSubview:self.chatbotsmiley4];
    [chatbotView2 addSubview:self.chatbotsmiley5];
    
    //Horizontal Constraints
    
    NSDictionary *viewsIconsButton = @{ @"icon1" : self.chatbotsmiley1, @"icon2" : self.chatbotsmiley2 ,@"icon3" : self.chatbotsmiley3, @"icon4" : self.chatbotsmiley4, @"icon5" : self.chatbotsmiley5};
    [chatbotView2 addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"H:|-35-[icon1(==icon2)]-20@750-[icon2(==icon3)]-20@750-[icon3(==icon4)]-20@750-[icon4(==icon5)]-20@750-[icon5(==icon1)]-20-|" options:0 metrics:nil views: viewsIconsButton]];
    
    //Vertical Constraints
    [chatbotView2 addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-3-[icon1(41)]-1-|" options:0 metrics:nil views: viewsIconsButton]];
    [chatbotView2 addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-3-[icon2(41)]-1-|" options:0 metrics:nil views: viewsIconsButton]];
    [chatbotView2 addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-3-[icon3(41)]-1-|" options:0 metrics:nil views: viewsIconsButton]];
    [chatbotView2 addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-3-[icon4(41)]-1-|" options:0 metrics:nil views: viewsIconsButton]];
    [chatbotView2 addConstraints: [NSLayoutConstraint constraintsWithVisualFormat: @"V:|-3-[icon5(41)]-1-|" options:0 metrics:nil views: viewsIconsButton]];
    return chatbotView2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [NSLocalizedString(@"Feedback.title", nil) uppercaseString];
    [self setUpView];
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

/*Feedback : DeviceId, comment, rating, story, timestamp
*/
