//
//  Session_details.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 11/5/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface SessionDetails : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSString *device_id;
@property (nonatomic, strong) NSNumber *session_id;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *device_type;
@property (nonatomic, strong) NSString *duration;
@property (nonatomic, strong) NSString *section_learn;
@property (nonatomic, strong) NSString *section_exercises;
@property (nonatomic, strong) NSString *section_chatbot;
@property (nonatomic, strong) NSString *section_help_me_speak;
@property (nonatomic, strong) NSString *section_surveys;

+ (AWSTask *)describeTable ;

@end
