//
//  StoryView.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderViewController.h"
@protocol StoryViewDelegate <NSObject>

- (void)releaseStoryView;
@end
@interface StoryView : UIWebView
@property (weak, nonatomic) id<StoryViewDelegate> storyViewDelegate;
@property (strong, nonatomic) SliderViewController *sliderViewController;
@property (assign,nonatomic) NSUInteger identifier;


@end
