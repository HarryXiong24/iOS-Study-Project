//
//  SceneDelegate.m
//  AppDemo
//

#import "Controllers/IntroductionController.h"
#import "Controllers/TableListController.h"
#import "Controllers/TestAController.h"
#import "Controllers/VideoController.h"
#import "Controllers/WebViewController.h"
#import "SceneDelegate.h"
#import "Utils/Location.h"
#import "Utils/Notification.h"
#import "Controllers/KeyboardController.h"

@interface SceneDelegate () <UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.view.backgroundColor = [UIColor grayColor];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:(UIViewController *)tabBarController];

//    UIViewController *controller1 = [[UIViewController alloc] init];
//    controller1.view.backgroundColor = [UIColor lightGrayColor];
    TestAController *viewController1 = [[TestAController alloc] init];
    viewController1.tabBarItem.title = @"TestA";

    TableListController *viewController2 = [[TableListController alloc] init];
    VideoController *viewController3 = [[VideoController alloc] init];
    IntroductionController *viewController4 = [[IntroductionController alloc] init];
    WebViewController *viewController5 = [[WebViewController alloc] init];
    KeyboardController *viewController6 = [[KeyboardController alloc] init];

    [tabBarController setViewControllers:@[viewController1, viewController2, viewController3, viewController4, viewController5, viewController6]];

    tabBarController.delegate = self;

    self.window.rootViewController = navigationController;
    self.window.backgroundColor = [UIColor whiteColor];
    [[Location locationManager] checkLocationAuthorization];
    [[Notification notificationManager] checkNotificationAuthorization];
    [self.window makeKeyAndVisible];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"Did Select!");
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

@end
