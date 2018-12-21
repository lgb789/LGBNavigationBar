//
//  LGBDragPop.h
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGBPopAnimation.h"

@class LGBDragPop;

@protocol LGBDragPopDelegate <NSObject>

-(void)lgb_dragPop:(LGBDragPop *)dragPop progress:(CGFloat)progress;
-(void)lgb_dragPopFinish:(LGBDragPop *)dragPop;
-(void)lgb_dragPopCancle:(LGBDragPop *)dragPop;

@end

@interface LGBDragPop : UIPercentDrivenInteractiveTransition
@property (nonatomic, weak) id<LGBDragPopDelegate> delegate;
@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, assign) BOOL interacting;

-(void)enablePanPopGesture;

-(void)enableScreenPanPopGestureEnable;

-(void)disablePanPopGesture;
@end
