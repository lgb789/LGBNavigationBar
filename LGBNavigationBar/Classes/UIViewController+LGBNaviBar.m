//
//  UIViewController+LGBNaviBar.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/23.
//  Copyright © 2018 guoquan li. All rights reserved.
//

#import "UIViewController+LGBNaviBar.h"
#import <objc/runtime.h>

@implementation UIViewController (LGBNaviBar)
-(LGBNavigationBar *)lgb_naviBar
{
    LGBNavigationBar *naviBar = objc_getAssociatedObject(self, _cmd);
    if (!naviBar) {
        naviBar = [[LGBNavigationBar alloc] initWithViewController:self];
        objc_setAssociatedObject(self, _cmd, naviBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC); 
    }
    
    return naviBar;
}
@end
