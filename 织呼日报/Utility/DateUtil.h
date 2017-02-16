//
//  DateUtil.h
//  织呼日报
//
//  Created by csy on 17/2/16.
//  Copyright © 2017年 xyq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

+ (NSDate *)stringToDate:(NSString *)dateString format:(NSString *)format;
+ (NSString *)dateString:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)dateIdentifierNow;
+ (NSString *)dateString:(NSString *)originalStr fromFormat:(NSString *)fromFormat toFoormat:(NSString *)toFormat;
+ (NSString *)appendWeekStringFromDate:(NSDate *)date withFormat:(NSString *)format;
+ (NSString *)wekdayStringFromDate:(NSDate *)inputDate;

                        
                          
@end
