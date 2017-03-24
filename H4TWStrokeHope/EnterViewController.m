//
//  EnterViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/23/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "EnterViewController.h"
#import "GraphicUtils.h"

@interface EnterViewController ()
@property (strong, nonatomic) IBOutlet UIButton *enterButton;
@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;
@property (strong, nonatomic) IBOutlet UILabel *authorLabel;
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
    [self.quotes addObject:@"\"Sometimes the bad things that happen in our lives put us directly on the path to the best things that will ever happen to us.\""];
    [self.authors addObject:@"– Nicole Reed"];
    
    [self.quotes addObject:@"\"We must let go of the life we have planned, so as to accept the one that is waiting for us.\""];
    [self.authors addObject:@"– Joseph Campbell"];
    
    [self.quotes addObject:@"\"The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.\""];
    [self.authors addObject:@"– Helen Keller"];
    
    self.quoteLabel.text = [self.quotes objectAtIndex:0];
    self.authorLabel.text = [self.authors objectAtIndex:0];
    self.currentQuoteIndex = 0;
    
    /* Add circles below quote that show which index you're on */
    self.circles = [[NSMutableArray alloc] init];
    static int spaceBetweenCircles = 10;
    static int circleWidth = 10;
    float totalWidth = (self.quotes.count * circleWidth) + ((self.quotes.count - 1) * spaceBetweenCircles);
    float startingX = self.view.center.x - (totalWidth/2);
    float startingY = self.authorLabel.frame.origin.y + self.authorLabel.frame.size.height + 20;
    for (int i=0; i < self.quotes.count; i++) {
        UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(startingX, startingY, circleWidth, circleWidth)];
        if (i > 0) {
            circle.alpha = 0.2;
        }
        circle.layer.cornerRadius = 5;
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

#pragma mark – Swipe Gesture Recognizer

- (IBAction)swipedRight:(UISwipeGestureRecognizer *)recognizer
{
    if (self.currentQuoteIndex > 0) {
        self.currentQuoteIndex--;
        [self.quoteLabel setText:[self.quotes objectAtIndex:self.currentQuoteIndex]];
        [self.authorLabel setText:[self.authors objectAtIndex:self.currentQuoteIndex]];
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
        self.currentQuoteIndex++;
        [self.quoteLabel setText:[self.quotes objectAtIndex:self.currentQuoteIndex]];
        [self.authorLabel setText:[self.authors objectAtIndex:self.currentQuoteIndex]];
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
@end
