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
#import "LearnContentTypeTableViewCell.h"

@interface LearnViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *learnCategories;
@property NSIndexPath *selectedIndexPath;
@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LEARN";
    self.learnCategories = @[CONTENT_TYPE_BLOOD_PRESSURE, CONTENT_TYPE_BLOOD_SUGAR, CONTENT_TYPE_HEART_RATE];
    
    /* Gets rid of extra blank cells */
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
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
    
    if (self.selectedIndexPath) {
        [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:YES];
    }
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.learnCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"LearnContentTypeIdentifier";
    LearnContentTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"LearnContentTypeTableViewCell" owner:self options:nil];
        cell = (LearnContentTypeTableViewCell *)[nib objectAtIndex:0];
    }
    cell.textLabel.text = [self.learnCategories objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Lato-light" size:20.0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    LearnContentViewController *dest = [[LearnContentViewController alloc] init];
    dest.content = [[LearnContent alloc] initWithContentTitle:[self.learnCategories objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:dest animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 75;
}

@end
