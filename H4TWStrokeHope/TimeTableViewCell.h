//
//  TimeTableViewCell.h
//  H4TWStrokeHope
//
//  Created by Rachel on 5/1/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Time.h"

@interface TimeTableViewCell : UITableViewCell
@property Time *time;
@property (strong, nonatomic) IBOutlet UIButton *timeButton;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
- (void)layoutWithTime:(Time *)time;
@end
