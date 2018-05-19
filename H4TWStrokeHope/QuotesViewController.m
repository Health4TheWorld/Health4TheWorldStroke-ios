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
#import "AWSDynamoDBHelper.h"

@interface QuotesViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong) NSArray *quotesArray;
@property (strong, nonatomic) IBOutlet UIImageView *bgImage;
//@property (strong, nonatomic) IBOutlet UILabel *quoteLabel;
@property (nonatomic, retain) NSString *currentDate;
@property (nonatomic,strong) NSArray *quoteToDisplayArray;

@end

#define BG_IMAGE_NAME @"Patagonia.jpg"
@implementation QuotesViewController
static NSString * const reuseIdentifier = @"QuotesCell";

-(void)viewDidDisappear:(BOOL)animated{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"All.backButton", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"Quotes.title", nil);;
    
    /* Back button */
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
//    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
//    backBtn.frame = CGRectMake(0, 0, 15, 25);
//    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
//    self.navigationItem.leftBarButtonItem = backButton;
    
    // QUote Label
    //self.quoteLabel.text = QUOTE_LABEL;
    
    [self setupView];
}
-(void) setupView{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"QuotesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // All the URls for Quotes
    self.quoteToDisplayArray = @[@"%22An+unexaminced+life%22.png",@"%22Believe+you+can%22.png",@"%22Change+your+thoughts%22.png"
                                 ,@"%22Do+one+thing%22.png",@"%22Every+strike%22.png",@"%22Good%2C+better%2C+best%22.png"
                                 ,@"%22Health+is+the+greatest%22.png",@"%22I+attribute%22.png",@"%22I+can't+change%22.png"
                                 ,@"%22If+opportunity+doesn't%22.png",@"%22If+you+can+dream+it%22.png"
                                 ,@"%22If+you+fell+down%22.png",@"%22It+always+seems%22.png",@"%22It+is+never+too+late%22.png",@"%22Keep+your+face%22.png"
                                 ,@"%22Let+us+make%22.png",@"%22Let+us+remember%22.png",@"%22Life+isn't+about%22.png"
                                 ,@"%22My+mission+in+life%22.png",@"%22Never%2C+never%2C+never%22.png",@"%22Nothing+is+impossible%22.png",@"%22Only+I+can+change%22.png",@"%22Optimism+is+the+faith%22.png",@"%22Perfection+is+not%22.png",@"%22Problems+are+not%22.png",@"%22Put+your+heart%22.png",@"%22Setting+goals+is%22.png",@"%22Someone+is+sitting%22.png",@"%22Start+where+you+are%22.png",@"%22Strive+not+to+be+a+success%22.png",@"%22The+best+preparation%22.png",@"%22The+most+common%22.png",@"%22The+most+difficult+thing%22.png",@"%22Thousands+of+candles%22.png",@"%22Try+to+be+a+rainbow%22.png",@"%22Twenty+years%22.png",@"%22Two+roads+diverge%22.png",@"%22We+can't+help+everyone%22.png",@"%22We+know+what%22.png",@"%22What+we+think%22.png",@"%22Whatever+the+mind+of+man%22.png"
                                 ,@"%22With+the+new+day%22.png",@"%22You+are+never+too+old%22.png",@"%22You+can't+cross+the+sea%22.png",@"%22You+miss+100%25%22.png",@"%22You+must+do+the%22.png",@"%22Your+time+is+limited%22.png",@"80%25+of+success%22.png",@"Life+is+10%25%22.png",@"%E2%80%9CAlways+do+your+best.%22.png"];
    
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //Set current date and check if already set
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"dd-MM-yyyy"];
    self.currentDate = [df stringFromDate:[NSDate date]];
    
    if(![self.currentDate isEqualToString:[[NSUserDefaults standardUserDefaults]
                              objectForKey:@"currentDate"]]) {
        [[NSUserDefaults standardUserDefaults] setValue: self.currentDate forKey:@"currentDate"];

    
    // Randomly pick an URL.
    NSString *quoteToDisplay = [self randomizer:self.quoteToDisplayArray];
    
    NSString *urlForQuotesArray = [NSString stringWithFormat:@"https://s3-us-west-1.amazonaws.com/h4twappquotes/%@", quoteToDisplay];
    
    NSLog(@"url String : %@", urlForQuotesArray);
        
        // store the currently set quote url
        [[NSUserDefaults standardUserDefaults] setValue: urlForQuotesArray forKey:@"currentImage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        // Set the resulting URL
        self.quotesArray = @[urlForQuotesArray];

    } else {
        NSString *urlForQuotesArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentImage"];
        // Set the resulting URL
        self.quotesArray = @[urlForQuotesArray];
    }
}

// method to randomize quote based on current date
-(NSString*) randomizer: (NSArray *) quotes {
    
    //pick an item
    int upperBound = 50;
    int lowerBound = 0;
    NSUInteger randomIndex = lowerBound + arc4random_uniform(upperBound - lowerBound +1);
    NSString *item = [quotes objectAtIndex:randomIndex];
    
    return item;
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
    /* insert app usage info into table*/
    [AWSDynamoDBHelper detailedAppUsage: @[@"Tap",@"Back Button", @"NA"]];
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
//    self.collectionView.hidden =true;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.collectionView.backgroundView = nil;
//    self.collectionView.hidden =false;
}


@end
