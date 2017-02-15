//
//  StartImage.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartImage : NSObject
@property (copy, nonatomic) NSString *img;
@property (copy, nonatomic) NSString *text;

- (instancetype)initWithDict:(NSDictionary *)dic;
+ (instancetype)startImageWithDic:(NSDictionary *)dic;

@end
