//
//  AWSConstants.m
//  H4TWStrokeHope
//
//  Created by Premnath Ramanathan on 10/25/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AWSConstants.h"
#import <AWSCore/AWSCore.h>
#import <AWSCognito/AWSCognito.h>

@implementation AWSConstants

//static NSInteger const COGNITO_REGIONTYPE = AWSRegionUSEast1;  // Set the COGNITO_REGIONTYPE
static NSString * const COGNITO_IDENTITY_POOL_ID = @"us-east-1_klA3wvgxp" ;  // Set the YOUR_COGNITO_IDENTITY_POOL_ID
//static NSInteger const DEFAULT_SERVICE_REGION = AWSRegionUSEast1;   // Set the DEFAULT_SERVICE_REGION
static NSString * const DYNAMODB_USERS_TABLE = @"users" ;  // Set the YOUR_DYNAMODB_USERS_TABLE
static NSString * const AWS_APP_CLIENT_ID = @"6unkebrp4in57ftt0bcpjth14s";
static NSString * const AWS_APP_CLIENT_SECRET = @"14okneshsp47607lbo7u03qj9g18bo47ss2ahqa1is2dcnujo7ud";

@end
