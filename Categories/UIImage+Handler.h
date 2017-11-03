//
//  UIImage+Handler.h
//  YXWang
//
//  Created by FengDing_Ping on 2017/9/22.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Handler)

- (UIImage *)compressedImageToMaximumKB:(CGFloat)kb;

+ (UIImage *)js_createCircleBackImageWithBackColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius;

@end
