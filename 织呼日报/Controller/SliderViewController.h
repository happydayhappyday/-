//
//  SliderViewController.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Stories;
@class Story;
@class SliderView;
@interface SliderViewController : UIViewController
@property (strong, nonatomic) SliderView* sliderView;

- (instancetype)initWithFrame:(CGRect)frame
                   andStories:(NSArray<Stories*>*)stories;
- (instancetype)initWithFrame:(CGRect)frame andStory:(Story*)story;
@end
