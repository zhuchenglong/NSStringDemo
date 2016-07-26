//
//  NSString+Pinyin.h
//  分离字符串
//
//  Created by zhuchenglong on 16/7/26.
//  Copyright © 2016年 zhuchenglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Pinyin)
//获取汉字转成拼音字符串
+ (NSString *)transformToPinyin:(NSString *)aString;
@end
