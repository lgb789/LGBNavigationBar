//
//  LGBPushAnimation.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import "LGBPushAnimation.h"

@implementation LGBPushAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [transitionContext.containerView addSubview:toViewController.view];
    
    CGRect originFromFrame = fromViewController.view.frame;

    CGRect finalToFrame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.frame = CGRectOffset(finalToFrame, finalToFrame.size.width, 0);

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toViewController.view.frame = finalToFrame;
        fromViewController.view.frame = CGRectOffset(originFromFrame, 20, 30);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
}
@end
