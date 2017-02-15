//
//  APIDataSource.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "APIDataSource.h"

@implementation APIDataSource

+ (instancetype)dataSource{
    static APIDataSource *datasource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        datasource = [[APIDataSource alloc]init];
    });
    return datasource;
}


- (void)newsLatest:(void (^)(BOOL needsToReload))completion{
    
}
- (void)newsBefore:(NSString *)date completion:(void (^)(void))completion{
    
}



- (void)startImage:(void (^)(void))completion{
    
}



- (void)news:(NSUInteger)identifier completion:(void (^)(void))completion{
    
}

@end
