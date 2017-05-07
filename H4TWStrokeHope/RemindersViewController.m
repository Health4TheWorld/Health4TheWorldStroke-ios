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
#import <UserNotifications/UserNotifications.h>

#define SECTION_HEADER_HEIGHT 40
#define CELL_HEIGHT 75
#define NO_RESULTS_CELL_HEIGHT 50

#define USER_DEFAULTS_REMINDERS_KEY @"reminders"

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
    self.title = [NSLocalizedString(@"Reminders.title", nil) uppercaseString];
    
    [self.addReminderButton setTitle:[NSLocalizedString(@"Reminders.addReminderButton", nil) uppercaseString] forState:UIControlStateNormal];
    
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

    [self loadAllReminders];
    [self setUpTodayReminders];
}

- (void)loadAllReminders {
    NSData *remindersData = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_REMINDERS_KEY];
    if (remindersData != nil) {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:remindersData];
        self.allReminders = [savedArray mutableCopy];
    } else {
        self.allReminders = [[NSMutableArray alloc] init];
    }
}

- (void)saveReminders {
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:self.allReminders];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:USER_DEFAULTS_REMINDERS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/* Load all reminders, and then figure out which ones are today. */
- (void)setUpTodayReminders {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    long weekday = [comps weekday];
    [self.todayReminders removeAllObjects];
    NSDate *today = [NSDate date];
    for (int i=0; i < self.allReminders.count; i++) {
        Reminder *reminder = [self.allReminders objectAtIndex:i];
        BOOL wasSeenToday = [Utils day:today isSameDayAs:reminder.lastDaySeen];
        if (!wasSeenToday) {
            reminder.isCompleted = NO;
            reminder.lastDaySeen = today;
            [self.allReminders replaceObjectAtIndex:i withObject:reminder];
        }
        NSArray *reminderDays = reminder.reminderDays;
        if (weekday == 1) {
            /* Sunday */
            if ([reminderDays containsObject:SUNDAY]) {
                [self.todayReminders addObject:reminder];
            }
        } else if (weekday == 2) {
            /* Monday */
            if ([reminderDays containsObject:MONDAY]) {
                [self.todayReminders addObject:reminder];
            }
        } else if (weekday == 3) {
            /* Tuesday */
            if ([reminderDays containsObject:TUESDAY]) {
                [self.todayReminders addObject:reminder];
            }
        } else if (weekday == 4) {
            /* Wednesday */
            if ([reminderDays containsObject:WEDNESDAY]) {
                [self.todayReminders addObject:reminder];
            }
        } else if (weekday == 5) {
            /* Thursday */
            if ([reminderDays containsObject:THURSDAY]) {
                [self.todayReminders addObject:reminder];
            }
        } else if (weekday == 6) {
            /* Friday */
            if ([reminderDays containsObject:FRIDAY]) {
                [self.todayReminders addObject:reminder];
            }
        } else if (weekday == 7) {
            /* Saturday */
            if ([reminderDays containsObject:SATURDAY]) {
                [self.todayReminders addObject:reminder];
            }
        }
    }
    [self saveReminders];
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
    vc.isEditing = NO;
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
        }
        cell.mainLabel.text = @"None.";
        return cell;
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
        [cell layoutCellWithReminder:reminder isToday:YES];
    } else {
        reminder = [self.allReminders objectAtIndex:indexPath.row];
        [cell layoutCellWithReminder:reminder isToday:NO];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    Reminder *selectedReminder;
    if (indexPath.section == 0) {
        if (self.todayReminders.count == 0) {
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            return;
        } else {
            selectedReminder = [self.todayReminders objectAtIndex:indexPath.row];
        }
    } else if (indexPath.section == 1) {
        if (self.allReminders.count == 0) {
            [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
            return;
        } else {
            selectedReminder = [self.allReminders objectAtIndex:indexPath.row];
        }
    }
    EditReminderViewController *editVC = [[EditReminderViewController alloc] init];
    editVC.delegate = self;
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
            sectionName = NSLocalizedString(@"Reminders.todaysReminders", nil);
            break;
        case 1:
            sectionName = NSLocalizedString(@"Reminders.allReminders", nil);
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
            sectionName = NSLocalizedString(@"Reminders.todaysReminders", nil);
            break;
        case 1:
            sectionName = NSLocalizedString(@"Reminders.allReminders", nil);
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (self.todayReminders.count == 0) {
            return NO;
        }
    } else if (indexPath.section == 1) {
        if (self.allReminders.count == 0) {
            return NO;
        }
    }
    return YES;
}

/* Delete a reminder */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Reminder *reminderToDelete;
        if (indexPath.section == 0) {
            reminderToDelete = [self.todayReminders objectAtIndex:self.selectedIndexPath.row];
            for (int i=0; i < self.allReminders.count; i++) {
                Reminder *reminder = [self.allReminders objectAtIndex:i];
                if ([reminder isEqual:reminderToDelete]) {
                    [self.allReminders removeObjectAtIndex:i];
                }
            }
        } else if (indexPath.section == 1) {
            reminderToDelete = [self.allReminders objectAtIndex:indexPath.row];
            [self.allReminders removeObjectAtIndex:indexPath.row];
        }
        [self removeNotificationWithReminder:reminderToDelete];
        [self saveReminders];
        [self setUpTodayReminders];
        [self.tableView reloadData];
    }
}


/* We only have section headers in the ACCEPTED section. */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return SECTION_HEADER_HEIGHT;
}

- (void)clickedCheckOnReminder:(Reminder *)reminder {
    reminder.isCompleted = !reminder.isCompleted;
    [self saveReminders];
}

- (void)addNotificationForReminder:(Reminder *)reminder {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    /* Add a separate notification for each day of the week that the user needs to be reminded on. */
    for (int i=0; i < reminder.reminderDays.count; i++) {
        for (int j=0; j < reminder.times.count; j++) {
            int index = j + (i * reminder.times.count);
            NSString *notificationID = [NSString stringWithFormat:@"%@%d", reminder.reminderName, index];
            NSString *weekday = [reminder.reminderDays objectAtIndex:i];
            NSString *timeString = [reminder.times objectAtIndex:j];
            NSDate *date = [Utils getDateFromTime:timeString weekday:weekday];
            NSDateComponents *triggerWeekly = [[NSCalendar currentCalendar]
                                               components:NSCalendarUnitWeekday +
                                               NSCalendarUnitHour + NSCalendarUnitMinute +
                                               NSCalendarUnitSecond fromDate:date];
            UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerWeekly
                                                                                                              repeats:YES];
            UNMutableNotificationContent *content = [UNMutableNotificationContent new];
            content.title = @"Reminder:";
            content.body = reminder.reminderName;
            content.categoryIdentifier = @"UYLReminderCategory";
            content.sound = [UNNotificationSound defaultSound];
            UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:notificationID
                                                                                  content:content trigger:trigger];
            [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
                if (error != nil) {
                    NSLog(@"Something went wrong: %@",error);
                }
            }];
        }
    }
}

- (void)removeNotificationWithReminder:(Reminder *)reminder {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    for (int i=0; i < reminder.reminderDays.count; i++) {
        for (int j=0; j < reminder.times.count; j++) {
            int index = j + (i * reminder.times.count);
            NSString *notificationID = [NSString stringWithFormat:@"%@%d", reminder.reminderName, index];
            [center removePendingNotificationRequestsWithIdentifiers:@[notificationID]];
        }
    }
}

#pragma mark - CreateReminderProtocol 
- (void)createdReminder:(Reminder *)reminder {
    reminder.lastDaySeen = [NSDate date];
    reminder.isCompleted = NO;
    [self.allReminders addObject:reminder];
    [self addNotificationForReminder:reminder];
    [self saveReminders];
    [self setUpTodayReminders];
    [self.tableView reloadData];
}

#pragma mark - EditReminderProtocol 
- (void)savedEditChanges:(Reminder *)reminder {
    /* Any edits they made marks the reminder as now not completed for the day */
    reminder.lastDaySeen = [NSDate date];
    reminder.isCompleted = NO;
    if (self.selectedIndexPath.section == 0) {
        Reminder *oldReminder = [self.todayReminders objectAtIndex:self.selectedIndexPath.row];
        for (int i=0; i < self.allReminders.count; i++) {
            Reminder *reminder = [self.allReminders objectAtIndex:i];
            if ([reminder isEqual:oldReminder]) {
                [self.allReminders replaceObjectAtIndex:i withObject:reminder];
            }
        }
    } else if (self.selectedIndexPath.section == 1) {
        [self.allReminders replaceObjectAtIndex:self.selectedIndexPath.row withObject:reminder];
    }
    [self removeNotificationWithReminder:reminder];
    [self addNotificationForReminder:reminder];
    [self saveReminders];
    [self setUpTodayReminders];
    [self.tableView reloadData];
}

@end
