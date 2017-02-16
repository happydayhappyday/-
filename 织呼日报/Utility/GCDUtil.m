//
//  GCDUtil.m
//  织呼日报
//
//  Created by csy on 17/2/16.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "GCDUtil.h"

@implementation GCDUtil
- (void)async:(dispatch_block_t)block{
    dispatch_async(self.queue, block);
}
- (void)asyncWithGroup:(dispatch_group_t)group block:(dispatch_block_t)block{
    dispatch_group_async(group, self.queue, block);
}
- (void)asyscGroupNotify:(dispatch_group_t)group block:(dispatch_block_t)block{
    dispatch_group_notify(group, self.queue, block);
}

- (void)sync:(dispatch_block_t)block{
    dispatch_sync(self.queue, block);
}

#pragma mark -
+ (instancetype)mainQueue{
    static GCDUtil *util = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = [[GCDUtil alloc]init];
        util.queue = dispatch_get_main_queue();
    });
    return util;
}
+ (instancetype)globalQueueWithLevel:(GCDPriorityQueueLevel)level{
    static GCDUtil *util = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        util = [[GCDUtil alloc]init];
        util.queue = dispatch_get_global_queue(level, 0);
    });
    return util;
}
@end
