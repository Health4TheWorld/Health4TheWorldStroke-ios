//
//  HomeViewController.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/15/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "HomeViewController.h"
#import "Constants.h"
#import "Utils.h"

@interface HomeViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property UILabel *quote;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self layoutView];
}

- (void)layoutView {
    /* QUOTE */
    self.quote = [[UILabel alloc] init];
    [self.quote setText:@"Sometimes the bad things that happen in our lives put us directly on the path to the best things that will ever happen to us."];
    self.quote.font = [UIFont fontWithName:@"Lato" size:14.0];
    self.quote.textColor = [UIColor whiteColor];
    self.quote.textAlignment = NSTextAlignmentLeft;
    [self.quote sizeToFit];
    CGRect quoteFrame = self.quote.frame;
    quoteFrame.origin.y = 10;
    quoteFrame.size.width = self.view.frame.size.width - (10 * 2);
    
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
