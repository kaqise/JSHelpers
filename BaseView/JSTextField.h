//
//  JSTextField.h
//  Demo_02
//
//  Created by FengDing_Ping on 2017/10/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTextField : UITextField

/**
 输入框字数限制
 */
@property (nonatomic, assign)NSInteger kMaxLength;
/**
 晃动动画
 */
- (void)showAnnimation;

@end
