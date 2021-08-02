//
//  AppDelegate.m
//  H4TWStrokeHope
//
//  Created by Rachel on 3/15/17.
//  Copyright © 2017 Rachel. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import <ApiAI/ApiAI.h>
#import <ApiAI/AIConfiguration.h>
#import <AWSCore/AWSCore.h>
#import <AWSCognito/AWSCognito.h>
#import "AWSCognitoIdentityProvider.h"
#import "AWSConstants.h"

// #import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()

@end

bool isGrantedNotificationAccess;

@implementation AppDelegate

#define APIAI_CLIENT_ACCESS_TOKEN @"15d1973433dd45df966ef1b4fc750daf"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UINavigationBar appearance] setBarTintColor:HFTW_DARK];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor whiteColor],
      NSForegroundColorAttributeName,
      [UIFont fontWithName:@"Lato-regular" size:20.0],
      NSFontAttributeName,
      nil]];
    
    /* NOTIFICATIONS */
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    [center requestAuthorizationWithOptions:options
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                              isGrantedNotificationAccess = granted;
                              if (!granted) {
                                  NSLog(@"Something went wrong");
                                  NSLog(@"error : %@", error);
                              }else{
                                  NSLog(@"Permissions granted !");
                              }
                          }];
    
    // API.AI configuration for Chat Bot
    
    ApiAI *apiai = [ApiAI sharedApiAI];
    id <AIConfiguration> configuration = [[AIDefaultConfiguration alloc] init];
    configuration.clientAccessToken = APIAI_CLIENT_ACCESS_TOKEN;
    apiai.configuration = configuration;
    
    /* AWS Service Configuration */
    AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1 identityPoolId: COGNITO_IDENTITY_POOL_ID];
    
    AWSServiceConfiguration *serviceConfiguration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1 credentialsProvider:credentialsProvider];
    
    AWSServiceManager.defaultServiceManager.defaultServiceConfiguration = serviceConfiguration;
     
    //create a pool
    /*
    AWSCognitoIdentityUserPoolConfiguration *config = [[AWSCognitoIdentityUserPoolConfiguration alloc] initWithClientId: AWS_APP_CLIENT_ID clientSecret: AWS_APP_CLIENT_SECRET poolId: USERPOOL_ID];
    [AWSCognitoIdentityUserPool registerCognitoIdentityUserPoolWithConfiguration:serviceConfiguration userPoolConfiguration:config forKey:@"UserPool"];
//    AWSCognitoIdentityUserPool *pool = [AWSCognitoIdentityUserPool CognitoIdentityUserPoolForKey:@"UserPool"];
    */
     
    /* Facebook Integration*/
    //[[FBSDKApplicationDelegate sharedInstance] application:application
    //                         didFinishLaunchingWithOptions:launchOptions];
    // Add any custom logic here.
    
    return YES;
}

- (void) applicationDidEnterBackground:(UIApplication *)application{
    
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSDateComponents *dateComponents = [calender components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute fromDate:[NSDate date]];
    
    [self setRemoteNotificationForQuotes: 24*60*60 withRepeat:YES];
}



- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

// FB Analytics activated
- (void)applicationDidBecomeActive:(UIApplication *)application {
    //[FBSDKAppEvents activateApp];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"H4TWStrokeHope"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler
{
    if( SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO( @"10.0" ) )
    {
//        NSLog( @"iOS version >= 10. Let NotificationCenter handle this one." );
        // set a member variable to tell the new delegate that this is background
        return;
    }
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    //Called when a notification is delivered to a foreground app.
//    NSLog(@"Userinfo %@",notification.request.content.userInfo);
    completionHandler(UNNotificationPresentationOptionAlert);
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler{
    //Called to let your app know which action was selected by the user for a given notification.
//    NSLog(@"Userinfo %@",response.notification.request.content.userInfo);
    // Determine the user action
    NSArray *items = @[@"UNNotificationDismissActionIdentifier",@"UNNotificationDefaultActionIdentifier", @"Snooze", @"Delete"];
    NSInteger item = [items indexOfObject:response.actionIdentifier];
    switch(item) {
    case 0:
            NSLog(@"Dismiss Action");
    case 1:
            NSLog(@"Default");
    case 2:
            NSLog(@"Snooze");
    case 3:
            NSLog(@"Delete");
    default:
            NSLog(@"Unknown action");
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
    //NSString *deviceToken = [NSString stringWithFormat:@"%@", deviceToken];
    NSLog(@"\n Token: %@",deviceToken);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error{
    NSLog(@"\n Error : %@", error);
}

// Set push notifications for Inspiring quotes

-(void) setRemoteNotificationForQuotes: (NSUInteger)timeInterval withRepeat:(BOOL)repeat{

    if(isGrantedNotificationAccess){
        if([[UIApplication sharedApplication] scheduledLocalNotifications] == NULL){
            
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"Inspiring Quotes";
        content.subtitle = @"";
        content.body = @"Take a look at our Inspiring quote of the day !";
        content.sound = [UNNotificationSound defaultSound];
    
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:timeInterval repeats:repeat];
        // Setting up the notification for request
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"UNQuotesNotification" content:content trigger:trigger];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if(error){
                NSLog(@"\n Error : %@", error);
            }
        }];
        UNNotificationAction *deleteAction = [UNNotificationAction actionWithIdentifier:@"Delete"
                                                                                      title:@"Delete" options:UNNotificationActionOptionDestructive];
        UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"UYLReminderCategory"
                                                                                      actions:@[deleteAction] intentIdentifiers:@[]
                                                                                  options:UNNotificationCategoryOptionNone];
            NSSet *categories = [NSSet setWithObject:category];
            [center setNotificationCategories:categories];
            content.categoryIdentifier = @"UYLReminderCategory";
        }
        
        
        BOOL isNotificationActive = NO;
        //Check active notifications
        
             if ([[UIApplication sharedApplication] respondsToSelector:@selector(currentUserNotificationSettings)]){ // Check it's iOS 8 and above
             UIUserNotificationSettings *grantedSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
             
             if (grantedSettings.types == UIUserNotificationTypeNone) {
             NSLog(@"No permiossion granted");
             }
             else if (grantedSettings.types & UIUserNotificationTypeSound & UIUserNotificationTypeAlert ){
             NSLog(@"Sound and alert permissions ");
             isNotificationActive = YES;
             }
             else if (grantedSettings.types  & UIUserNotificationTypeAlert){
             NSLog(@"Alert Permission Granted");
             isNotificationActive = YES;
             }
         }
        /*
        
        // Schedule the notifications
        
        if(!isNotificationActive){
            
            NSLog(@"\n Notifications are scheduled");
            NSTimeInterval interval = 60;
            
            UILocalNotification *notification = [[UILocalNotification alloc] init];
            notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:interval];
            notification.alertTitle = @"Inspiring Quotes";
            notification.alertBody = @"Take a look at our Inspiring quote of the day !";
            notification.timeZone = [NSTimeZone defaultTimeZone];
            notification.repeatInterval = NSCalendarUnitMinute;
            notification.soundName = UILocalNotificationDefaultSoundName;
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
         */
    }
}

/*
// Facebook App delegates
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                               annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
                    ];
    // Add any custom logic here.
    return handled;
}
*/

@end

