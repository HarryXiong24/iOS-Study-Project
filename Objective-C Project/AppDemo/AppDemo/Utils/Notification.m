//
//  Notification.m
//  AppDemo
//

#import "Notification.h"
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>


@interface Notification () <UNUserNotificationCenterDelegate>

@end

@implementation Notification

+ (Notification *)notificationManager{
    static Notification *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Notification alloc] init];
    });
    return manager;
}

- (void )checkNotificationAuthorization{
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) {
            // local notification
            [self _pushLocalNotification];
            
            // remote notification
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }
    }];
}

#pragma mark -

- (void)_pushLocalNotification{
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"Notification";
    content.body = @"xxxxxxxx";
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:30.f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];

    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        //
    }];
}

#pragma mark -

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    completionHandler(UNNotificationPresentationOptionList | UNNotificationPresentationOptionBanner);
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    
    // 处理badge展示逻辑
    // 点击之后根据业务逻辑处理
    //[UIApplication sharedApplication].applicationIconBadgeNumber = 100;

    // handle custom logic
    completionHandler();
}

@end
