//
//  EnterViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/23/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "EnterViewController.h"
#import "GraphicUtils.h"
#import "Utils.h"
#import "HomeViewController.h"
#import "TermsViewController.h"
#import "LanguageManager.h"
#import "AppDelegate.h"
//#import "AWSDynamoDBHelper.h"


@interface EnterViewController (){
    NSArray *data;
}

@property (weak, nonatomic) IBOutlet UIButton *btnLanguage;
@property (weak, nonatomic) IBOutlet UITableView *tblList;
@property (weak, nonatomic) IBOutlet UIPickerView *languagePicker;
@property (weak, nonatomic) IBOutlet UIView *viewForPicker;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;
@property CGPoint startPosition;
@property NSString *langKey;
@property NSMutableArray *quotes;
@property NSMutableArray *authors;
@property NSMutableArray *circles; /* Circles to navigate between quotes */
@property (weak, nonatomic) IBOutlet UIButton *languageButton;
@property int currentQuoteIndex;
@end

/* Dimensions of image so we can scale it proportionally. */
#define BG_IMAGE_WIDTH 4342.0f
#define BG_IMAGE_HEIGHT 3434.0f
#define BG_IMAGE_NAME @"Patagonia.jpg"

@implementation EnterViewController
-(void)restart
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *storyboardName = @"Main";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
    delegate.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.view setNeedsDisplay];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    data = [LanguageManager languageStrings];
    //static NSString * const LanguageCodes[] = { @"en", @"es_MX", @"fr", @"fil",@"zh_Hans_CN",@"ne_NP",@"sw" };
    //    arrKey = [[NSArray alloc] initWithObjects:@"en",@"es",@"fr",@"fil",@"zh",@"ne",@"sw",nil];//MM
    _arrLanguage = [[NSArray alloc] initWithObjects:@"English",@"Español",@"Français",@"Filipino",@"汉语/漢語",@"नेपाली", @"Kiswahili", nil];//MM
    //        self.languagePicker.dataSource = self;
    //        self.languagePicker.delegate = self;
    [self addBackgroundImage];
    [self setUpQuote];
    
    [GraphicUtils styleButton:self.enterButton];
    [self.enterButton setTitle:[NSLocalizedString(@"Enter.enterButton", nil) uppercaseString] forState:UIControlStateNormal];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft ];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight ];
    [self.view addGestureRecognizer:swipeRight];
}

-(void) tap:(UITapGestureRecognizer *)recognizer{
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    /* If first launch, then show disclaimer popup */
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"aValue"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"aValue"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        /* Show disclaimer */
        TermsViewController *controller = [[TermsViewController alloc] initWithNibName:@"TermsViewController" bundle:nil];
        controller.modalPresentationStyle = UIModalPresentationPopover;
        controller.preferredContentSize = CGSizeMake(150, 300);
        UIPopoverPresentationController *popover =  controller.popoverPresentationController;
        popover.sourceView = self.view;
        popover.sourceRect = self.view.frame;
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
        // display the controller in the usual way
        [self presentViewController:controller animated:YES completion:nil];
    }
    
}


/* Creates a quote label with the given text in Lato-light 22.0, 120 pixels from the top of the screen, centered horizontally, with 20 pixel borders on left and right. */
+ (UILabel *)getQuoteLabelWithText:(NSString *)quoteText offscreen:(BOOL)isOffscreen {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIFont *quoteFont = [UIFont fontWithName:@"Lato-light" size:22.0];
    /* QUOTE */
    UILabel *quote = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, screenWidth, 0)];
    quote.font = quoteFont;
    quote.textAlignment = NSTextAlignmentCenter;
    quote.text = quoteText;
    quote.numberOfLines = 0;
    [quote sizeToFit];
    CGRect quoteFrame = quote.frame;
    quoteFrame.size.width = screenWidth - 40;
    if (isOffscreen) {
        quoteFrame.origin.x = screenWidth + 20;
    }
    quoteFrame.origin.y = ([UIScreen mainScreen].bounds.size.height /2) - 60;//MM
    quoteFrame.size.height = [Utils heightOfString:quoteText containedToWidth:quoteFrame.size.width withFont:quoteFont];
    quote.frame = quoteFrame;
    return quote;
}

/* Creates an author label with the given text, 20 pixels below the bottom of |quoteLabel|, centered horizontally on the screen, Lato-light 22.0 */
+ (UILabel *)getAuthorLabelWithText:(NSString *)authorName forQuoteLabel:(UILabel *)quoteLabel offScreen:(BOOL)isOffscreen {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIFont *quoteFont = [UIFont fontWithName:@"Lato-light" size:22.0];
    /* AUTHOR */
    UILabel *authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, quoteLabel.frame.origin.y + quoteLabel.frame.size.height + 20, screenWidth, 0)];
    authorLabel.font = quoteFont;
    authorLabel.text = authorName;
    authorLabel.textAlignment = NSTextAlignmentCenter;
    [authorLabel sizeToFit];
    CGRect authorLabelFrame = authorLabel.frame;
    authorLabelFrame.size.width = screenWidth;
    if (isOffscreen) {
        authorLabelFrame.origin.x = screenWidth;
    }
    authorLabel.frame = authorLabelFrame;
    return authorLabel;
}

/* Adds the background image programatically to ensure we maintain proportions regardless of screne size. */
- (void)addBackgroundImage {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = (BG_IMAGE_WIDTH * screenHeight)/BG_IMAGE_HEIGHT;
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, screenHeight)];
    [bgImage setImage:[UIImage imageNamed:BG_IMAGE_NAME]];
    bgImage.center = self.view.center;
    [self.view addSubview:bgImage];
    [self.view sendSubviewToBack:bgImage];
}

- (void)setUpQuote {
    self.quotes = [[NSMutableArray alloc] init];
    self.authors = [[NSMutableArray alloc] init];
    
    /* First quote */
    UILabel *firstQuote = [EnterViewController getQuoteLabelWithText:NSLocalizedString(@"Enter.firstQuote", nil) offscreen:NO];
    UILabel *firstAuthorLabel = [EnterViewController getAuthorLabelWithText:NSLocalizedString(@"Enter.firstAuthor", nil) forQuoteLabel:firstQuote offScreen:NO];
    [self.view addSubview:firstQuote];
    [self.view addSubview:firstAuthorLabel];
    
    [self.quotes addObject:firstQuote];
    [self.authors addObject:firstAuthorLabel];
    
    /* Second quote */
    UILabel *secondQuote = [EnterViewController getQuoteLabelWithText:NSLocalizedString(@"Enter.secondQuote", nil) offscreen:YES];
    UILabel *secondAuthorLabel = [EnterViewController getAuthorLabelWithText:NSLocalizedString(@"Enter.secondAuthor", nil) forQuoteLabel:secondQuote offScreen:YES];
    
    [self.view addSubview:secondQuote];
    [self.view addSubview:secondAuthorLabel];
    
    [self.quotes addObject:secondQuote];
    [self.authors addObject:secondAuthorLabel];
    
    /* Fourth quote */
    UILabel *fourthQuote = [EnterViewController getQuoteLabelWithText:NSLocalizedString(@"Enter.fourthQuote", nil) offscreen:YES];
    UILabel *fourthAuthorLabel = [EnterViewController getAuthorLabelWithText:NSLocalizedString(@"Enter.fourthAuthor", nil) forQuoteLabel:fourthQuote offScreen:YES];
    
    [self.view addSubview:fourthQuote];
    [self.view addSubview:fourthAuthorLabel];
    
    [self.quotes addObject:fourthQuote];
    [self.authors addObject:fourthAuthorLabel];
    
    /* Fifth quote */
    UILabel *fifthQuote = [EnterViewController getQuoteLabelWithText:NSLocalizedString(@"Enter.fifthQuote", nil) offscreen:YES];
    UILabel *fifthAuthorLabel = [EnterViewController getAuthorLabelWithText:NSLocalizedString(@"Enter.fifthAuthor", nil) forQuoteLabel:fifthQuote offScreen:YES];
    
    [self.view addSubview:fifthQuote];
    [self.view addSubview:fifthAuthorLabel];
    
    [self.quotes addObject:fifthQuote];
    [self.authors addObject:fifthAuthorLabel];
    
    /* Sixth quote */
    UILabel *sixthQuote = [EnterViewController getQuoteLabelWithText:NSLocalizedString(@"Enter.sixthQuote", nil) offscreen:YES];
    UILabel *sixthAuthorLabel = [EnterViewController getAuthorLabelWithText:NSLocalizedString(@"Enter.sixthAuthor", nil) forQuoteLabel:sixthQuote offScreen:YES];
    
    [self.view addSubview:sixthQuote];
    [self.view addSubview:sixthAuthorLabel];
    
    [self.quotes addObject:sixthQuote];
    [self.authors addObject:sixthAuthorLabel];
    
    /* Seventh quote */
    UILabel *seventhQuote = [EnterViewController getQuoteLabelWithText:NSLocalizedString(@"Enter.seventhQuote", nil) offscreen:YES];
    UILabel *seventhAuthorLabel = [EnterViewController getAuthorLabelWithText:NSLocalizedString(@"Enter.seventhAuthor", nil) forQuoteLabel:seventhQuote offScreen:YES];
    
    [self.view addSubview:seventhQuote];
    [self.view addSubview:seventhAuthorLabel];
    
    [self.quotes addObject:seventhQuote];
    [self.authors addObject:seventhAuthorLabel];
    
    self.currentQuoteIndex = 0;
    
    /* Add circles below quote that show which index you're on */
    self.circles = [[NSMutableArray alloc] init];
    static int spaceBetweenCircles = 10;
    static int circleWidth = 10;
    float totalWidth = (self.quotes.count * circleWidth) + ((self.quotes.count - 1) * spaceBetweenCircles);
    float startingX = self.view.center.x - (totalWidth/2);
    float startingY = firstAuthorLabel.frame.origin.y + firstAuthorLabel.frame.size.height + 70;
    for (int i=0; i < self.quotes.count; i++) {
        UIButton *circle = [[UIButton alloc] initWithFrame:CGRectMake(startingX, startingY, circleWidth, circleWidth)];
        if (i > 0) {
            circle.alpha = 0.2;
        }
        circle.layer.cornerRadius = 5;
        circle.tag = i;
        [circle addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        [circle setBackgroundColor:[UIColor blackColor]];
        startingX += circleWidth;
        startingX += spaceBetweenCircles;
        [self.circles addObject:circle];
        [self.view addSubview:circle];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterPressed:(id)sender {
    HomeViewController *hvc = [[HomeViewController alloc] init];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:hvc animated:YES];
}

#pragma mark – Swipe Gesture Recognizer

- (IBAction)swipedRight:(UISwipeGestureRecognizer *)recognizer
{
    [self closeList];
    if (self.currentQuoteIndex > 0) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        /* Update quote frames */
        UILabel *quoteToMoveOffscreen = [self.quotes objectAtIndex:self.currentQuoteIndex];
        UILabel *authorToMoveOffscreen = [self.authors objectAtIndex:self.currentQuoteIndex];
        self.currentQuoteIndex--;
        UILabel *quoteToMoveCenter = [self.quotes objectAtIndex:self.currentQuoteIndex];
        UILabel *authorToMoveCenter = [self.authors objectAtIndex:self.currentQuoteIndex];
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
            /* Move current quote left */
            CGRect offscreenFrame = quoteToMoveOffscreen.frame;
            offscreenFrame.origin.x += screenWidth;
            quoteToMoveOffscreen.frame = offscreenFrame;
            CGRect offscreenAuthorFrame = authorToMoveOffscreen.frame;
            offscreenAuthorFrame.origin.x += screenWidth;
            authorToMoveOffscreen.frame = offscreenAuthorFrame;
            /* Move next quote to center */
            CGRect centerQuoteFrame = quoteToMoveCenter.frame;
            centerQuoteFrame.origin.x += screenWidth;
            quoteToMoveCenter.frame = centerQuoteFrame;
            CGRect centerAuthorFrame = authorToMoveCenter.frame;
            centerAuthorFrame.origin.x += screenWidth;
            authorToMoveCenter.frame = centerAuthorFrame;
        } completion:^(BOOL finished) {
            //code for completion
        }];
        
        /* Update circles */
        for (int i=0; i < self.quotes.count; i++) {
            UIView *circle = [self.circles objectAtIndex:i];
            if (i == self.currentQuoteIndex) {
                circle.alpha = 1.0;
            } else {
                circle.alpha = 0.2;
            }
        }
    }
}
- (IBAction)btnLanguageChanged:(id)sender {
    [self showPicker];
}

-(void)closeList{
    _tblList.hidden = YES;
}

- (IBAction)swipedLeft:(UISwipeGestureRecognizer *)recognizer
{
    [self closeList];
    if (self.currentQuoteIndex < (self.quotes.count - 1)) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        /* Update quote frames */
        UILabel *quoteToMoveOffscreen = [self.quotes objectAtIndex:self.currentQuoteIndex];
        UILabel *authorToMoveOffscreen = [self.authors objectAtIndex:self.currentQuoteIndex];
        self.currentQuoteIndex++;
        UILabel *quoteToMoveCenter = [self.quotes objectAtIndex:self.currentQuoteIndex];
        UILabel *authorToMoveCenter = [self.authors objectAtIndex:self.currentQuoteIndex];
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
            /* Move current quote left */
            CGRect offscreenFrame = quoteToMoveOffscreen.frame;
            offscreenFrame.origin.x -= screenWidth;
            quoteToMoveOffscreen.frame = offscreenFrame;
            CGRect offscreenAuthorFrame = authorToMoveOffscreen.frame;
            offscreenAuthorFrame.origin.x -= screenWidth;
            authorToMoveOffscreen.frame = offscreenAuthorFrame;
            /* Move next quote to center */
            CGRect centerQuoteFrame = quoteToMoveCenter.frame;
            centerQuoteFrame.origin.x -= screenWidth;
            quoteToMoveCenter.frame = centerQuoteFrame;
            CGRect centerAuthorFrame = authorToMoveCenter.frame;
            centerAuthorFrame.origin.x -= screenWidth;
            authorToMoveCenter.frame = centerAuthorFrame;
        } completion:^(BOOL finished) {
            //code for completion
        }];
        /* Update circles */
        for (int i=0; i < self.quotes.count; i++) {
            UIView *circle = [self.circles objectAtIndex:i];
            if (i == self.currentQuoteIndex) {
                circle.alpha = 1.0;
            } else {
                circle.alpha = 0.2;
            }
        }
    }
}

/* Shifts the given label to the left by one screen width. */
+ (void)shiftLabelScreenWidthLeft:(UILabel *)labelToMove {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGRect frame = labelToMove.frame;
    frame.origin.x -= screenWidth;
    labelToMove.frame = frame;
}

/* Shifts the given label to the right by one screen width. */
+ (void)shiftLabelScreenWidthRight:(UILabel *)labelToMove {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGRect frame = labelToMove.frame;
    frame.origin.x += screenWidth;
    labelToMove.frame = frame;
}

/* Called when the user clicks on one of the circle buttons below the quotes. Should change the quote to display the index of that quote. */
- (void)clickedButton:(UIButton*)sender {
    int buttonIndex = (int)sender.tag;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut  animations:^{
        if (self.currentQuoteIndex < buttonIndex) {
            /* Quote will be coming from the right. */
            /* Move the currently on screen quote off screen to the left. */
            [EnterViewController shiftLabelScreenWidthLeft:[self.quotes objectAtIndex:self.currentQuoteIndex]];
            [EnterViewController shiftLabelScreenWidthLeft:[self.authors objectAtIndex:self.currentQuoteIndex]];
            /* Move any quotes between the currently on screen one and the target on screen one off screen (2 screen widths to the left, because they were already off screen to the right) */
            for (int i=self.currentQuoteIndex + 1; i < buttonIndex; i++) {
                [EnterViewController shiftLabelScreenWidthLeft:[self.quotes objectAtIndex:i]];
                [EnterViewController shiftLabelScreenWidthLeft:[self.quotes objectAtIndex:i]];
                [EnterViewController shiftLabelScreenWidthLeft:[self.authors objectAtIndex:i]];
                [EnterViewController shiftLabelScreenWidthLeft:[self.authors objectAtIndex:i]];
            }
            /* Move the target on screen quote on screen by moving it one screen width over to the left. */
            [EnterViewController shiftLabelScreenWidthLeft:[self.quotes objectAtIndex:buttonIndex]];
            [EnterViewController shiftLabelScreenWidthLeft:[self.authors objectAtIndex:buttonIndex]];
        } else if (self.currentQuoteIndex > buttonIndex) {
            /* Quote will be coming from the left. */
            /* Move the currently on screen quote off screen to the right. */
            [EnterViewController shiftLabelScreenWidthRight:[self.quotes objectAtIndex:self.currentQuoteIndex]];
            [EnterViewController shiftLabelScreenWidthRight:[self.authors objectAtIndex:self.currentQuoteIndex]];
            /* Move any quotes between the currently on screen one and the target on screen one off screen (2 screen widths to the right, because they were already off screen to the left) */
            for (int i=buttonIndex + 1; i < self.currentQuoteIndex; i++) {
                [EnterViewController shiftLabelScreenWidthRight:[self.quotes objectAtIndex:i]];
                [EnterViewController shiftLabelScreenWidthRight:[self.quotes objectAtIndex:i]];
                [EnterViewController shiftLabelScreenWidthRight:[self.authors objectAtIndex:i]];
                [EnterViewController shiftLabelScreenWidthRight:[self.authors objectAtIndex:i]];
            }
            /* Move the target on screen quote on screen by moving it one screen width over to the right. */
            [EnterViewController shiftLabelScreenWidthRight:[self.quotes objectAtIndex:buttonIndex]];
            [EnterViewController shiftLabelScreenWidthRight:[self.authors objectAtIndex:buttonIndex]];
        }
        
    } completion:^(BOOL finished) {
        //code for completion
    }];
    
    /* Update circles */
    self.currentQuoteIndex = buttonIndex;
    for (int i=0; i < self.quotes.count; i++) {
        UIView *circle = [self.circles objectAtIndex:i];
        if (i == self.currentQuoteIndex) {
            circle.alpha = 1.0;
        } else {
            circle.alpha = 0.2;
        }
    }    
}

#pragma UIPicker delegate
-(void)showPicker{
    _tblList.hidden = false;
    [self.view bringSubviewToFront:self.tblList];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *SimpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentifier];
    if (cell == nil) {
        cell = ([[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:(SimpleIdentifier)]);
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_arrLanguage objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ELanguageCount;//arrLanguage.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [_btnLanguage setTitle:cell.textLabel.text forState:UIControlStateNormal];
    [LanguageManager saveLanguageByIndex:indexPath.row];
    [self restart];
}

@end
//- (IBAction)enterPressed:(id)sender {
//        self.passwordAuthenticationCompletion.result = [[AWSCognitoIdentityPasswordAuthenticationDetails alloc] initWithUsername:self.usernameTF.text password:self.passwordTF.text];
//
//    HomeViewController *hvc = [[HomeViewController alloc] init];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    [self.navigationController pushViewController:hvc animated:YES];
//
//      /* insert app usage info into table*/
//    NSArray *data = @[@"Tap",@"Login", @"NA"];
//    [AWSDynamoDBHelper detailedAppUsage: data];
//}
//- (IBAction)signUpPressed:(id)sender {
//
//}

//- (void)didCompletePasswordAuthenticationStepWithError:(NSError * _Nullable)error {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if(error){
//            [[[UIAlertView alloc] initWithTitle:error.userInfo[@"__type"]
//                                        message:error.userInfo[@"message"]
//                                       delegate:nil
//                              cancelButtonTitle:nil
//                              otherButtonTitles:@"Retry", nil] show];
//        }else{
//            self.usernameText = nil;
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    });
//}
//
//- (void)getPasswordAuthenticationDetails:(nonnull AWSCognitoIdentityPasswordAuthenticationInput *)authenticationInput passwordAuthenticationCompletionSource:(nonnull AWSTaskCompletionSource<AWSCognitoIdentityPasswordAuthenticationDetails *> *)passwordAuthenticationCompletionSource {
//    self.passwordAuthenticationCompletion = passwordAuthenticationCompletionSource;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if(!self.usernameText)
//            self.usernameText = authenticationInput.lastKnownUsername;
//    });
//}

//@end
