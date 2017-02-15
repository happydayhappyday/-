//
//  CachedImage.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CachedImage : NSObject
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *fileName;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)cachedImageWithDic:(NSDictionary *)dic;

@end
