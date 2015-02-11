//
//  AppDelegate.m
//  VivochaSDKExample
//
//  Created by Michael Siddi on 04/04/14.
//  Copyright (c) 2014 Vivocha Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "AViewController.h"
#import "BViewController.h"


#import <VivochaSDK/VivochaSDK.h> //<-- Remember to import the Vivocha SDK header file ;-)

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    
    AViewController *avc = [AViewController new];
    avc.title = @"A";
    avc.tabBarItem.image = [UIImage imageNamed:@"layer"];

    BViewController *bvc = [BViewController new];
    bvc.title = @"B";
    bvc.tabBarItem.image = [UIImage imageNamed:@"cloud"];

    UITabBarController *tabBarController = [UITabBarController new];
    [tabBarController setViewControllers:@[avc, bvc]];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    
    
    //Create a service inside the Vivocha Agent Desktop Settings area
    //Be sure to set the right bundle identifier (e.g. In this project the bundle id is com.vivocha.sdkesample)
    
    //You will find a string like this one in your iOS Service Settings
    [Vivocha startWithAccountID:@"YOUR_ACCOUNT_ID" andServID:@"IOS_SERVICE_ID"];
  
    //During a contact you can send an action from the Agent Desktop
    //using !action|TestAction|[{"controller":"A"}]
    
    [[Vivocha manager] bindAction:@"TestAction" withBlock:^(VivochaCustomAction *action) {
        
        NSDictionary *data = [(NSArray *)[action actionData] firstObject];
        if(data){
            dispatch_async_on_main_thread(^{
                if([[data objectForKey:@"controller"] isEqualToString:@"A"]){
                    [tabBarController setSelectedIndex:0];
                }
                else{
                    [tabBarController setSelectedIndex:1];
                }
            });
        }
    }];
    
    //If you want to enable Push notifications please implement the three methods you find below and call the following
    [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];

    
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"didRegisterForRemoteNotificationsWithDeviceToken: %@", deviceToken);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"didReceiveRemoteNotification: %@", userInfo);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"didFailToRegisterForRemoteNotificationsWithError: %@", error);
}



							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
