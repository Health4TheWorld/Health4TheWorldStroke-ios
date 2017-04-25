//
//  MindExercisesViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/11/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "MindExercisesViewController.h"
#import "Constants.h"
#import "Utils.h"

@interface MindExercisesViewController ()

@end

@implementation MindExercisesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MIND EXERCISES";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
}


- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
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
