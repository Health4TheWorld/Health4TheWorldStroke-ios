//
//  App_usage.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 11/5/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AppUsage.h"

@implementation AppUsage

static NSString *const TableName = @"app_usage";
static NSString *const HashKeyAttribute = @"unique_device_id";

static NSString *const RangeKeyAttribute = @"date_time";
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
