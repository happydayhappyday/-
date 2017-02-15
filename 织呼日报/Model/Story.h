//
//  Story.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject
@property (assign, nonatomic) NSUInteger id;
@property (assign, nonatomic) NSInteger type;
@property (copy, nonatomic) NSString *css;
@property (copy, nonatomic) NSString *body;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *image;
@property (copy, nonatomic) NSString *imageSource;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)storyWithDic:(NSDictionary *)dic;

@end
