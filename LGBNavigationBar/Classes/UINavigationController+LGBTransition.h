//
//  UIViewController+LGBTransition.h
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//  Copyright © 2018 guoquan li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGBTransition.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (LGBTransition)
-(LGBTransition *)lgb_transition;
@end

NS_ASSUME_NONNULL_END
