//
//  Session_details.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 11/5/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "SessionDetails.h"

@implementation SessionDetails

static NSString *const TableName = @"daily_usage";
static NSString *const HashKeyAttribute = @"primary_key";
static NSString *const RangeKeyAttribute = @"date";

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

+ (NSString *)rangeKeyAttribute {
    return RangeKeyAttribute;
}

@end
