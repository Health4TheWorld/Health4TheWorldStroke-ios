//
//  RelaxingMusicViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 7/18/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "RelaxingMusicViewController.h"
#import "RelaxingMusicViewCell.h"
#import "Constants.h"
#import "VideoViewController.h"

@interface RelaxingMusicViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (strong, nonatomic) IBOutlet UILabel *musicLabel;
@property NSArray *musicURLArray;
@property NSArray *musicLabelArray;
@property NSArray *musicImageArray;

@end

@implementation RelaxingMusicViewController

static NSString * const reuseIdentifier = @"RelaxingMusicCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Relaxing Music";
    
    /* Back button */
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backBtnImage = [UIImage imageNamed:WHITE_BACK_BUTTON]  ;
    [backBtn setBackgroundImage:backBtnImage forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 15, 25);
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backButton;
    
    // QUote Label
    //self.musicLabel.text = MUSIC_LABEL;
    
    [self setupView];
}

-(void) setupView{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"RelaxingMusicViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"Patagonia.jpg"]];
    
    
    //setup array values by looping through all the values in the URl array

    // Load music URls and Labels
    self.musicURLArray = @[@"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/acoustic-guitar-piano-underscore_M1OKaHS_.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/acoustic-loop-10_zyj2_N4u.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/acoustic-loop-4_fylndV4u.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/ambient-background-music-1-loop_z1QW6rBd.mp3",@"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/dawn_Gk5uoHS_.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/gymnopedie_z1Zn3BH_.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/jdi-0314-happy-gmaj-piano.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/jdi-acoustic-guitar-jam-1-032314-9.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/just-a-smile_fkPjarBO.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/life_z1jS5SHu.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/melodic-acoustic-advert-music_fkQXiVNu.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/melodic-piano-atmosphere_MyvXjE4O.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/mid-summer-evening_z1FwVUB_.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/mozart-piano-sonata-no-16_MJbUs4Nu.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/sit-back-and-relax-ambient-sound-texture_zJeWh4NO.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/sleeping-peacefully_GJkBQ8ru.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/sunrise-without-you_fJ3zyBEu.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/sweet-sweet-dreams-inst-full_f1W7K4EO.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/under-the-ocean-sun-loop_zJlMK VVO.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/welcome-home_fy7v7UB_.mp3", @"https://s3-us-west-1.amazonaws.com/h4twrelaxingmusic/yesterday_zkDX1S4d.mp3"];
    
    self.musicLabelArray = @[@"acoustic guitar piano",@"acoustic loop 10",@"acoustic loop 4",@"ambient background music1"
                             ,@"dawn",@"gymnopedie",@"happy gmaj piano",@"acoustic guitar jam 1",@"just a smile"
                             ,@"life",@"melodic acoustic advert music", @"melodic piano atmosphere",@"mid summer evening"
                             ,@"mozart piano sonata", @"sit back and relax ambient sound",@"sleeping peacefully"
                             ,@"sunrise without you",@"sweet sweet dreams",@"under the ocean sun",@"welcome home",@"yesterday"
                             ];
    
    //Load Music images
    self.musicImageArray = @[@"1fill",@"2fill",@"3fill",@"4fill", @"5fill",@"6fill",@"7fill",@"8fill",
                             @"9fill",@"10fill",@"11fill",@"12fill", @"13fill",@"14fill",@"15fill",@"16fill",
                                @"17fill",@"18fill",@"19fill",@"20fill",@"21fill"];
}

- (void)backPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.musicURLArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RelaxingMusicViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath:indexPath];
    
    //NSURL *imageURL = [NSURL URLWithString:@"https://s3-us-west-1.amazonaws.com/h4twappquotes/%22The+best+preparation%22.png"];
    //NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    //cell.imageView.image = [UIImage imageWithData: imageData];
    cell.imageView.image = [UIImage imageNamed:[self.musicImageArray objectAtIndex:indexPath.item]];
   cell.label.text = [self.musicLabelArray objectAtIndex:indexPath.item];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
 
    NSURL *musicURL = [NSURL URLWithString:[self.musicURLArray objectAtIndex:indexPath.item]];
    NSString *musicLabel = [self.musicLabelArray objectAtIndex:indexPath.item];
    [self playCustomMusic:musicURL withLabel:musicLabel];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{

}

- (void) playCustomMusic: (NSURL *) musicURL withLabel: (NSString *) title {
    VideoViewController *vc = [[VideoViewController alloc] init];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
              [vc videoPlayerSetup:musicURL];
            [vc setTitle:title];
            
        });
    });

    [self.navigationController pushViewController:vc animated:YES];
}



@end
