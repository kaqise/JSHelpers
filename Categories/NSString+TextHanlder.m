//
//  NSString+TextHanlder.m
//  YXWang
//
//  Created by FengDing_Ping on 2017/9/20.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "NSString+TextHanlder.h"

@implementation NSString (TextHanlder)

- (CGFloat)getTextHeightWithMaxWidth:(CGFloat)width textSize:(CGFloat)textSize{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:textSize]} context:nil];
    return rect.size.height;
}

- (CGFloat)getTextWidthWithMaxHeight:(CGFloat)height textSize:(CGFloat)textSize{
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:textSize]} context:nil];
    return rect.size.width;
}

@end
