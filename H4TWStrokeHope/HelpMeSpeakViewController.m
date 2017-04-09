//
//  HelpMeSpeakViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 4/4/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HelpMeSpeakViewController.h"
#import "Constants.h"
#import "Utils.h"
#import "HelpMeSpeakCollectionViewCell.h"

@interface HelpMeSpeakViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;
@property (strong, nonatomic) IBOutlet UIView *searchUnderBar;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchUnderBarLeading;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSArray *allSpeakObjects;
@property NSMutableArray *speakObjectsToDisplay;
@end

#define SEARCH_UNDERBAR_LEADING_CONSTRAINT 26
#define HELP_ME_SPEAK_CELL_IDENTIFIER @"HelpMeSpeakCellIdentifier"
#define SPACE_BETWEEN_CELLS 20
/* Collection cells have height of self.collectionCellWidth + HEIGHT_ADDED_TO_CELL */
#define HEIGHT_ADDED_TO_CELL 40

@implementation HelpMeSpeakViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"HELP ME SPEAK";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    /* Textfield callbacks */
    [self.searchTextField addTarget:self
                               action:@selector(textFieldDidChange:)
                     forControlEvents:UIControlEventEditingChanged];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tap.delegate = self;
    [tap setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tap];
    
    /* Set up speak objects */
    self.allSpeakObjects = @[HELP_ME_SPEAK_YES, HELP_ME_SPEAK_NO, HELP_ME_SPEAK_THANK_YOU, HELP_ME_SPEAK_BATHROOM, HELP_ME_SPEAK_WATER, HELP_ME_SPEAK_FOOD, HELP_ME_SPEAK_NOT_GIVING_UP, HELP_ME_SPEAK_PAIN, HELP_ME_SPEAK_CANT_SPEAK];
    self.speakObjectsToDisplay = [self.allSpeakObjects mutableCopy];
    
    /* Collection view set up */
    [self.collectionView registerNib:[UINib nibWithNibName:@"HelpMeSpeakCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:HELP_ME_SPEAK_CELL_IDENTIFIER];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUpColors];
}

- (void)setUpColors {
    [self.view setBackgroundColor:HFTW_LIGHTEST_GRAY];
    [self.searchButton setTintColor:HFTW_LIGHT_GRAY];
    [self.searchUnderBar setBackgroundColor:HFTW_LIGHTEST_GRAY];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark – UITextField Delegate

/* Called when the user starts typing. Sets the text to reddish/pink, and animates the bottom bar. */
-(void)goIntoSearchMode {
    self.searchTextField.textColor = HFTW_ACCENT;
    [self.view layoutIfNeeded];
    self.searchUnderBarLeading.constant = 0;
    [UIView animateWithDuration:0.3
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         // completion
                     }
     ];
}

/* Animates the bottom bar back to how it was before. If there is no search text, then display all speak objects. */
-(void)exitSearchMode {
    if (self.searchTextField.text.length == 0) {
        self.speakObjectsToDisplay = [self.allSpeakObjects mutableCopy];
        [self.collectionView reloadData];
    }
    [self.view layoutIfNeeded];
    self.searchUnderBarLeading.constant = SEARCH_UNDERBAR_LEADING_CONSTRAINT;
    [UIView animateWithDuration:0.3
                          delay: 0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         // completion
                     }
     ];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self goIntoSearchMode];
}

- (BOOL)textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger oldLength = [textField.text length];
    NSUInteger replacementLength = [string length];
    NSUInteger rangeLength = range.length;
    NSUInteger newLength = oldLength - rangeLength + replacementLength;
    if (textField == self.searchTextField) {
        if (newLength == 0) {
            // set the right image to be a search icon
            [self.searchButton setImage:[UIImage imageNamed:SEARCH_ICON] forState:UIControlStateNormal];
            self.searchButton.enabled = NO;
        } else {
            // set the right image to be a clear button
            [self.searchButton setImage:[UIImage imageNamed:X_ICON] forState:UIControlStateNormal];
            self.searchButton.enabled = YES;
        }
    }
    return YES;
}

/* Performs search */
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField == self.searchTextField) {
        /* Perform search */
        NSString *searchText = [textField.text uppercaseString];
        [self.speakObjectsToDisplay removeAllObjects];
        for (NSString *speakObject in self.allSpeakObjects) {
            NSString *uppercaseSpeakObject = [speakObject uppercaseString];
            if ([uppercaseSpeakObject containsString:searchText]) {
                [self.speakObjectsToDisplay addObject:speakObject];
            }
        }
        [self.collectionView reloadData];
    }
}

- (IBAction)clearButtonPressed:(id)sender {
    self.searchTextField.text = @"";
    [self.searchButton setImage:[UIImage imageNamed:SEARCH_ICON] forState:UIControlStateNormal];
    self.searchButton.enabled = NO;
    [self exitSearchMode];
}

#pragma mark - UITextField Methods

- (void)dismissKeyboard {
    [self.searchTextField resignFirstResponder];
    [self exitSearchMode];
}

#pragma mark – UICollectionView data source

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.speakObjectsToDisplay.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HelpMeSpeakCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:HELP_ME_SPEAK_CELL_IDENTIFIER forIndexPath:indexPath];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HelpMeSpeakCollectionViewCell" owner:self options:nil];
        cell = (HelpMeSpeakCollectionViewCell *)[nib objectAtIndex:0];
    }
    
    NSString *labelText = [self.speakObjectsToDisplay objectAtIndex:indexPath.row];
    UIImage *image = nil;
    
    if ([labelText isEqualToString:HELP_ME_SPEAK_YES]) {
        image = [UIImage imageNamed:YES_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_NO]) {
        image = [UIImage imageNamed:NO_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_THANK_YOU]) {
        image = [UIImage imageNamed:THANK_YOU_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_BATHROOM]) {
        image = [UIImage imageNamed:BATHROOM_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_WATER]) {
        image = [UIImage imageNamed:WATER_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_FOOD]) {
        image = [UIImage imageNamed:FOOD_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_NOT_GIVING_UP]) {
        image = [UIImage imageNamed:NOT_GIVING_UP_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_PAIN]) {
        image = [UIImage imageNamed:PAIN_ICON];
    } else if ([labelText isEqualToString:HELP_ME_SPEAK_CANT_SPEAK]) {
        image = [UIImage imageNamed:CANT_SPEAK_ICON];
    }
    
    [cell layoutCellWithWord:labelText withImage:image];
    return cell;
}

/* Returns size of collection view cell. We want 3 cells per row so calculate what width the cell needs to fit with 10 pixel margins between. */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float collectionViewWidth = CGRectGetWidth(self.collectionView.frame);
    float cellWidth = (collectionViewWidth - (SPACE_BETWEEN_CELLS * 2)) / (3.0);
    return CGSizeMake(cellWidth, cellWidth + HEIGHT_ADDED_TO_CELL);

}

@end
