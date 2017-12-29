//
//  ChatbotLog.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 12/21/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "ChatbotLog.h"

@implementation ChatbotLog

static NSString *const TableName = @"chatbot_log";
static NSString *const HashKeyAttribute = @"device_datetime";

// Helper Tasks for the table
+ (AWSTask *)describeTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
    
    // See if the test table exists.
    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    describeTableInput.tableName = TableName;
    return [dynamoDB describeTable:describeTableInput];
}

// Confirm to AWS DynamoDb oBject Model protocol

+ (NSString *)dynamoDBTableName {
    return TableName;
}

+ (NSString *)hashKeyAttribute {
    return HashKeyAttribute;
}



@end
