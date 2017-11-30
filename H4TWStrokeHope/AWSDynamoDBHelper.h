//
//  AWSDynamoDBHelper.h
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AWSDynamoDB/AWSDynamoDB.h>
#import "Users.h"
#import "AppUsage.h"
#import "Utils.h"
#import "SessionDetails.h"

@interface AWSDynamoDBHelper : NSObject

+ (AWSTask *) InsertDataIntoUsersTable:(NSArray*) data ;
+ (void) detailedAppUsage:(NSArray *) data;
+ (AWSTask *) InsertDataIntoAppUsageTable:(NSArray*) data;
+ (void)loadAllUsageData ;
+ (void)saveAllUsageData ;
+ (void) calcSessionUsage;
@end
