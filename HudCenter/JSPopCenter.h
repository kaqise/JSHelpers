//
//  JSPopCenter.h
//  Demo_02
//
//  Created by FengDing_Ping on 2017/10/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JSPopCenter : NSObject

/**  字体颜色 */
#define MBTextColor [UIColor blackColor]

/**  繁忙提示(简) */
+ (void)js_showBusynessText:(nullable NSString *)text;

/**  文字提示框(简) */
+ (void)showText:(nullable NSString *)text duration:(NSTimeInterval)duration;

/**  繁忙提示 */
+ (void)js_showBusynessText:(nullable NSString *)text addTo:(UIView *)view;

/**  文字提示框 */
+ (void)showText:(nullable NSString *)text addTo:(UIView *)view duration:(NSTimeInterval)duration;

/**  有提示框 继续显示其他文字内容 */
+ (void)js_continueShowText:(NSString *)text;

/**  以成功结束提示框 */
+ (void)js_successWithText:(nullable NSString *)text duration:(NSTimeInterval)duration;

/**  以失败结束提示框 */
+ (void)js_failureWithText:(nullable NSString *)text duration:(NSTimeInterval)duration;

/**  以文字结束提示框 */
+ (void)js_completeWithText:(nullable NSString *)text duration:(NSTimeInterval)duration;

/**  消失 */
+ (void)js_hide;

@end

NS_ASSUME_NONNULL_END
