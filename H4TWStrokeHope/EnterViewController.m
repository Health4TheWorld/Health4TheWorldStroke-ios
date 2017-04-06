//
//  EnterViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/23/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "EnterViewController.h"
#import "GraphicUtils.h"
#import "HomeViewController.h"

@interface EnterViewController ()
@property (strong, nonatomic) IBOutlet UIButton *enterButton;
@property CGPoint startPosition;
@property NSMutableArray *quotes;
@property NSMutableArray *authors;
@property NSMutableArray *circles; /* Circles to navigate between quotes */
@property int currentQuoteIndex;
@end

/* Dimensions of image so we can scale it proportionally. */
#define BG_IMAGE_WIDTH 4342.0f
#define BG_IMAGE_HEIGHT 3434.0f
#define BG_IMAGE_NAME @"Patagonia.jpg"
@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackgroundImage];
    [GraphicUtils styleButton:self.enterButton];
    [self setUpQuote];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft ];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight ];
    [self.view addGestureRecognizer:swipeRight];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
    UILabel *firstQuote = [EnterViewController getQuoteLabelWithText:@"\"Sometimes the bad things that happen in our lives put us directly on the path to the best things that will ever happen to us.\"" offscreen:NO];
    UILabel *firstAuthorLabel = [EnterViewController getAuthorLabelWithText:@" – Nicole Reed" forQuoteLabel:firstQuote offScreen:NO];
    
    [self.view addSubview:firstQuote];
    [self.view addSubview:firstAuthorLabel];

    [self.quotes addObject:firstQuote];
    [self.authors addObject:firstAuthorLabel];
    
    /* Second quote */
    UILabel *secondQuote = [EnterViewController getQuoteLabelWithText:@"\"We must let go of the life we have planned, so as to accept the one that is waiting for us.\"" offscreen:YES];
    UILabel *secondAuthorLabel = [EnterViewController getAuthorLabelWithText:@"– Joseph Campbell" forQuoteLabel:secondQuote offScreen:YES];
    
    [self.view addSubview:secondQuote];
    [self.view addSubview:secondAuthorLabel];
    
    [self.quotes addObject:secondQuote];
    [self.authors addObject:secondAuthorLabel];
    
    /* Third quote */
    UILabel *thirdQuote = [EnterViewController getQuoteLabelWithText:@"\"The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.\"" offscreen:YES];
    UILabel *thirdAuthorLabel = [EnterViewController getAuthorLabelWithText:@"– Helen Keller" forQuoteLabel:thirdQuote offScreen:YES];
    
    [self.view addSubview:thirdQuote];
    [self.view addSubview:thirdAuthorLabel];
    
    [self.quotes addObject:thirdQuote];
    [self.authors addObject:thirdAuthorLabel];
    

    self.currentQuoteIndex = 0;
    
    /* Add circles below quote that show which index you're on */
    self.circles = [[NSMutableArray alloc] init];
    static int spaceBetweenCircles = 10;
    static int circleWidth = 10;
    float totalWidth = (self.quotes.count * circleWidth) + ((self.quotes.count - 1) * spaceBetweenCircles);
    float startingX = self.view.center.x - (totalWidth/2);
    float startingY = firstAuthorLabel.frame.origin.y + firstAuthorLabel.frame.size.height + 40;
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

- (IBAction)swipedLeft:(UISwipeGestureRecognizer *)recognizer
{
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

@end