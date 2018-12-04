//
//  LGBPopAnimation.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import "LGBPopAnimation.h"

@implementation LGBPopAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    fromViewController.view.layer.shadowColor = [UIColor blackColor].CGColor;
    fromViewController.view.layer.shadowRadius = 5;
    fromViewController.view.layer.shadowOffset = CGSizeMake(0, 0);
    fromViewController.view.layer.shadowOpacity = 0.1;
    
    
    UIView *maskView = [[UIView alloc] initWithFrame:transitionContext.containerView.bounds];
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    [transitionContext.containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
    [transitionContext.containerView insertSubview:maskView aboveSubview:toViewController.view];
    
    CGRect finalToFrame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.frame = CGRectOffset(finalToFrame, 20, 30);

    CGRect originFromFrame = fromViewController.view.frame;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        fromViewController.view.frame = CGRectOffset(originFromFrame, originFromFrame.size.width, 0);
        toViewController.view.frame = finalToFrame;
        maskView.alpha = 0;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        [maskView removeFromSuperview];

    }];
    
    
}
@end
