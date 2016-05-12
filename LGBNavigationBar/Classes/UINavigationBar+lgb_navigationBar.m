//
//  UINavigationBar+lgb_navigationBar.m
//  CustomNavigationBar
//
//  Created by lgb789 on 16/5/12.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import "UINavigationBar+lgb_navigationBar.h"
#import <objc/runtime.h>


@implementation UINavigationBar (lgb_navigationBar)

-(UIImageView *)overlayView
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setOverlayView:(UIImageView *)view
{
    objc_setAssociatedObject(self, @selector(overlayView), view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)lgb_setBackgroundImage:(UIImage *)image
{
    UIImageView *overlay = [self overlayView];
    if (overlay == nil) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [UIImage new];
        CGFloat barHeight = CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
        overlay = [[UIImageView alloc] initWithFrame:CGRectMake(0, -barHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + barHeight)];
        [self insertSubview:overlay atIndex:0];
        [self setOverlayView:overlay];
    }
    overlay.image = image;
}

-(void)lgb_setBackgroundAlpha:(CGFloat)alpha
{
    UIImageView *overlay = [self overlayView];
    overlay.alpha = alpha;
}

-(void)lgb_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = nil;
    [[self overlayView] removeFromSuperview];
    [self setOverlayView:nil];
}

@end
