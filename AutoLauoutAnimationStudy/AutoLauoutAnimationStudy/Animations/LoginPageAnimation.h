//
//  LoginPageAnimation.h
//  AutoLauoutAnimationStudy
//
//  Created by 曹学亮 on 16/3/8.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LoginPageAnimation : NSObject

+ (void)titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view;
+ (void)phoneImageAnimationWithImage:(UIImageView *)image withView:(UIView *)view;
+ (void)bottomLineAnimationWithConstaint:(NSLayoutConstraint *)constaint withView:(UIView *)view;
+ (void)tipsLabelMaskAnimation:(UIView*)view withBeginTime:(NSTimeInterval)beginTime;
+ (void)registerButtonWidthAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress;
@end
