//
//  StoriesTableViewCell.m
//  织呼日报
//
//  Created by csy on 17/2/15.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "StoriesTableViewCell.h"
@interface StoriesTableViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView* mainImageView;
@property (strong, nonatomic) IBOutlet UIImageView* multiImageView;
@property (strong, nonatomic) IBOutlet UILabel* contentLabel;

@end

@implementation StoriesTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setStories:(Stories*)stories
{
    if (stories != _stories) {
        _stories = stories;
        [self buildView];
    }
}
- (void)buildView
{
    [self loadImage];
    [self.multiImageView setHidden:!self.stories.multipic];
    self.contentLabel.font = [UIFont systemFontOfSize:17 weight:0.2];
    self.contentLabel.text = self.stories.title;
    [self.contentLabel sizeToFit];
}
- (void)loadImage
{
    CacheUtil* util = [CacheUtil cache];
    [self.stories.images enumerateObjectsUsingBlock:^(NSString* url, NSUInteger idx, BOOL* stop) {
        if ([util imageWithKey:url] == nil)
            [util cacheImageWithKey:url andUrl:url completion:^(UIImage* image) {
                self.mainImageView.image = image;
            }];
        else
            self.mainImageView.image = [util imageWithKey:url];
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
