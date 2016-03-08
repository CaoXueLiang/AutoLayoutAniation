//
//  LoginPageAnimation.m
//  AutoLauoutAnimationStudy
//
//  Created by 曹学亮 on 16/3/8.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "LoginPageAnimation.h"

@implementation LoginPageAnimation

+ (void)titleLabelAnimationWithLabel:(UILabel *)label withView:(UIView *)view{
   [UIView animateWithDuration:1.5 animations:^{
       label.transform = CGAffineTransformIdentity;
   }];
}

+ (void)phoneImageAnimationWithImage:(UIImageView *)image withView:(UIView *)view{
  [UIView animateWithDuration:1.5 animations:^{
      image.transform = CGAffineTransformIdentity;
  }];
}

+ (void)bottomLineAnimationWithConstaint:(NSLayoutConstraint *)constaint withView:(UIView *)view{
  [UIView animateWithDuration:1.5 animations:^{
      constaint.constant =  view.bounds.size.width - 40;
      [view layoutIfNeeded];
  }];
}

+ (void)tipsLabelMaskAnimation:(UIView*)view withBeginTime:(NSTimeInterval)beginTime{
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(view.bounds))].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetWidth(view.bounds))].CGPath;
    
    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    
    view.layer.mask = layer;
    
    CABasicAnimation * basicAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    basicAnimation.duration = 1.0;
    basicAnimation.beginTime = CACurrentMediaTime() + beginTime;;
    basicAnimation.fromValue = (id)layer.path;
    basicAnimation.toValue = (__bridge id)endPath;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [layer addAnimation:basicAnimation forKey:@"shapeLayerPath"];
}

+ (void)registerButtonWidthAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress{
    
    static CAShapeLayer * layer = nil;
    if (!button.layer.mask) {
        layer = [CAShapeLayer layer];
        layer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds) * progress, CGRectGetHeight(button.bounds))].CGPath;
        layer.fillColor = [UIColor whiteColor].CGColor;
        button.layer.mask = layer;
    }else{
        CGPathRef path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(button.bounds)*progress, CGRectGetHeight(button.bounds))].CGPath;
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.duration = 0.25;
        animation.fromValue = (id)layer.path;
        animation.toValue = (__bridge id)path;
        animation.removedOnCompletion = YES;
        [layer addAnimation:animation forKey:@"shapeLayerPath"];
        layer.path = path;
    }
}

@end
