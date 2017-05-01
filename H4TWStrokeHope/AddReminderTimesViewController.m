//
//  AddReminderTimesViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AddReminderTimesViewController.h"
#import "Constants.h"
#import "TimeTableViewCell.h"

@interface AddReminderTimesViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property NSMutableArray *times;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *timeButton;
@property (strong, nonatomic) IBOutlet UIButton *addTimeButton;
@property UIDatePicker *timePicker;
@end

#define CELL_HEIGHT 100

@implementation AddReminderTimesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpColors];
    
    self.tableView.bounces = NO;
    self.tableView.alwaysBounceVertical = NO;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.times = [[NSMutableArray alloc] init];
    [self setUpPicker];
}

- (void)setUpPicker {
    self.timePicker = [[UIDatePicker alloc] init];
    CGRect bounds = [self.view bounds];
    int datePickerHeight = self.timePicker.frame.size.height;
    self.timePicker.frame = CGRectMake(0, bounds.size.height - (datePickerHeight), self.timePicker.frame.size.width, self.timePicker.frame.size.height);
    self.timePicker.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.timePicker.datePickerMode = UIDatePickerModeTime;
    self.timePicker.hidden = YES;
    [self.view addSubview:self.timePicker];
    [self.timePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)datePickerChanged:(int)change {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)setUpColors {
    self.saveButton.backgroundColor = HFTW_MAGENTA;
    self.saveButton.clipsToBounds = YES;
    self.saveButton.layer.cornerRadius = 10;
    [self.backButton setTitleColor:HFTW_MAGENTA forState:UIControlStateNormal];
    self.titleLabel.textColor = HFTW_TEXT_GRAY;
    [self.timeButton setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closePressed:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonPressed:(id)sender {
    [self.delegate createdReminder:self.reminder];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.times.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"TimeCellIdentifier";
    /* Normal cell */
    TimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TimeTableViewCell" owner:self options:nil];
        cell = (TimeTableViewCell *)[nib objectAtIndex:0];
    }
    Time *time = [self.times objectAtIndex:indexPath.row];
    [cell layoutWithTime:time];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return CELL_HEIGHT;
}

- (IBAction)timeButtonPressed:(id)sender {
    self.timePicker.backgroundColor = [UIColor whiteColor];
    self.timePicker.hidden = NO;
}

- (IBAction)addTimeButtonPressed:(id)sender {
}

@end
