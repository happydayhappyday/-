//
//  StartImage.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "StartImage.h"

@implementation StartImage
- (instancetype)initWithDict:(NSDictionary *)dic{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)startImageWithDic:(NSDictionary *)dic{
    return [[StartImage alloc] initWithDict:dic];
    
}
@end
