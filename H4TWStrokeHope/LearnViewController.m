//
//  LearnViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/4/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "LearnViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "LearnContentViewController.h"
#import "LearnContent.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LEARN";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
}

- (void)viewWillAppear:(BOOL)animated {
    /* Set up nav bar color */
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = HFTW_DARK;
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bloodPressurePressed:(id)sender {
    LearnContentViewController *dest = [[LearnContentViewController alloc] init];
    dest.content = [[LearnContent alloc] initWithContentTitle:CONTENT_TYPE_BLOOD_PRESSURE];
    [self.navigationController pushViewController:dest animated:YES];
}

- (IBAction)bloodSugarPressed:(id)sender {
    LearnContentViewController *dest = [[LearnContentViewController alloc] init];
    dest.content = [[LearnContent alloc] initWithContentTitle:CONTENT_TYPE_BLOOD_SUGAR];
    [self.navigationController pushViewController:dest animated:YES];
}

- (IBAction)heartRatPressed:(id)sender {
    LearnContentViewController *dest = [[LearnContentViewController alloc] init];
    dest.content = [[LearnContent alloc] initWithContentTitle:CONTENT_TYPE_HEART_RATE];
    [self.navigationController pushViewController:dest animated:YES];
}

@end
