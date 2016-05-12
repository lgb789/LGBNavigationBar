//
//  UIImage+LGImage.h
//  ImageCategory
//
//  Created by lgb789 on 16/2/24.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LGImage)

-(UIImage *)ImageWithCornerRadius:(CGFloat)radius;

+(UIImage *)imageWithColor:(UIColor *)color
              cornerRadius:(CGFloat)cornerRadius;

/**
 *
 *
 *  @param color
 *  @param size
 *
 *  @return
 */
+(UIImage *)circularImageWithColor:(UIColor *)color
                              size:(CGSize)size;

-(UIImage *)imageWithMinimumSize:(CGSize)size;

+(UIImage *)stepperPlusImageWithColor:(UIColor *)color;

+(UIImage *)stepperMinusImageWithColor:(UIColor *)color;


+(UIImage *)backButtonWithColor:(UIColor *)color
                     barMetrics:(UIBarMetrics)metrics
                   cornerRadius:(CGFloat)cornerRadius;

+(UIImage *)buttonImageWithColor:(UIColor *)color
                    cornerRadius:(CGFloat)radius
                     shadowColor:(UIColor *)shadowColor
                    shadowInsets:(UIEdgeInsets)shadowInsets;
@end
