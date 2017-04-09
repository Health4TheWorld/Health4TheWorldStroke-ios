//
//  HelpMeSpeakCollectionViewCell.h
//  H4TWStrokeHope
//
//  Created by Rachel on 4/9/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpMeSpeakCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *label;
- (void)layoutCellWithWord:(NSString *)word withImage:(UIImage *)image;
@end
