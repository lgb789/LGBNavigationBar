//
//  UIViewController+LGBTransition.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//  Copyright © 2018 guoquan li. All rights reserved.
//

#import "UINavigationController+LGBTransition.h"
#import <objc/runtime.h>

@implementation UINavigationController (LGBTransition)
-(LGBTransition *)lgb_transition
{
    LGBTransition *transition = objc_getAssociatedObject(self, _cmd);
    if (!transition) {
        transition = [[LGBTransition alloc] initWithNavigationController:self];
        objc_setAssociatedObject(self, _cmd, transition, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return transition;
}
@end
