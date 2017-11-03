//
//  NSString+TextHanlder.h
//  YXWang
//
//  Created by FengDing_Ping on 2017/9/20.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TextHanlder)

- (CGFloat)getTextHeightWithMaxWidth:(CGFloat)width textSize:(CGFloat)textSize;

- (CGFloat)getTextWidthWithMaxHeight:(CGFloat)height textSize:(CGFloat)textSize;

@end
