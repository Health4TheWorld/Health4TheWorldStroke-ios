//
//  EditReminderViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "EditReminderViewController.h"
#import "Constants.h" 
#import "NoResultsTableViewCell.h"
#import "Utils.h"
#import "AddReminderTitleViewController.h"
#import "AddReminderFrequencyViewController.h"
#import "AddReminderTimesViewController.h"

@interface EditReminderViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSIndexPath *selectedIndexPath;
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@end

#define SECTION_HEADER_HEIGHT 40
#define CELL_HEIGHT 50

#define EDIT_REMINDER_TITLE_SECTION 0
#define EDIT_REMINDER_FREQUENCY_SECTION 1
#define EDIT_REMINDER_TIME_SECTION 2

@implementation EditReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"EDIT REMINDER";
    
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

    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self setUpColors];
}

- (void)setUpColors {
    self.saveButton.backgroundColor = HFTW_MAGENTA;
    self.saveButton.clipsToBounds = YES;
    self.saveButton.layer.cornerRadius = 10;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)getReminderFrequencyDescription {
    if (self.reminder.reminderDays.count == 7) {
        return @"Daily.";
    } else if (self.reminder.reminderDays.count == 1) {
        return [NSString stringWithFormat:@"Weekly; every %@.", [self.reminder.reminderDays objectAtIndex:0]];
    }
    NSString *timeStr = @"Custom; every ";
    for (int i=0; i < self.reminder.reminderDays.count; i++) {
        NSString *day = [[self.reminder.reminderDays objectAtIndex:i] capitalizedString];
        
        if (i == (self.reminder.reminderDays.count - 1)) {
            timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"and %@.", day]];
        } else {
            /* If it's the second to last day and only two days, don't include comma */
            if ((i == (self.reminder.reminderDays.count - 2))&&(self.reminder.reminderDays.count == 2)) {
                timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"%@ ", day]];
            } else {
                timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"%@, ", day]];
            }
        }
    }
    return timeStr;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"NoResultsCellIdentifier";
    
    NoResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NoResultsTableViewCell" owner:self options:nil];
        cell = (NoResultsTableViewCell *)[nib objectAtIndex:0];
    }
    
    if (indexPath.section == EDIT_REMINDER_TITLE_SECTION) {
        /* Reminder name */
        cell.mainLabel.text = self.reminder.reminderName;
    } else if (indexPath.section == EDIT_REMINDER_FREQUENCY_SECTION) {
        /* Reminder frequency */
        NSString *timeStr = [self getReminderFrequencyDescription];
        cell.mainLabel.text = timeStr;
    } else if (indexPath.section == EDIT_REMINDER_TIME_SECTION) {
        /* Reminder time */
        NSString *timeStr = @"";
        for (int i=0; i < self.reminder.times.count; i++) {
            NSString *currTime = [self.reminder.times objectAtIndex:i];
            if (i == (self.reminder.times.count - 1)) {
                timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"%@", currTime]];
            } else {
                timeStr = [timeStr stringByAppendingString:[NSString stringWithFormat:@"%@, ", currTime]];
            }
        }
        cell.mainLabel.text = timeStr;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    if (indexPath.section == EDIT_REMINDER_TITLE_SECTION) {
        AddReminderTitleViewController *vc = [[AddReminderTitleViewController alloc] init];
        vc.delegate = self;
        vc.isEditing = YES;
        vc.reminder = self.reminder;
        vc.modalPresentationStyle = UIModalPresentationPopover;
        vc.preferredContentSize = CGSizeMake(150, 300);
        // configure popover style & delegate
        UIPopoverPresentationController *popover =  vc.popoverPresentationController;
        popover.delegate = self;
        popover.sourceView = self.view;
        popover.sourceRect = self.view.frame;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        // display the controller in the usual way
        [self presentViewController:vc animated:YES completion:nil];
    } else if (indexPath.section == EDIT_REMINDER_FREQUENCY_SECTION) {
        AddReminderFrequencyViewController *vc = [[AddReminderFrequencyViewController alloc] init];
        vc.delegate = self;
        vc.isEditing = YES;
        vc.reminder = self.reminder;
        vc.modalPresentationStyle = UIModalPresentationPopover;
        vc.preferredContentSize = CGSizeMake(150, 300);
        // configure popover style & delegate
        UIPopoverPresentationController *popover =  vc.popoverPresentationController;
        popover.delegate = self;
        popover.sourceView = self.view;
        popover.sourceRect = self.view.frame;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        // display the controller in the usual way
        [self presentViewController:vc animated:YES completion:nil];
    } else if (indexPath.section == EDIT_REMINDER_TIME_SECTION) {
        AddReminderTimesViewController *vc = [[AddReminderTimesViewController alloc] init];
        vc.delegate = self;
        vc.isEditing = YES;
        vc.reminder = self.reminder;
        vc.modalPresentationStyle = UIModalPresentationPopover;
        vc.preferredContentSize = CGSizeMake(150, 300);
        // configure popover style & delegate
        UIPopoverPresentationController *popover =  vc.popoverPresentationController;
        popover.delegate = self;
        popover.sourceView = self.view;
        popover.sourceRect = self.view.frame;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        // display the controller in the usual way
        [self presentViewController:vc animated:YES completion:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section == EDIT_REMINDER_FREQUENCY_SECTION) {
        /* Check if label is long */
        float width = self.tableView.frame.size.width - (16 * 2);
        NSInteger numLinesNeeded = [Utils numberOfLinesForString:[self getReminderFrequencyDescription] constrainedToWidth:width withFont:[UIFont fontWithName:@"Avenir Book" size:17.0]];
        if (numLinesNeeded > 1) {
            return (CELL_HEIGHT * 2);
        }
    }
    return CELL_HEIGHT;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *sectionName;
    switch (section)
    {
        case EDIT_REMINDER_TITLE_SECTION:
            sectionName = @"Remind me to...";
            break;
        case EDIT_REMINDER_FREQUENCY_SECTION:
            sectionName = @"How often?";
            break;
        case EDIT_REMINDER_TIME_SECTION:
            sectionName = @"What time(s)?";
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
    [label setFont:[UIFont fontWithName:@"Avenir-heavy" size:14]];
    [label setTextColor:HFTW_TEXT_GRAY];
    NSString *sectionName;
    switch (section)
    {
        case EDIT_REMINDER_TITLE_SECTION:
            sectionName = @"Remind me to...";
            break;
        case 1:
            sectionName = @"How often?";
            break;
        case 2:
            sectionName = @"What time(s)?";
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

#pragma mark - delegates

- (void)editedReminderTitle:(NSString *)newTitle {
    self.reminder.reminderName = newTitle;
    [self.tableView reloadData];
}

- (void)editedReminderFrequency:(NSMutableArray *)days {
    self.reminder.reminderDays = days;
    [self.tableView reloadData];
}

- (void)editedReminderTimes:(NSMutableArray *)times {
    self.reminder.times = times;
    [self.tableView reloadData];
}

- (IBAction)saveChangesPressed:(id)sender {
    [self.delegate savedEditChanges:self.reminder];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
