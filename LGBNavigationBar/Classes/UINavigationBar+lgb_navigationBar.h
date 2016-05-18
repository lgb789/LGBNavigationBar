//
//  UINavigationBar+lgb_navigationBar.h
//  CustomNavigationBar
//
//  Created by lgb789 on 16/5/12.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (lgb_navigationBar)

-(void)lgb_setBackgroundImage:(UIImage *)image
                     extended:(BOOL)extended;

-(void)lgb_setBackgroundAlpha:(CGFloat)alpha;

-(void)lgb_reset;

@end
