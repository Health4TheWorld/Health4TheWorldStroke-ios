//
//  Feedback.h
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 3/14/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface Feedback : AWSDynamoDBObjectModel <AWSDynamoDBModeling>
/*Feedback : DeviceId, comment, rating, story, timestamp*/
@property (nonatomic, strong) NSString *DeviceId;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *rating;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic, strong) NSString *story;

+ (AWSTask *)describeTable ;

@end
