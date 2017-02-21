//
//  StoriesHeaderCell.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "MainViewController.h"
#import "StoriesHeaderCell.h"

@interface StoriesHeaderCell ()
@property (strong, nonatomic) UILabel* label;

@end
@implementation StoriesHeaderCell
- (UILabel*)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (void)setText:(NSString*)text
{
    if (_text != text) {
        _text = [text copy];
        [self buildHeaderView];
    }
}

- (void)buildHeaderView
{
    self.backgroundColor = [MainViewController themeColor];
    self.label.frame = self.frame;
    self.label.text = self.text;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor = [UIColor whiteColor];
    
    [self addSubview:self.label];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
