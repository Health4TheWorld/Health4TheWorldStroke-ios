//
//  CareGiverViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 6/17/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "CareGiverViewController.h"
#import "Constants.h"
#import "LearnContentTypeTableViewCell.h"
#import "LearnContentViewController.h"
#import "LearnContent.h"

@interface CareGiverViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSIndexPath *selectedIndexPath;
@property NSArray *learnCategories;

@end

@implementation CareGiverViewController
#define LEARN_CONTENT_CELL_HEIGHT 75


-(void)viewWillAppear:(BOOL)animated{
    /* Set up nav bar color */
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = HFTW_RED;
    self.navigationController.title = @"Care Giver";

    if (self.selectedIndexPath) {
        [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:YES];
    }
}

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [backButton setTintColor: HFTW_DARK];
    [[self navigationItem] setBackBarButtonItem:backButton];
    _tableView.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.learnCategories = @[CONTENT_TYPE_PostStrokeConcerns,CONTENT_TYPE_Aphasia,CONTENT_TYPE_Cognition, CONTENT_TYPE_ManagingAndImprovingCognitiveDeficits,  CONTENT_TYPE_Dysphagia, CONTENT_TYPE_Confinement, CONTENT_TYPE_Incontinence, CONTENT_TYPE_ManagingIncontinence, CONTENT_TYPE_MuscleParalysisAndWeakness, CONTENT_TYPE_MedicationAdherenceAndCompliance, CONTENT_TYPE_MedicationAdherence, CONTENT_TYPE_Nutrition, CONTENT_TYPE_PersonalCare,CONTENT_TYPE_SelfCareForTheCaregiver,CONTENT_TYPE_RespiteCare, CONTENT_TYPE_Seizures, CONTENT_TYPE_Sleep, CONTENT_TYPE_EmotionalReactionsPostStroke, CONTENT_TYPE_NavigatingEmotionalAndBehavioralChanges, CONTENT_TYPE_WorksCited];

    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    _tableView.scrollEnabled = YES;
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
    NSString *category = [self.learnCategories objectAtIndex:indexPath.row];
    cell.textLabel.text = category;
    cell.textLabel.font = [UIFont fontWithName:@"Lato-light" size:20.0];
    NSString *imageName = [LearnContent getImageNameForType:category];
    if (imageName.length > 0) {
        [cell.rightImageView setImage:[UIImage imageNamed:imageName]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndexPath = indexPath;
    LearnContentViewController *dest = [[LearnContentViewController alloc] init];
    //        if(indexPath.row == 1 || indexPath.row == 2){
    //            dest.justImage = TRUE;
    //            NSLog(@"Change scrollview size");
    //        }else{
    //            dest.justImage = FALSE;
    //        }
   dest.content = [[LearnContent alloc] initWithContentTitle:[self.learnCategories objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:dest animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return LEARN_CONTENT_CELL_HEIGHT;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
