//
//  Story.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "Story.h"

@implementation Story
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.css = [dic[@"css"] firstObject];
        self.image = dic[@"iamge"];
        self.imageSource = dic[@"image_Source"];
        self.body = dic[@"body"];
        self.title = dic[@"title"];
        self.type = [dic[@"type"]integerValue];
        self.id = [dic[@"id"]integerValue];
        
    }
    return self;
}
+ (instancetype)storyWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
    
}
@end
