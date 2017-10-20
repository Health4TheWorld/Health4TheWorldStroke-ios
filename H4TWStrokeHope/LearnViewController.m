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

#define SPACE_BETWEEN_BEFAST_BUTTONS 10

@interface LearnViewController ()
@property (strong, nonatomic) IBOutlet UILabel *signsOfStrokeLabel;
@property (strong, nonatomic) IBOutlet UILabel *topicsLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *learnCategories;
@property (strong, nonatomic) IBOutlet UIView *befastContainer;
@property NSIndexPath *selectedIndexPath;
@property NSMutableArray *befastButtons;
@property (strong, nonatomic) IBOutlet UILabel *befastExplanationLabel;
@end

#define LEARN_CONTENT_CELL_HEIGHT 75

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSLocalizedString(@"Learn.title", nil) uppercaseString];
    self.befastExplanationLabel.text = BEFAST_B;
    self.learnCategories = @[CONTENT_TYPE_FAQ,CONTENT_TYPE_SIGNSOFSTROKE, CONTENT_TYPE_RISKFACTORS,  CONTENT_TYPE_BLOOD_PRESSURE, CONTENT_TYPE_HEART_RATE, CONTENT_TYPE_BLOOD_SUGAR, CONTENT_TYPE_DIET, CONTENT_TYPE_BLADDER_BOWEL, CONTENT_TYPE_EXERCISES, CONTENT_TYPE_SHOWER_BATH, CONTENT_TYPE_HOME_MOD];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
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
    
    [self setUpColors];
}

- (void)setUpColors {
    self.topicsLabel.textColor = HFTW_TEXT_GRAY;
    self.signsOfStrokeLabel.textColor = HFTW_TEXT_GRAY;
    self.befastExplanationLabel.textColor = HFTW_TEXT_GRAY;
}

- (void)viewWillAppear:(BOOL)animated {
    /* Set up nav bar color */
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = HFTW_DARK;

    if (self.selectedIndexPath) {
        [self.tableView deselectRowAtIndexPath:self.selectedIndexPath animated:YES];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [self setUpBeFastButtons];
}

- (void)setUpBeFastButtons {
    if (!self.befastButtons) {
        self.befastButtons = [[NSMutableArray alloc] init];
        CGFloat buttonWidth = (self.befastContainer.frame.size.width - (5 * SPACE_BETWEEN_BEFAST_BUTTONS)) / 6;
        CGFloat startingX = 0;
        for (int i=0; i < 6; i++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(startingX, 0, buttonWidth, buttonWidth)];
            button.titleLabel.font = [UIFont fontWithName:@"Lato-bold" size:18.0];
            button.clipsToBounds = YES;
            button.layer.cornerRadius = buttonWidth/2.0f;
            button.layer.borderColor = HFTW_RED.CGColor;
            button.layer.borderWidth =1.0;
            button.tag = i;
            
            if (i==0) {
                [button setBackgroundColor:HFTW_RED];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            } else {
                [button setBackgroundColor:[UIColor whiteColor]];
                [button setTitleColor:HFTW_RED forState:UIControlStateNormal];
            }
            
            /* Text */
            if (i==0) {
                [button setTitle:NSLocalizedString(@"Learn.b", nil) forState:UIControlStateNormal];
            } else if (i==1) {
                [button setTitle:NSLocalizedString(@"Learn.e", nil) forState:UIControlStateNormal];
            } else if (i==2) {
                [button setTitle:NSLocalizedString(@"Learn.f", nil) forState:UIControlStateNormal];
            } else if (i==3) {
                [button setTitle:NSLocalizedString(@"Learn.a", nil) forState:UIControlStateNormal];
            } else if (i==4) {
                [button setTitle:NSLocalizedString(@"Learn.s", nil) forState:UIControlStateNormal];
            } else if (i==5) {
                [button setTitle:NSLocalizedString(@"Learn.t", nil) forState:UIControlStateNormal];
            }
            
            [button addTarget:self action:@selector(selectedBefastButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [self.befastContainer addSubview:button];
            startingX += (buttonWidth + SPACE_BETWEEN_BEFAST_BUTTONS);
            [self.befastButtons addObject:button];
        }
    }
}
- (void) showImageWithLoadHTMLString {

}
/* Change button appearances and befast explanation. */
- (void)selectedBefastButton:(id)sender {
    UIButton *button = (UIButton *)sender;
    long selectedIndex = button.tag;
    
    for (int i=0; i < 6; i++) {
        UIButton *button = [self.befastButtons objectAtIndex:i];
        if (i==selectedIndex) {
            [button setBackgroundColor:HFTW_RED];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            [button setBackgroundColor:[UIColor whiteColor]];
            [button setTitleColor:HFTW_RED forState:UIControlStateNormal];
        }
    }
    if (selectedIndex == 0) {
        self.befastExplanationLabel.text = BEFAST_B;
    } else if (selectedIndex == 1) {
        self.befastExplanationLabel.text = BEFAST_E;
    } else if (selectedIndex == 2) {
        self.befastExplanationLabel.text = BEFAST_F;
    } else if (selectedIndex == 3) {
        self.befastExplanationLabel.text = BEFAST_A;
    } else if (selectedIndex == 4) {
        self.befastExplanationLabel.text = BEFAST_S;
    } else if (selectedIndex == 5) {
        self.befastExplanationLabel.text = BEFAST_T;
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

@end
