//
//  AWSDynamoDBHelper.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AWSDynamoDBHelper.h"

static NSMutableArray *appUsageArray;

@implementation AWSDynamoDBHelper
#define USER_DEFAULTS_APP_USAGE_KEY @"app_usage_data"

+ (AWSTask *) InsertDataIntoUsersTable:(NSArray*) data {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    Users *user = [Users new];
    user.user_id = [data objectAtIndex:0];
    user.date_joined = [data objectAtIndex:1];
    user.last_login = [data objectAtIndex:2];
    user.user_email  = [data objectAtIndex:3];
    user.user_first = [data objectAtIndex:4];
    user.user_last = [data objectAtIndex: 5];
    user.user_name = [data objectAtIndex:6];
    
    NSLog(@"%@",data);
    NSLog(@"%@",user);
    
    [[dynamoDBObjectMapper save:user]
     continueWithBlock:^id(AWSTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         } else {
             //Do something with task.result or perform other operations.
         }
         return nil;
     }];
    
    return nil;
}

+ (void) detailedAppUsage:(NSArray *) data {
    NSArray *dataToInsert = @[[Utils getUDID], [Utils getCurrentDateTime], [Utils deviceName],[data objectAtIndex:0], [data objectAtIndex: 1],  [data objectAtIndex: 2] ];
    [self InsertDataIntoAppUsageTable: dataToInsert];
    
}

+ (AWSTask *) InsertDataIntoAppUsageTable:(NSArray*) data {
    appUsageArray = [[NSMutableArray alloc] init];
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    AppUsage *app_usage = [AppUsage new];
    app_usage.unique_device_id = [data objectAtIndex:0];
    app_usage.date_time = [data objectAtIndex:1];
    app_usage.device_type = [data objectAtIndex:2];
    app_usage.action  = [data objectAtIndex:3];
    app_usage.object = [data objectAtIndex:4];
    app_usage.object_type = [data objectAtIndex: 5];
    
    NSLog(@" current object : %@",app_usage);
    
    [self loadAllUsageData];

    [appUsageArray addObject:app_usage];
    
    [self saveAllUsageData];
    
    for (int i = 0; i < [appUsageArray count]; i++)
    {
        NSLog(@" app_usage array : %@", [appUsageArray objectAtIndex: i] );
    }
    
    
    [[dynamoDBObjectMapper save:app_usage]
     continueWithBlock:^id(AWSTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         } else {
             //Do something with task.result or perform other operations.
         }
         return nil;
     }];
    
    
    return nil;
}

+ (void)loadAllUsageData {
    NSData *appUsageData = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_APP_USAGE_KEY];
    if (appUsageData != nil) {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:appUsageData];
        appUsageArray = [savedArray mutableCopy];
    } else {
        appUsageArray = [[NSMutableArray alloc] init];
    }
}

+ (void)saveAllUsageData {
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:appUsageArray];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:USER_DEFAULTS_APP_USAGE_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) calcSessionUsage {
    // Retrieve the app_usage data
    NSMutableArray *data = [[NSMutableArray alloc] init];
    NSData *appUsageData = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_APP_USAGE_KEY];
    if (appUsageData != nil) {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData:appUsageData];
        data = [savedArray mutableCopy];
    } else {
        data = [[NSMutableArray alloc] init];
    }
    
    
    
    //Upload the daily usage into DyanmoDB table
    [self InsertDataIntoDailyUsageTable: data];
}

+ (AWSTask *) InsertDataIntoDailyUsageTable:(NSArray*) data {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    SessionDetails *daily_usage = [SessionDetails new];
    daily_usage.device_id = [data objectAtIndex:0];
    daily_usage.session_id = [data objectAtIndex:1];
    daily_usage.date = [data objectAtIndex:2];
    daily_usage.device_type  = [data objectAtIndex:3];
    daily_usage.duration = [data objectAtIndex:4];
    daily_usage.section_learn = [data objectAtIndex: 5];
    daily_usage.section_exercises = [data objectAtIndex: 6];
    daily_usage.section_chatbot = [data objectAtIndex: 7];
    daily_usage.section_help_me_speak = [data objectAtIndex: 8];
    daily_usage.section_surveys = [data objectAtIndex: 9];
    
    NSLog(@" current object : %@",daily_usage);
    
     [[dynamoDBObjectMapper save:daily_usage]
     continueWithBlock:^id(AWSTask *task) {
     if (task.error) {
     NSLog(@"The request failed. Error: [%@]", task.error);
     } else {
     //Do something with task.result or perform other operations.
     }
     return nil;
     }];
    
    
    return nil;
}


@end
