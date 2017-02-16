//
//  APIRequest.h
//  织呼日报
//
//  Created by csy on 17/2/16.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIRequest : NSObject
+ (void)requestWithUrl:(NSString *)url;
+ (void)requestWithUrl:(NSString *)url completion:(void (^)(id data, NSString *md5))completion;

+ (NSDictionary *)objToDic:(id)object;

@end
