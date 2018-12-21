//
//  LGBTransition.h
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    LGBTransitionPanTypeNone,
    LGBTransitionPanTypePan,
    LGBTransitionPanTypeScreenPan,
} LGBTransitionPanType;

@interface LGBTransition : NSObject

-(instancetype)initWithNavigationController:(UINavigationController *)navigationController;

-(void)resetTransition;

-(void)setPopPanType:(LGBTransitionPanType)panType;

@end
