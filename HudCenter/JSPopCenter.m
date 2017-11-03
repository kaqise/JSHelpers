//
//  JSPopCenter.m
//  Demo_02
//
//  Created by FengDing_Ping on 2017/10/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "JSPopCenter.h"
#import <MBProgressHUD.h>

@interface JSPopCenter ()

@property (nonatomic, strong)MBProgressHUD *hud;

@end

@implementation JSPopCenter

+ (instancetype)sharedCenter{
    static JSPopCenter *center = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[JSPopCenter alloc]init];
        
    });
    return center;
}

+ (void)js_showBusynessText:(NSString *)text{
    
    [self js_showBusynessText:text addTo:[UIApplication sharedApplication].keyWindow];
    
}

+ (void)showText:(NSString *)text duration:(NSTimeInterval)duration{
    
    [self showText:text addTo:[UIApplication sharedApplication].keyWindow duration:duration];
}

+ (void)js_showBusynessText:(NSString *)text addTo:(UIView *)view{
    
    [[self sharedCenter] showText:text addTo:view duration:MAXFLOAT model:MBProgressHUDModeIndeterminate];
}

+ (void)showText:(NSString *)text addTo:(UIView *)view duration:(NSTimeInterval)duration{
    [[self sharedCenter] showText:text addTo:view duration:duration model:MBProgressHUDModeText];
}

- (void)showText:(nullable NSString *)text addTo:(UIView *)view duration:(NSTimeInterval)duration model:(MBProgressHUDMode)model{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.textColor = MBTextColor;
    _hud = hud;
    hud.mode = model;
    hud.label.text = text;
    
    duration > 5 ?: [hud hideAnimated:YES afterDelay:duration];
    
}

+ (void)js_continueShowText:(NSString *)text{
    [JSPopCenter sharedCenter].hud.mode = MBProgressHUDModeText;
    [JSPopCenter sharedCenter].hud.label.text = text;
}

+ (void)js_successWithText:(NSString *)text duration:(NSTimeInterval)duration{
    [JSPopCenter sharedCenter].hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"success.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    [JSPopCenter sharedCenter].hud.customView = imageView;
    [JSPopCenter sharedCenter].hud.label.text = text ? text : @"Success!";
    [[JSPopCenter sharedCenter].hud hideAnimated:YES afterDelay:MAX(1.2, duration)];
}

+ (void)js_failureWithText:(NSString *)text duration:(NSTimeInterval)duration{
    [JSPopCenter sharedCenter].hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [UIImage imageNamed:@"failure.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    [JSPopCenter sharedCenter].hud.customView = imageView;
    [JSPopCenter sharedCenter].hud.label.text = text ? text : @"Failure!";
    [[JSPopCenter sharedCenter].hud hideAnimated:YES afterDelay:MAX(1.2, duration)];
}


+ (void)js_completeWithText:(NSString *)text duration:(NSTimeInterval)duration{
    [JSPopCenter sharedCenter].hud.mode = MBProgressHUDModeText;
    [JSPopCenter sharedCenter].hud.label.text = text ? text : @"Completed!";
    [[JSPopCenter sharedCenter].hud hideAnimated:YES afterDelay:MAX(1.2, duration)];
    
}

+ (void)js_hide{
    [[JSPopCenter sharedCenter].hud hideAnimated:YES];
}




@end
