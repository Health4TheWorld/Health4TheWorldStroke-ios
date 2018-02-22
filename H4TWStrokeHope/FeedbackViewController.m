//
//  FeedbackViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 2/21/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "FeedbackViewController.h"
#import "Constants.h"

@interface FeedbackViewController ()
@end

@implementation FeedbackViewController

UITextField* textFeedback;


// Custom icon creator for Container View
- (UIButton*) createButton: (UIButton*) button withImage: (NSString*) imageName{
    button = [UIButton buttonWithType: UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:imageName];
    [button setImage:image forState:UIControlStateNormal];
    button.layer.cornerRadius = 15;
    button.clipsToBounds = YES;
    return button;
}

- (void)setUpView {
    static int SPACE_BETWEEN_CELLS = 10;
    float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS) - (SPACE_BETWEEN_CELLS / 2);
    float startingY = SPACE_BETWEEN_CELLS + 60;
    UIView *chatbotView = [[UIView alloc] initWithFrame: CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, cellWidth/6)];
    UIImageView *chatbotMessageImage = [[UIImageView alloc] init];
    chatbotMessageImage.image = [UIImage imageNamed:@"ChatMessage"];
    UIImageView *chatbotDoctorImage = [[UIImageView alloc] init];
    chatbotDoctorImage.image = [UIImage imageNamed:@"Doctor"];
    chatbotMessageImage.contentMode = UIViewContentModeScaleAspectFit;
    chatbotMessageImage.layer.masksToBounds =true;
    chatbotMessageImage.translatesAutoresizingMaskIntoConstraints = false;
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
    UIView *chatbotView2 = [[UIView alloc] initWithFrame: CGRectMake(SPACE_BETWEEN_CELLS, startingY, cellWidth, (cellWidth/8))];
    chatbotView2 = [self smileyIconsSetup: chatbotView2];
    [self.view addSubview:chatbotView];
    [self.view addSubview:chatbotView2];
    
    CGRect rect = CGRectMake(SPACE_BETWEEN_CELLS, startingY + 70, cellWidth, 200);
    textFeedback = [[UITextField alloc] initWithFrame:rect];
    textFeedback.placeholder = @"Tell us your feedback!";
    textFeedback.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textFeedback];


}
- (void) icon1Pressed {
    textFeedback.textAlignment = NSTextAlignmentCenter;
    textFeedback.text = @"Today's Rating : 5";
}
- (void) icon2Pressed {
    textFeedback.text = @"Today's Rating : 4";
}
- (void) icon3Pressed {
    textFeedback.text = @"Today's Rating : 3";
}
- (void) icon4Pressed {
    textFeedback.text = @"Today's Rating : 3";
}
- (void) icon5Pressed {
    textFeedback.text = @"Today's Rating : 1";
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
