//
//  AddReminderTimesViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AddReminderTimesViewController.h"
#import "Constants.h"
#import "Time.h"
#import "TimeTableViewCell.h"

@interface AddReminderTimesViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property NSMutableArray *times;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UITextField *timeTextField;
@property (strong, nonatomic) IBOutlet UIButton *addTimeButton;
@property UIDatePicker *timePicker;
@end

#define CELL_HEIGHT 100
#define SECTION_HEADER_HEIGHT 40

@implementation AddReminderTimesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpColors];
    
    self.addTimeButton.hidden = NO;
    
    self.tableView.bounces = NO;
    self.tableView.alwaysBounceVertical = NO;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
    
    [self setUpPicker];
    
    /* Create tap view so that we can hide keyboard when they tap outside textfield */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.delegate = self;
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    
    if (self.isEditing) {
        self.times = self.reminder.times;
        self.backButton.hidden = YES;
        [self.saveButton setTitle:@"SAVE" forState:UIControlStateNormal];
    } else {
        self.times = [[NSMutableArray alloc] init];
        self.backButton.hidden = NO;
        [self.saveButton setTitle:@"ADD REMINDER" forState:UIControlStateNormal];
    }
}

- (void)setUpPicker {
    self.timePicker = [[UIDatePicker alloc]init];
    self.timePicker.datePickerMode=UIDatePickerModeTime;
    [self.timeTextField setInputView:self.timePicker];
    
    UIToolbar *toolBar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"Add Time" style:UIBarButtonItemStyleBordered target:self action:@selector(doneSelecting)];
    UIBarButtonItem *space=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space,doneBtn, nil]];
    
    [self.timeTextField setInputAccessoryView:toolBar];
}

- (void)dismissKeyboard {
    [self.timeTextField resignFirstResponder];
}

- (void)doneSelecting {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"h:mm a"]; //24hr time format
    NSString *dateString = [outputFormatter stringFromDate:self.timePicker.date];
    self.timeTextField.text = dateString;
    self.timeTextField.font = [UIFont fontWithName:@"Avenir Book" size:60.0];
    [self.timeTextField resignFirstResponder];

    /* Add the time */
    Time *time = [[Time alloc] initWithString:self.timeTextField.text];
    [self.times addObject:time];
    [self.tableView reloadData];
    self.timeTextField.text = @"";
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
    self.timeTextField.textColor = HFTW_TEXT_GRAY;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closePressed:(id)sender {
    if (self.isEditing) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)backPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)saveButtonPressed:(id)sender {
    if (self.isEditing) {
        self.reminder.times = self.times;
        if (self.delegate && ([self.delegate respondsToSelector:@selector(editedReminderTimes:)])) {
            [self.delegate editedReminderTimes:self.times];
        }
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        self.reminder.times = self.times;
        [self.delegate createdReminder:self.reminder];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
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

- (IBAction)addTimeButtonPressed:(id)sender {
    [self.timeTextField becomeFirstResponder];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Remind me at:";
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, SECTION_HEADER_HEIGHT)];
    [view setBackgroundColor:[UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1.0]];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, tableView.frame.size.width, SECTION_HEADER_HEIGHT)];
    [label setFont:[UIFont fontWithName:@"Avenir-Bold" size:14]];
    [label setTextColor:HFTW_TEXT_GRAY];
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Remind me at:";
            break;
        default:
            sectionName = @"";
            break;
    }
    [label setText:sectionName];
    [label sizeToFit];
    
    CGPoint center = label.center;
    center.y = view.center.y;
    label.center = center;
    
    [view addSubview:label];
    return view;
}

/* We only have section headers in the ACCEPTED section. */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SECTION_HEADER_HEIGHT;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

/* Delete a time */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.times removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

@end
