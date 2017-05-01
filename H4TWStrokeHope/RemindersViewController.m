//
//  RemindersViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/4/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "RemindersViewController.h"
#import "ReminderTableViewCell.h"
#import "EditReminderViewController.h"
#import "AddReminderTitleViewController.h"
#import "NoResultsTableViewCell.h"
#import "Constants.h"
#import "Utils.h"

#define SECTION_HEADER_HEIGHT 40
#define CELL_HEIGHT 75
#define NO_RESULTS_CELL_HEIGHT 50

@interface RemindersViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *todayReminders;
@property NSMutableArray *allReminders;
@property (strong, nonatomic) IBOutlet UIButton *addReminderButton;
@property NSIndexPath *selectedIndexPath;
@end

@implementation RemindersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"REMINDERS";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    self.tableView.bounces = NO;
    self.tableView.alwaysBounceVertical = NO;
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self setUpColors];

    self.todayReminders = [[NSMutableArray alloc] init];
    self.allReminders = [[NSMutableArray alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:YES];
}

- (void)setUpColors {
    self.addReminderButton.backgroundColor = HFTW_MAGENTA;
    self.addReminderButton.clipsToBounds = YES;
    self.addReminderButton.layer.cornerRadius = 10;
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addReminderPressed:(id)sender {
    UINavigationController *nav = [[UINavigationController alloc] init];
    AddReminderTitleViewController *vc = [[AddReminderTitleViewController alloc] init];
    vc.remindersVC = self;
    [nav pushViewController:vc animated:YES];
    
    nav.modalPresentationStyle = UIModalPresentationPopover;
    nav.preferredContentSize = CGSizeMake(150, 300);
    // configure popover style & delegate
    UIPopoverPresentationController *popover =  nav.popoverPresentationController;
    popover.delegate = self;
    popover.sourceView = self.view;
    popover.sourceRect = self.view.frame;
    popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    // display the controller in the usual way
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        if (self.todayReminders.count == 0) {
            /* "No results" cell */
            return 1;
        } else {
            return self.todayReminders.count;
        }
    } else {
        if (self.allReminders.count == 0) {
            /* "No results" cell */
            return 1;
        } else {
            return self.allReminders.count;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"ReminderCellIdentifier";
    static NSString *noResultsIdentifier = @"NoResultsCellIdentifier";
    
    /* First check if we should put no results cell */
    BOOL noResults = NO;
    if (indexPath.section == 0) {
        if (self.todayReminders.count == 0) {
            noResults = YES;
        }
    } else if (indexPath.section == 1) {
        if (self.allReminders.count == 0) {
            noResults = YES;
        }
    }
    
    /* No results cell */
    if (noResults) {
        NoResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:noResultsIdentifier];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NoResultsTableViewCell" owner:self options:nil];
            cell = (NoResultsTableViewCell *)[nib objectAtIndex:0];
            cell.mainLabel.text = @"None.";
            return cell;
        }
    }
    
    /* Normal cell */
    ReminderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ReminderTableViewCell" owner:self options:nil];
        cell = (ReminderTableViewCell *)[nib objectAtIndex:0];
        cell.delegate = self;
    }
    Reminder *reminder;
    if (indexPath.section == 0) {
        reminder = [self.todayReminders objectAtIndex:indexPath.row];
    } else {
        reminder = [self.allReminders objectAtIndex:indexPath.row];
    }
    [cell layoutCellWithReminder:reminder];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    Reminder *selectedReminder;
    if (indexPath.section == 0) {
        selectedReminder = [self.todayReminders objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1) {
        selectedReminder = [self.allReminders objectAtIndex:indexPath.row];
    }
    EditReminderViewController *editVC = [[EditReminderViewController alloc] init];
    editVC.reminder = selectedReminder;
    [self.navigationController pushViewController:editVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section == 0) {
        if (self.todayReminders.count == 0) {
            return NO_RESULTS_CELL_HEIGHT;
        }
    } else if (indexPath.section == 1) {
        if (self.allReminders.count == 0) {
            return NO_RESULTS_CELL_HEIGHT;
        }
    }
    return CELL_HEIGHT;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Today's reminders";
            break;
        case 1:
            sectionName = @"All reminders";
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
    [label setFont:[UIFont fontWithName:@"Lato-Bold" size:14]];
    [label setTextColor:HFTW_TEXT_GRAY];
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Today's reminders";
            break;
        case 1:
            sectionName = @"All reminders";
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

- (void)clickedCheckOnReminder:(Reminder *)reminder {
    reminder.isCompleted = !reminder.isCompleted;
    NSLog(@"Clicked check!");
}

#pragma mark - CreateReminderProtocol 
- (void)createdReminder:(Reminder *)reminder {
    [self.todayReminders addObject:reminder];
    [self.allReminders addObject:reminder];
    [self.tableView reloadData];
}

@end
