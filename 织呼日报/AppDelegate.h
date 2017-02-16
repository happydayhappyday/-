//
//  AppDelegate.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
- (void)changeRootViewController:(UIViewController *)viewController
                         animate:(BOOL)animate;


@end

