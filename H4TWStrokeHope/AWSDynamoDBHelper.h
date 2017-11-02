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

@interface AWSDynamoDBHelper : NSObject

- (AWSTask *) InsertDataIntoUsersTable:(NSArray*) data ;
@end
