//
//  CacheUtil.m
//  织呼日报
//
//  Created by csy on 17/2/16.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import "CacheUtil.h"
#import "CachedImage.h"
#import "DataKeys.h"
#import "DateUtil.h"
#import "GCDUtil.h"

NSString *const kCacheImagePath = @"iamges/";
NSString *const kDataPath = @"data.plist";

@interface CacheUtil ()
@property (copy, nonatomic) NSString *documentPath;
@property (strong, nonatomic) NSMutableDictionary * cachedImagesDic;

@property (copy, nonatomic) NSString *dataPath;
@property (copy, nonatomic) NSString *imagePath;

@end
@implementation CacheUtil

#pragma mark - init
+ (instancetype)cache{
    static CacheUtil *util = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        util = [[CacheUtil alloc]init];
    });
    return util;
}

#pragma mark - dealloc
- (void)dealloc{
    [self saveData];
}

#pragma mark - getters
- (NSString *)dataPath{
    if(_dataPath == nil){
        _dataPath = [self.documentPath stringByAppendingString:kDataPath];
    }
    return _dataPath;
}
- (NSString *)imagePath{
    if(_imagePath == nil){
        _imagePath = [self.documentPath stringByAppendingString:kCacheImagePath];
        if (![[NSFileManager defaultManager] fileExistsAtPath:_imagePath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:_imagePath withIntermediateDirectories:true attributes:nil error:nil];
        }
    }
    return _imagePath;
}
- (NSString *)documentPath{
    if (_documentPath == nil) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
        _documentPath = [paths[0] stringByAppendingString:@"/"];
    }
    return _documentPath;
}

- (NSDictionary *)dataDic{
    if (_dataDic == nil) {
        _dataDic = [NSMutableDictionary dictionary];
        if ([[NSFileManager defaultManager] fileExistsAtPath:self.dataPath]) {
            _dataDic = [NSMutableDictionary dictionaryWithContentsOfFile:self.dataPath];
        }
    }
    return _dataDic;
}

- (NSMutableDictionary *)cachedImagesDic{
    if (_cachedImagesDic == nil) {
        _cachedImagesDic = self.dataDic[DATAKEY_CACHEDIMAGES];
        if (_cachedImagesDic == nil) {
            _cachedImagesDic = [NSMutableDictionary dictionary];
            [self.dataDic setObject:_cachedImagesDic forKey:DATAKEY_CACHEDIMAGES];
        }
    }
    return _cachedImagesDic;
}
#pragma mark - plist cache
- (void)saveData{
    BOOL result = [self.dataDic writeToFile:self.dataPath atomically:true];
    if (result) {
        NSLog(@"成功保存plist");
    }
}
#pragma mark - image cache
- (void)cacheImageWithKey:(NSString *)key andUrl:(NSString *)url completion:(void (^)(UIImage *image))completion{
    //一步加载图片并缓存到本地
    [[GCDUtil globalQueueWithLevel:DEFAULT] async:^{
        NSData * imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        UIImage * image = [UIImage imageWithData:imgData];
        NSString * cachedImagePath = [self.dataDic objectForKey:key];
        if (cachedImagePath == nil) {
            NSString *fileName = [NSString stringWithFormat:@"%@%04d.png",[DateUtil dateIdentifierNow], arc4random() %10000];
            NSString *savePath = [self.imagePath stringByAppendingString:fileName];
            NSError *error = nil;
            BOOL result = [UIImagePNGRepresentation(image) writeToFile:savePath options:NSDataWritingAtomic error:&error];
            if (result) {
                [self.cachedImagesDic setObject:@{ DATAKEY_CACHEDIMAGES_URL : url,DATAKEY_CACHEDIMAGES_FILENAME : fileName} forKey:key];
                if (completion != nil) {
                    [[GCDUtil mainQueue] async:^{
                        completion(image);
                    }];
                }
            }
            else
                NSLog(@"Fail to save image %@", error.localizedDescription);

        }
    }];
}
- (UIImage *)imageWithKey:(NSString *)key{
    CachedImage *model = [self cachedImageWithKey:key];
    if(model == nil){
        return nil;
    }
    NSString *path = [self.imagePath stringByAppendingString:model.fileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        return image;
    }
    return nil;
}
- (CachedImage *)cachedImageWithKey:(NSString *)key{
    CachedImage *model = [CachedImage cachedImageWithDic:self.cachedImagesDic[key]];
    return model.fileName == nil ? nil : model;
}

@end
