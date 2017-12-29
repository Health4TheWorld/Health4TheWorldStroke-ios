//
//  Users.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/27/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "Users.h"

@implementation Users

static NSString *const TableName = @"users";
static NSString *const HashKeyAttribute = @"user_id";

// Helper Tasks for the table
+ (AWSTask *)describeTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
    
    // See if the test table exists.
    AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
    describeTableInput.tableName = TableName;
    return [dynamoDB describeTable:describeTableInput];
}

+ (AWSTask *)createTable {
    AWSDynamoDB *dynamoDB = [AWSDynamoDB defaultDynamoDB];
    
    // Create the test table.
    AWSDynamoDBAttributeDefinition *hashKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
    hashKeyAttributeDefinition.attributeName = @"user_id";
    hashKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeN;
    
    AWSDynamoDBKeySchemaElement *hashKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
    hashKeySchemaElement.attributeName = @"user_id";
    hashKeySchemaElement.keyType = AWSDynamoDBKeyTypeHash;
    
    AWSDynamoDBAttributeDefinition *rangeKeyAttributeDefinition = [AWSDynamoDBAttributeDefinition new];
    rangeKeyAttributeDefinition.attributeName = @"date_joined";
    rangeKeyAttributeDefinition.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBKeySchemaElement *rangeKeySchemaElement = [AWSDynamoDBKeySchemaElement new];
    rangeKeySchemaElement.attributeName = @"date_joined";
    rangeKeySchemaElement.keyType = AWSDynamoDBKeyTypeRange;
    
    //Add non-key attributes
    AWSDynamoDBAttributeDefinition *lastLoginAttrDef = [AWSDynamoDBAttributeDefinition new];
    lastLoginAttrDef.attributeName = @"last_login";
    lastLoginAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBAttributeDefinition *userEmailAttrDef = [AWSDynamoDBAttributeDefinition new];
    userEmailAttrDef.attributeName = @"user_email";
    userEmailAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBAttributeDefinition *userFirstAttrDef = [AWSDynamoDBAttributeDefinition new];
    userFirstAttrDef.attributeName = @"user_first_name";
    userFirstAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBAttributeDefinition *userLastAttrDef = [AWSDynamoDBAttributeDefinition new];
    userLastAttrDef.attributeName = @"user_last_name";
    userLastAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBAttributeDefinition *userNameAttrDef = [AWSDynamoDBAttributeDefinition new];
    userNameAttrDef.attributeName = @"user_name";
    userNameAttrDef.attributeType = AWSDynamoDBScalarAttributeTypeS;
    
    AWSDynamoDBProvisionedThroughput *provisionedThroughput = [AWSDynamoDBProvisionedThroughput new];
    provisionedThroughput.readCapacityUnits = @5;
    provisionedThroughput.writeCapacityUnits = @5;

    //Create TableInput
    AWSDynamoDBCreateTableInput *createTableInput = [AWSDynamoDBCreateTableInput new];
    createTableInput.tableName = TableName;
    createTableInput.attributeDefinitions = @[hashKeyAttributeDefinition, rangeKeyAttributeDefinition, lastLoginAttrDef, userEmailAttrDef,userFirstAttrDef,userLastAttrDef,userNameAttrDef];
    createTableInput.keySchema = @[hashKeySchemaElement, rangeKeySchemaElement];
    createTableInput.provisionedThroughput = provisionedThroughput;
    
    return [[dynamoDB createTable:createTableInput] continueWithSuccessBlock:^id(AWSTask *task) {
        if (task.result) {
            // Wait for up to 4 minutes until the table becomes ACTIVE.
            
            AWSDynamoDBDescribeTableInput *describeTableInput = [AWSDynamoDBDescribeTableInput new];
            describeTableInput.tableName = TableName;
            task = [dynamoDB describeTable:describeTableInput];
            
            for(int32_t i = 0; i < 16; i++) {
                task = [task continueWithSuccessBlock:^id(AWSTask *task) {
                    AWSDynamoDBDescribeTableOutput *describeTableOutput = task.result;
                    AWSDynamoDBTableStatus tableStatus = describeTableOutput.table.tableStatus;
                    if (tableStatus == AWSDynamoDBTableStatusActive) {
                        return task;
                    }
                    
                    sleep(15);
                    return [dynamoDB describeTable:describeTableInput];
                }];
            }
        }
        
        return task;
    }];
}

// Confirm to AWS DynamoDb oBject Model protocol

+ (NSString *)dynamoDBTableName {
    return TableName;
}

+ (NSString *)hashKeyAttribute {
    return HashKeyAttribute;
}

@end
    
