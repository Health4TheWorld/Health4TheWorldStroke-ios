//
//  QuotesViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 6/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "QuotesViewController.h"
#import "Constants.h"
#import "QuotesCollectionViewCell.h"

@interface QuotesViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *quotesArray;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;
@property (nonatomic, retain) NSString *currentDate;

@end

#define BG_IMAGE_NAME @"Patagonia.jpg"
@implementation QuotesViewController
static NSString * const reuseIdentifier = @"QuotesCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Quotes";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    // QUote Label
    self.quoteLabel.text = QUOTE_LABEL;
    
    [self setupView];
}
-(void) setupView{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"QuotesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    // Randomly pick an URL.
    [self randomizer];
    
    NSString *quoteToDisplay = @"%22An+unexaminced+life%22.png";
    NSString *urlForQuotesArray = [NSString stringWithFormat:@"https://s3-us-west-1.amazonaws.com/h4twappquotes/%@", quoteToDisplay];
    
    NSLog(@"url String : %@", urlForQuotesArray);
    
    // Set the resulting URL
    self.quotesArray = @[urlForQuotesArray];

    
}
// method to randomize quote based on current date
-(void) randomizer{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    self.currentDate = [df stringFromDate:[NSDate date]];
    NSLog(@"%@", self.currentDate);
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _quotesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    QuotesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];
    //cell.imageView.image = [UIImage imageNamed: [self.quotesArray objectAtIndex:indexPath.item]];
    NSURL *imageURL = [NSURL URLWithString:[self.quotesArray objectAtIndex:indexPath.item]];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
        cell.imageView.image = [UIImage imageWithData:imageData];
        });
    });
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    self.bgImage.image = [UIImage imageNamed: [self.quotesArray objectAtIndex: indexPath.item]];
//    self.collectionView.hidden =true;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
//    self.bgImage.image = nil;
//    self.collectionView.hidden =false;
}


@end
