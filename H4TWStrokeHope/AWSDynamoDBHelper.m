//
//  AWSDynamoDBHelper.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AWSDynamoDBHelper.h"

static NSMutableArray *appUsageArray;
static NSMutableArray *appSessionDetailsArray;

@implementation AWSDynamoDBHelper
#define USER_DEFAULTS_APP_USAGE_KEY @"app_usage_data"
#define USER_DEFAULTS_SESSION_DETAILS_KEY @"session_details_data"

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
//    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
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
    
    /*
    [[dynamoDBObjectMapper save:app_usage]
     continueWithBlock:^id(AWSTask *task) {
         if (task.error) {
             NSLog(@"The request failed. Error: [%@]", task.error);
         } else {
             //Do something with task.result or perform other operations.
         }
         return nil;
     }];
    */
    
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
+ (void)loadAllSessionData {
    NSData *appSessionData = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_SESSION_DETAILS_KEY];
    if (appSessionData != nil) {
        NSArray *savedArray = [NSKeyedUnarchiver unarchiveObjectWithData: appSessionData];
        appSessionDetailsArray = [savedArray mutableCopy];
    } else {
        appSessionDetailsArray = [[NSMutableArray alloc] init];
    }
}

+ (void)saveAllSessionData {
    NSData *dataSave = [NSKeyedArchiver archivedDataWithRootObject:appSessionDetailsArray];
    [[NSUserDefaults standardUserDefaults] setObject:dataSave forKey:USER_DEFAULTS_SESSION_DETAILS_KEY];
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
    
    NSString *loginDateTime;
    NSString *logoutDateTime;
    for(int i=0; i< [data count]; i++){
        AppUsage *usageData = [data objectAtIndex:i];
        if([usageData.date_time containsString: [Utils getCurrentDate]]){
            if([usageData.object  isEqual: @"Login"]){
                loginDateTime = usageData.date_time;
            }
            if([usageData.object  isEqual: @"Logout"]){
                logoutDateTime = usageData.date_time;
            }
        }
    }
    NSLog(@"Login date %@", loginDateTime);
    NSLog(@"Logout date %@", logoutDateTime);
    
    NSTimeInterval ti = [self timeIntervalForDates: loginDateTime to: logoutDateTime];
    NSString *TotalDuration = [self stringFromTimeInterval: ti];
    NSLog(@"total session time : %@", TotalDuration);
    
    // Calc time taken for under each section
    NSString *chatbotSectionDuration;
    NSString *exerciseSectionDuration;
    NSString *helpMeSpeakSectionDuration;
    NSString *learnSectionDuration;
    NSString *surveysSectionDuration;
    chatbotSectionDuration = [self calculateSectionDuration: @"Smiley" withData: data];
    exerciseSectionDuration = [self calculateSectionDuration: @"Exercise" withData: data];
    helpMeSpeakSectionDuration = [self calculateSectionDuration: @"Help Me Speak" withData: data];
    learnSectionDuration = [self calculateSectionDuration: @"Learn" withData: data];
    surveysSectionDuration = [self calculateSectionDuration: @"Surveys" withData: data];
    
    AppUsage *usageData = [data objectAtIndex:0];
    NSString *currentDate = [Utils getCurrentDate];
    
    NSNumber *SessionId = [NSNumber numberWithInt: 1];
    // Check if this is user's first session today
    SessionId = [self generateSessionID: usageData.unique_device_id date: currentDate];
    
    NSString *primary_key = [NSString stringWithFormat: @"%@_%@_%@",usageData.unique_device_id,currentDate, SessionId];
    
    // Entry point where the data for all the columns are entered
    NSArray *dailyUsageData = @[primary_key,SessionId, currentDate, usageData.device_type,
                                TotalDuration,chatbotSectionDuration,exerciseSectionDuration
                                ,helpMeSpeakSectionDuration,learnSectionDuration,surveysSectionDuration];
    
    //Upload the daily usage into DyanmoDB table
    [self InsertDataIntoDailyUsageTable: dailyUsageData];
}
+ (NSTimeInterval) timeIntervalForDates: (NSString *) fromDate to: (NSString *) toDate{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-yyyy HH:mm:ss"];
    NSDate *loginDate = [dateFormat dateFromString:  fromDate];
    NSDate *logoutDate = [dateFormat dateFromString:  toDate];
    NSTimeInterval ti = [logoutDate timeIntervalSinceDate:loginDate];
    //NSLog(@"%f", ti);
    return ti;
}

+ (NSString *)stringFromTimeInterval:(NSTimeInterval)interval {
    NSDateComponentsFormatter *dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
    dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStylePositional;
    dateComponentsFormatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
    dateComponentsFormatter.allowedUnits = (NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    //NSLog(@"%@", [dateComponentsFormatter stringFromTimeInterval:interval]);
    return [dateComponentsFormatter stringFromTimeInterval:interval];
}

+(NSNumber *)generateSessionID: (NSString *)deviceId date: (NSString *) date   {
    NSNumber *sessionId = [NSNumber numberWithInt: 1];
    NSString *primaryKey;
    [self loadAllSessionData];
    NSLog(@"%lu",(unsigned long)[appSessionDetailsArray count]);
    if([appSessionDetailsArray count] >= 1){
        for(int i=0; i< [appSessionDetailsArray count]; i++){
            NSString *key = [appSessionDetailsArray objectAtIndex:i];
            NSArray *keyItems = [key componentsSeparatedByString:@"_"];
            if([[keyItems objectAtIndex:0]  isEqual: deviceId]){
                if([[keyItems objectAtIndex:1]  isEqual: date]){
                    sessionId = [keyItems objectAtIndex:2];
                    int value = [sessionId intValue];
                    sessionId = [NSNumber numberWithInteger: value  + 1];
                    primaryKey = [NSString stringWithFormat:@"%@_%@_%@", deviceId,date, sessionId];
                     NSLog(@"primary key :  \n %@",primaryKey);
                }
            }
        }
        if(primaryKey == NULL){
            primaryKey = [NSString stringWithFormat:@"%@_%@_%@",deviceId,date,sessionId];
        }
        [appSessionDetailsArray addObject: primaryKey];
    }
    else{
        primaryKey = [NSString stringWithFormat:@"%@_%@_%@",deviceId,date,sessionId];
        [appSessionDetailsArray addObject:primaryKey];
    }
    [self saveAllSessionData];
    NSLog(@"primary key :  \n %@",primaryKey);

    return sessionId;
}

+ (NSString *) calculateSectionDuration: (NSString *) sectionName withData:(NSMutableArray *) data {
    NSString *totalDuration;
    NSString *startTime;
     NSString *endTime;
    NSTimeInterval ti;
    NSLog(@"Section: %@", sectionName);
    for(int i=0; i< [data count]; i++){
        AppUsage *usageData = [data objectAtIndex:i];
        if([usageData.date_time containsString: [Utils getCurrentDate]]){
            if([usageData.object containsString: sectionName]){
                startTime = usageData.date_time;
                if([data objectAtIndex: i+1]){
                    AppUsage *nextData = [data objectAtIndex: i+1];
                    endTime = nextData.date_time;
                }else {
                    endTime = @"0";
                }
                // Find the time interval
                ti = [self timeIntervalForDates: startTime to: endTime];
                totalDuration = [self stringFromTimeInterval: ti];
            }
        }
    }
    if(totalDuration == NULL){
        totalDuration = @"00:00:00";
    }
    NSLog(@"Start Time: %@", startTime);
    NSLog(@"End time: %@", endTime);
    NSLog(@"Total duration: %@",totalDuration);
    return totalDuration;
}

+ (AWSTask *) InsertDataIntoDailyUsageTable:(NSArray*) data {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    SessionDetails *daily_usage = [SessionDetails new];
    daily_usage.primary_key = [data objectAtIndex:0];
    daily_usage.session_id = [data objectAtIndex:1];
    daily_usage.date = [data objectAtIndex:2];
    daily_usage.device_type  = [data objectAtIndex:3];
    daily_usage.app_duration = [data objectAtIndex:4];
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

+ (void) detailedChatLog {
    NSString *device_dateTime = [NSString stringWithFormat:@"%@_%@",[Utils getUDID],[Utils getCurrentDateTime]];
    
    ChatBotViewController *botVC = [ChatBotViewController alloc];
    
    NSLog(@"%@",  botVC.message);
    
    //NSArray *dataToInsert = @[device_dateTime,[data objectAtIndex:0], [data objectAtIndex: 1],  [data objectAtIndex: 2] ];
    //[self InsertDataIntoChatBotLogTable: dataToInsert];
    
}

+ (AWSTask *) InsertDataIntoChatBotLogTable:(NSArray*) data {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
    ChatbotLog *chat_log = [ChatbotLog new];
    chat_log.device_datetime = [data objectAtIndex:0];
    chat_log.chat_log_dict = [data objectAtIndex:1];
    chat_log.duration = [data objectAtIndex:2];
    chat_log.icon_selected  = [data objectAtIndex:3];
    
    NSLog(@" current object : %@",chat_log);
    
    [[dynamoDBObjectMapper save: chat_log]
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

+ (AWSTask *) InsertDataIntoFeedbackTable:(NSArray*) data {
    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    Feedback *feedback = [Feedback new];
    /*Feedback : DeviceId, comment, rating, story, timestamp*/
    feedback.deviceID = [data objectAtIndex:0];
    feedback.comment = [data objectAtIndex:1];
    feedback.rating = [data objectAtIndex:2];
    feedback.story  = [data objectAtIndex:3];
    feedback.timeStamp = [data objectAtIndex:4];
    NSLog(@" current object : %@",feedback);
    
    [[dynamoDBObjectMapper save: feedback]
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


// Clear objects from User Defaults to retain only current session information
+ (void) clearSessionDataLog {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey: USER_DEFAULTS_APP_USAGE_KEY];
}


@end
