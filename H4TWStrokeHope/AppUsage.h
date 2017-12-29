//
//  App_usage.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 11/5/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface AppUsage : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *unique_device_id;
@property (nonatomic, strong) NSString *date_time;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSString *device_type;
@property (nonatomic, strong) NSString *object;
@property (nonatomic, strong) NSString *object_type;

+ (AWSTask *)describeTable ;

@end
