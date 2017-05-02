//
//  SurveysViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/4/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "SurveysViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "GraphicUtils.h"
#import "HomeButton.h"
#import "WebViewController.h"

@interface SurveysViewController ()
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;
@property BOOL isCorrectPassword;
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UIView *contentView;
@property float currentY;
@end


#define SURVEY_PASSWORD @"stroke"

@implementation SurveysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [GraphicUtils styleButton: self.enterButton];
    self.passwordTextField.secureTextEntry = YES;
    self.title = @"SURVEYS";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
}

- (void)setUpView{
    if(self.isCorrectPassword){
        
        // Hide the textfield and button
        self.passwordTextField.hidden =true;
        self.enterButton.hidden = true;
        
        // Display List of Surveys;
        static int SPACE_BETWEEN_CELLS = 10;
        float cellWidth = ([UIScreen mainScreen].bounds.size.width) - (SPACE_BETWEEN_CELLS * 2);
        float cellHeight = 50;
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        [self.scrollView setBackgroundColor:[UIColor clearColor]];
        self.scrollView.bounces = NO;
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20000)];
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        [self.scrollView addSubview:self.contentView];
        self.currentY = SPACE_BETWEEN_CELLS * 8;
        
        /* Buttons for different types of exercises  */
        UIButton *survey1Button = [[UIButton alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellHeight)];
        [survey1Button setTitle:@"Pre Health Literacy Survey" forState: UIControlStateNormal];
        [GraphicUtils styleButton:survey1Button];
        [survey1Button addTarget:self action:@selector(survey1Pressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellHeight;
        self.currentY += SPACE_BETWEEN_CELLS;
        
        
         UIButton *survey2Button = [[UIButton alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellHeight)];
        [survey2Button setTitle:@"Post Health Literacy Survey" forState: UIControlStateNormal];
        [GraphicUtils styleButton:survey2Button];
        [survey2Button addTarget:self action:@selector(survey2Pressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellHeight;
        self.currentY += SPACE_BETWEEN_CELLS;
        
        UIButton *survey3Button = [[UIButton alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellHeight)];
        [survey3Button setTitle:@"Follow up Survey" forState: UIControlStateNormal];
        [GraphicUtils styleButton:survey3Button];
        [survey3Button addTarget:self action:@selector(survey3Pressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellHeight;
        self.currentY += SPACE_BETWEEN_CELLS;
        
        
        UIButton *survey4Button = [[UIButton alloc] initWithFrame:CGRectMake(SPACE_BETWEEN_CELLS, self.currentY, cellWidth, cellHeight)];
        [survey4Button setTitle:@"Usability Scale" forState: UIControlStateNormal];
        [GraphicUtils styleButton:survey4Button];
        [survey4Button addTarget:self action:@selector(survey4Pressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.currentY += cellWidth;
        self.currentY += SPACE_BETWEEN_CELLS;
        self.currentY += 20;
        
        [self.contentView addSubview: survey1Button];
        [self.contentView addSubview: survey2Button];
        [self.contentView addSubview: survey3Button];
        [self.contentView addSubview: survey4Button];
        
        self.isCorrectPassword = false;
        self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.currentY);
        [self.view addSubview:self.scrollView];
        
    }
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)enterButtonPressed:(UIButton *)sender {
    if ([self.passwordTextField.text  isEqual:SURVEY_PASSWORD]){
        self.isCorrectPassword = true;
        [self setUpView];
    }
    else{
        [self displayAlert];
    }
}

/* Display alert for password validation*/

- (void)displayAlert {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Incorrect Password"
                                 message:@"Password is incorrect"
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    //Handle your  ok button action here
                                    self.passwordTextField.text = nil;
                                }];
    
    
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

/* Action listeners for buttons */

- (void)survey1Pressed {
    WebViewController *vc = [[WebViewController alloc] init];
    [vc setUpWebView:@"https://h4theworld.typeform.com/to/qPXTtS"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)survey2Pressed {
    WebViewController *vc = [[WebViewController alloc] init];
    [vc setUpWebView:@"https://h4theworld.typeform.com/to/PsbAIj"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)survey3Pressed {
    WebViewController *vc = [[WebViewController alloc] init];
    [vc setUpWebView:@"https://h4theworld.typeform.com/to/bdznW3"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)survey4Pressed {
    WebViewController *vc = [[WebViewController alloc] init];
    [vc setUpWebView:@"https://h4theworld.typeform.com/to/p5QuYQ"];
    [self.navigationController pushViewController:vc animated:YES];
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
