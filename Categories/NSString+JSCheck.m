//
//  NSString+JSCheck.m
//  YXWang
//
//  Created by FengDing_Ping on 2017/9/12.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "NSString+JSCheck.h"

@implementation NSString (JSCheck)

//正则判断手机号码格式
- (BOOL)js_CheckPhone{
    
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(17[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}


- (BOOL)checkPassWord{
    //6-20位数字和字母组成(可根据情况修改)
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,15}$";
    NSPredicate *   pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self]) {
        return YES ;
    }else
        return NO;
}

- (BOOL)checkRealName{
    
    NSRange range1 = [self rangeOfString:@"·"];
    NSRange range2 = [self rangeOfString:@"•"];
    if(range1.location != NSNotFound ||   // 中文 ·
       range2.location != NSNotFound )    // 英文 •
    {
        //一般中间带 `•`的名字长度不会超过15位，如果有那就设高一点
        if ([self length] < 2 || [self length] > 15)
        {
            return NO;
        }
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[\u4e00-\u9fa5]+[·•][\u4e00-\u9fa5]+$" options:0 error:NULL];
        
        NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
        
        NSUInteger count = [match numberOfRanges];
        
        return count == 1;
    }
    else
    {
        //一般正常的名字长度不会少于2位并且不超过8位，如果有那就设高一点
        if ([self length] < 2 || [self length] > 8) {
            return NO;
        }
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[\u4e00-\u9fa5]+$" options:0 error:NULL];
        
        NSTextCheckingResult *match = [regex firstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
        
        NSUInteger count = [match numberOfRanges];
        
        return count == 1;
    }
}

- (BOOL)checkIDCard{
    NSMutableArray *IDArray = [NSMutableArray array];
    // 遍历身份证字符串,存入数组中
    for (int i = 0; i <18; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        [IDArray addObject:subString];
    }
    // 系数数组
    NSArray *coefficientArray = @[@7, @9, @10, @5, @8, @4, @2, @1, @6, @3, @7, @9, @10, @5, @8, @4, @"2"];
    // 余数数组
    NSArray *remainderArray = @[@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
    // 每一位身份证号码和对应系数相乘之后相加所得的和
    int sum = 0;
    for (int i = 0; i <17; i++) {
        int coefficient = [coefficientArray[i] intValue];
        int ID = [IDArray[i] intValue];
        sum += coefficient * ID;
    }
    // 这个和除以11的余数对应的数
    NSString *str = remainderArray[(sum % 11)];
    // 身份证号码最后一位
    NSString *string = [self substringFromIndex:17];
    // 如果这个数字和身份证最后一位相同,则符合国家标准,返回YES
    return [str isEqualToString:string];
}

@end
