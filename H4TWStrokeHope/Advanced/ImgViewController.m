//
//  ImgViewController.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 1/7/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "ImgViewController.h"

@interface ImgViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation ImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imgView.image = [UIImage imageNamed:self.imgName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
