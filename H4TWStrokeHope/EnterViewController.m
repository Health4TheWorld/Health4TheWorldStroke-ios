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
    self.quoteLabel.text = @"\"Sometimes the bad things that happen in our lives put us directly on the path to the best things that will ever happen to us.\"";
    self.authorLabel.text = @"– Nicole Reed";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
