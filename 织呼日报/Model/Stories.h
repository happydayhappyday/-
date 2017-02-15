//
//  Stories.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stories : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *ga_prefix;
@property (copy, nonatomic) NSArray *images;
@property (strong, nonatomic) NSString *image;
@property (assign, nonatomic) NSUInteger *type;
@property (assign, nonatomic) NSUInteger *identifier;
@property (assign, nonatomic) BOOL multipic;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)storiesWithDic:(NSDictionary *)dic;
+ (NSArray<Stories*>*)stories:(NSArray *)array;

@end
