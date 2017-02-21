//
//  StoriesTableViewCell.h
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stories.h"
#import "CacheUtil.h"
#import "StoriesTableViewCell.h"
@interface StoriesTableViewCell : UITableViewCell
@property (strong, nonatomic) Stories* stories;
@end
