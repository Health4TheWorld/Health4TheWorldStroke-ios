//
//  TimeTableViewCell.h
//  H4TWStrokeHope
//
//  Created by Rachel on 5/1/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeTableViewCell : UITableViewCell
@property NSString *time;
@property (strong, nonatomic) IBOutlet UIButton *timeButton;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
- (void)layoutWithTime:(NSString *)time;
@end
