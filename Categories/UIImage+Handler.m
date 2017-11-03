//
//  UIImage+Handler.m
//  YXWang
//
//  Created by FengDing_Ping on 2017/9/22.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "UIImage+Handler.h"

@implementation UIImage (Handler)

- (UIImage *)compressedImageToMaximumKB:(CGFloat)kb{
    
    UIImage *image = [self copy];
    NSData *pngData = UIImagePNGRepresentation(image);
//    DLog(@"原始文件大小:%ldKB",pngData.length / 1024)
    
    if (!image) return nil;
        
    CGFloat compressionQuality = 1.0;
    NSData *jpegData;
    do {
        jpegData = UIImageJPEGRepresentation(image, compressionQuality);
//        DLog(@"压缩后图片的大小:%ldKB",jpegData.length /1024);
        compressionQuality -= 0.01;
    } while (jpegData.length > 1024 * kb && compressionQuality >= 0.5);
    
//    NSData *jpegData = UIImageJPEGRepresentation(image, compressionQuality);
//    if (jpegData.length < 1024 * kb) {
//        DLog(@"转换JPEG后图片的大小:%ldKB",jpegData.length / 1024);
//        return [UIImage imageWithData:jpegData];
//    }
//    while (jpegData.length > 1024 * kb && compressionQuality >= 0.5) {
//        jpegData = UIImageJPEGRepresentation(image, compressionQuality);
//        DLog(@"压缩后图片的大小:%ldKB",jpegData.length /1024);
//        compressionQuality -= 0.01;
//    }
    
    return [UIImage imageWithData:jpegData];
    
}


+ (UIImage *)js_createCircleBackImageWithBackColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius{
    
    UIImage *backImage;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    [color setFill];
    [path fill];
    backImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return backImage;
}

@end
