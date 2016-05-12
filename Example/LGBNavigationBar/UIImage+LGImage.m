//
//  UIImage+LGImage.m
//  ImageCategory
//
//  Created by lgb789 on 16/2/24.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import "UIImage+LGImage.h"

@implementation UIImage (LGImage)

-(UIImage *)ImageWithCornerRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    
    [[UIBezierPath bezierPathWithRoundedRect:(CGRect){CGPointZero, self.size} cornerRadius:radius] addClip];
    
    [self drawInRect:(CGRect){CGPointZero, self.size}];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

static CGFloat edgeFromRadius(CGFloat radius)
{
    return radius * 2 + 1;
}

+(UIImage *)imageWithColor:(UIColor *)color
              cornerRadius:(CGFloat)cornerRadius
{
    CGFloat minEdge = edgeFromRadius(cornerRadius);
    CGRect rect = CGRectMake(0, 0, minEdge, minEdge);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    path.lineWidth = 1;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    [[UIColor clearColor] setStroke];
//    [[UIColor redColor] setStroke];
    [path fill];
    [path stroke];
    [path addClip];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    return img;
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, cornerRadius, cornerRadius, cornerRadius)];
    
}

+(UIImage *)circularImageWithColor:(UIColor *)color
                              size:(CGSize)size
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:(CGRect){CGPointZero, size}];
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
//    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    [color setStroke];
    
    [path addClip];
    [path fill];
    [path stroke];
//    CGContextAddPath(context, path.CGPath);
//    CGContextFillPath(context);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

-(UIImage *)imageWithMinimumSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [self drawInRect:(CGRect){CGPointZero, size}];
    UIImage *resized = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
//    return resized;
    return [resized resizableImageWithCapInsets:UIEdgeInsetsMake(size.height / 2, size.width / 2, size.height / 2, size.width / 2)];
}

+(UIImage *)stepperPlusImageWithColor:(UIColor *)color
{
    CGFloat iconEdgeSize = 15;
    CGFloat iconInternalEdgeSize = 3;
    CGFloat padding = iconEdgeSize / 2 - iconInternalEdgeSize / 2;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(iconEdgeSize, iconEdgeSize), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, CGRectMake(0, padding, iconEdgeSize, iconInternalEdgeSize));
    CGContextFillRect(context, CGRectMake(padding, 0, iconInternalEdgeSize, iconEdgeSize));
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+(UIImage *)stepperMinusImageWithColor:(UIColor *)color
{
    CGFloat iconEdgeSize = 15;
    CGFloat iconInternalEdgeSize = 3;
    CGFloat padding = iconEdgeSize / 2 - iconInternalEdgeSize / 2;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(iconEdgeSize, iconEdgeSize), NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(ctx, CGRectMake(0, padding, iconEdgeSize, iconInternalEdgeSize));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    return img;
}

+(UIImage *)backButtonWithColor:(UIColor *)color
                     barMetrics:(UIBarMetrics)metrics
                   cornerRadius:(CGFloat)cornerRadius
{
    CGSize size;
    if (metrics == UIBarMetricsDefault) {
        size = CGSizeMake(50, 30);
    }else{
        size = CGSizeMake(60, 23);
    }
    UIBezierPath *path = [self bezierPathForBackButtonInRect:(CGRect){CGPointZero, size} cornerRadius:cornerRadius];
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setFill];
    
    [path addClip];
    [path fill];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
//    return img;
    
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(cornerRadius, 15, cornerRadius, cornerRadius)];
}

+(UIBezierPath *)bezierPathForBackButtonInRect:(CGRect)rect
                                  cornerRadius:(CGFloat)radius
{
    CGFloat centerX = CGRectGetMaxX(rect) - radius;
    CGFloat insetLeft = 10;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint centerPoint = CGPointMake(centerX, CGRectGetMinY(rect) + radius);
    
    [path moveToPoint:CGPointMake(centerPoint.x, CGRectGetMinY(rect))];
    [path addArcWithCenter:centerPoint radius:radius startAngle:M_PI + M_PI_2 endAngle:0 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect) - radius)];
    
    centerPoint = CGPointMake(centerX, CGRectGetMaxY(rect) - radius);
    [path addArcWithCenter:centerPoint radius:radius startAngle:0 endAngle:M_PI_2 clockwise:YES];
    
    [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + insetLeft, CGRectGetMaxY(rect))];
    
    [path addLineToPoint:CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect))];
    
    [path addLineToPoint:CGPointMake(CGRectGetMinX(rect) + insetLeft, CGRectGetMinY(rect))];
    
    [path closePath];
    
    return path;
}

+(UIImage *)buttonImageWithColor:(UIColor *)color
                    cornerRadius:(CGFloat)radius
                     shadowColor:(UIColor *)shadowColor
                    shadowInsets:(UIEdgeInsets)shadowInsets
{
    UIImage *topImg = [self imageWithColor:color cornerRadius:radius];
    UIImage *bottomImg = [self imageWithColor:shadowColor cornerRadius:radius];
    
    CGSize size = CGSizeMake(bottomImg.size.width + shadowInsets.left + shadowInsets.right, bottomImg.size.height + shadowInsets.top + shadowInsets.bottom);
    
    CGRect topRect = CGRectMake(shadowInsets.left, shadowInsets.top, topImg.size.width, topImg.size.height);
    CGRect bottomRect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    if (!CGRectEqualToRect(topRect, bottomRect)) {
        [bottomImg drawInRect:bottomRect];
    }
    
    [topImg drawInRect:topRect];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake(radius + shadowInsets.top, radius + shadowInsets.left, radius + shadowInsets.bottom, radius + shadowInsets.right)];
    
}

@end























