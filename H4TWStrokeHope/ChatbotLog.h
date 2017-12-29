//
//  ChatbotLog.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 12/21/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface ChatbotLog :AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *device_datetime;
@property (nonatomic, strong) NSString *chat_log_dict;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *icon_selected;

+ (AWSTask *)describeTable ;

@end
