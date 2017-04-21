//
//  VideoViewController.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 4/13/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()
@property (nonatomic,retain) AVPlayer *player;
@property (nonatomic,retain) AVPlayerViewController *controller;
@end

@implementation VideoViewController
@synthesize player;
@synthesize controller;
AVQueuePlayer *queue;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}

- (void)setUpVideo: (NSString *) videoName{
    
    // Set URL to the video
    NSURL *url = [[NSBundle mainBundle] URLForResource:videoName withExtension:nil];

    // Create an AVPlayer
    self.player = [AVPlayer playerWithURL:url];
    
    // create a player view controller
    self.controller = [[AVPlayerViewController alloc] init];
    
    self.controller.player = self.player;
    self.controller.showsPlaybackControls = YES;
    self.player.closedCaptionDisplayEnabled = NO;
    [self.player pause];
    [self.player play];
    
    [self addChildViewController:self.controller];
    [self.view addSubview:self.controller.view];
    self.controller.view.frame = self.view.frame;
    self.player.actionAtItemEnd = AVPlayerActionAtItemEndPause;
    [self.player addObserver:self forKeyPath:@"rate" options:0 context:0];

}

- (AVPlayerViewController *)setUpCustomVideo: (NSString *) videoName withFrame: (CGRect *) frame{
    
    // Set URL to the video
    NSURL *url = [[NSBundle mainBundle] URLForResource:videoName withExtension:nil];
    
    // Create an AVPlayer Item
    AVPlayerItem *video = [[AVPlayerItem alloc] initWithURL:url];
    
    //Create a AVplayer Queue
    queue = [[AVQueuePlayer alloc] init];
    [queue insertItem:video afterItem:nil];
    
    self.player = queue;
    
    // create a player view controller
    self.controller = [[AVPlayerViewController alloc] init];
    
    //self.view.frame = CGRectMake(10,150,360,180);
    self.controller.player = self.player;
    self.controller.showsPlaybackControls = YES;
    self.player.closedCaptionDisplayEnabled = NO;
    [self.player play];
    
    // PLay video on a loop
    //self.player.actionAtItemEnd =  AVPlayerActionAtItemEndNone;
    [[NSNotificationCenter defaultCenter] addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        AVPlayerItem *video = [[AVPlayerItem alloc] initWithURL:url];
        [queue insertItem:video afterItem:nil];
        [self.player play];
    }];
     
    return controller;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == 0) {
        if(player.rate==0.0) //stopped
            [self stopped];
    }

}


-(void)stopped {
    [self.player removeObserver:self forKeyPath:@"rate"];
}


-(void) viewWillDisappear:(BOOL)animated{
    [self.player pause];
    self.player = nil;
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
