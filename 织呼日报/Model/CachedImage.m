//
//  CachedImage.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "CachedImage.h"

@implementation CachedImage
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)cachedImageWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

@end
