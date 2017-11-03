//
//  JSTextField.m
//  Demo_02
//
//  Created by FengDing_Ping on 2017/10/30.
//  Copyright © 2017年 FengDing_Ping. All rights reserved.
//

#import "JSTextField.h"

@implementation JSTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addTarget:self action:@selector(valueDidChange) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)showAnnimation{
    CABasicAnimation *baseAnnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    baseAnnimation.fromValue = @(-5);
    baseAnnimation.toValue = @5;
    baseAnnimation.duration = 0.1;
    baseAnnimation.autoreverses = YES;
    baseAnnimation.repeatCount = 2;
    baseAnnimation.removedOnCompletion = YES;
    [self.layer addAnimation:baseAnnimation forKey:@"baseAnnimation"];
}

- (void)valueDidChange{
    
    if (_kMaxLength == 0) return;
    
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (!position)
    {
        if (toBeString.length > _kMaxLength)
        {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:_kMaxLength];
            if (rangeIndex.length == 1)
            {
                self.text = [toBeString substringToIndex:_kMaxLength];
            }
            else
            {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, _kMaxLength)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
    
    
}

@end
