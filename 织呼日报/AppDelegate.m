//
//  AppDelegate.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "AppDelegate.h"
#import "APIDataSource.h"
#import "CacheUtil.h"
#import "CachedImage.h"
#import "LoadingViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[APIDataSource dataSource] startImage:nil];
    return YES;
}

- (void)changeRootViewController:(UIViewController *)viewController
                         animate:(BOOL)animate{
    if (!self.window.rootViewController || !animate) {
        self.window.rootViewController = viewController;
        return;
    }
    UIView *snapShot = [self.window snapshotViewAfterScreenUpdates:YES];
    [viewController.view addSubview:snapShot];
    
    self.window.rootViewController = viewController;
    
    [UIView animateWithDuration:1 animations:^{
        snapShot.layer.opacity = 0;
    }
     completion:^(BOOL finished) {
         [snapShot removeFromSuperview];
     }];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    [[CacheUtil cache] saveData];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[CacheUtil cache]saveData];
}


@end
