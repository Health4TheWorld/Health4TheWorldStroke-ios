//
//  TimeTableViewCell.m
//  H4TWStrokeHope
//
//  Created by Rachel on 5/1/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "TimeTableViewCell.h"
#import "Constants.h"

@implementation TimeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.timeButton setTitleColor:HFTW_TEXT_GRAY forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)layoutWithTime:(Time *)time {
    self.addButton.hidden = YES;
    [self.timeButton setTitle:time.timeStr forState:UIControlStateNormal];
}

@end
