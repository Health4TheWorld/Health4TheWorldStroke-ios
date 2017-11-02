//
//  AWSDynamoDBHelper.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/30/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AWSDynamoDBHelper.h"

@implementation AWSDynamoDBHelper

- (AWSTask *) InsertDataIntoUsersTable:(NSArray*) data {
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


@end
