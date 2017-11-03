//
//  NSString+JSCheck.h
//  YXWang
//
//  Created by FengDing_Ping on 2017/9/12.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSCheck)

/**
 检测手机号格式

 @return YES格式正确
 */
- (BOOL)js_CheckPhone;

/**
 检测密码格式数字字母组合

 @return YES格式正确
 */
- (BOOL)checkPassWord;


/**
 检测真实姓名

 @return YES为真实姓名
 */
- (BOOL)checkRealName;

/**
 检测身份证是否合法

 @return YES格式正确
 */
- (BOOL)checkIDCard;

@end
