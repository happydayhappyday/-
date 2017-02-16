//
//  GCDUtil.h
//  织呼日报
//
//  Created by csy on 17/2/16.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger, GCDPriorityQueueLevel){
    DEFAULT = DISPATCH_QUEUE_PRIORITY_DEFAULT,
    LOW = DISPATCH_QUEUE_PRIORITY_LOW,
    HIGH = DISPATCH_QUEUE_PRIORITY_HIGH,
    BACKGROUND = DISPATCH_QUEUE_PRIORITY_BACKGROUND
};
@interface GCDUtil : NSObject

@property (nonatomic) dispatch_queue_t queue;
- (void)async:(dispatch_block_t)block;
- (void)asyncWithGroup:(dispatch_group_t)group block:(dispatch_block_t)block;
- (void)asyscGroupNotify:(dispatch_group_t)group block:(dispatch_block_t)block;

- (void)sync:(dispatch_block_t)block;

+ (instancetype)mainQueue;
+ (instancetype)globalQueueWithLevel:(GCDPriorityQueueLevel)level;

@end
