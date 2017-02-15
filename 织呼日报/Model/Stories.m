//
//  Stories.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "Stories.h"

@implementation Stories

- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if(self){
        self.title = dic[@"title"];
        self.ga_prefix = dic[@"title"];
        self.images = dic[@"images"];
        self.image = dic[@"image"];
        self.type = [dic[@"type"] integerValue];
        self.identifier = [dic[@"id"] integerValue];
        self.multipic = [dic[@"multipic"] boolValue];
    }
    return self;
}
+ (instancetype)storiesWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
+ (NSArray<Stories*>*)stories:(NSArray *)array{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (id obj in array) {
        [arrayM addObject:[self storiesWithDic:obj]];
    }
    return arrayM;
}

@end
