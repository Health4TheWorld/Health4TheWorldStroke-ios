//
//  Feedback.m
//  H4TWStrokeHope
//
//  Created by Maitri Mehta on 3/14/18.
//  Copyright © 2018 Rachel. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback

static NSString *const TableName = @"feedback";
static NSString *const HashKeyAttribute = @"deviceID";

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
