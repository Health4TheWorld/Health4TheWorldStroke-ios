//
//  Users.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/27/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSDynamoDB/AWSDynamoDB.h>

@interface Users : AWSDynamoDBObjectModel <AWSDynamoDBModeling>

@property (nonatomic, strong) NSNumber *user_id;
@property (nonatomic, strong) NSString *date_joined;
@property (nonatomic, strong) NSString *last_login;
@property (nonatomic, strong) NSString *user_email;
@property (nonatomic, strong) NSString *user_first;
@property (nonatomic, strong) NSString *user_last;
@property (nonatomic, strong) NSString *user_name;

+ (AWSTask *)describeTable ;
+ (AWSTask *)createTable ;
@end
