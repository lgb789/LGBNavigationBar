//
//  LGBDragPop.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import "LGBDragPop.h"

@interface LGBDragPop ()

@end

@implementation LGBDragPop

-(void)setNavigationController:(UINavigationController *)navigationController
{
    _navigationController = navigationController;
    if (_navigationController) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
        [self.navigationController.view addGestureRecognizer:pan];
    }
}

-(void)onPan:(UIPanGestureRecognizer *)pan
{
    CGPoint offset = [pan translationInView:pan.view];
    CGPoint velocity = [pan velocityInView:pan.view];
    CGFloat percent = offset.x / pan.view.bounds.size.width;
    percent = MAX(percent, 0);
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            if (self.percentComplete > 0) {
                return;
            }
            if (!self.interacting && self.navigationController.viewControllers.count > 1 && velocity.x > 0) {
                self.interacting = YES;
                [self.navigationController popViewControllerAnimated:YES];
            }
            
            break;
        case UIGestureRecognizerStateChanged:
            if (self.interacting) {
                [self updateInteractiveTransition:percent];
                [self.delegate lgb_dragPop:self progress:percent];
            }
            break;
        case UIGestureRecognizerStateEnded:
            if (self.interacting) {
                
                if (percent >= 0.5) {
                    self.completionSpeed = MIN(1 - self.percentComplete, 0.25);
                    [self finishInteractiveTransition];
                    [self.delegate lgb_dragPopFinish:self];
                }else if (velocity.x > 300){
                    self.completionSpeed = 0.5;
                    [self finishInteractiveTransition];
                    [self.delegate lgb_dragPopFinish:self];
                }else{
                    self.completionSpeed = MIN(self.percentComplete, 0.25);
                    [self cancelInteractiveTransition];
                    [self.delegate lgb_dragPopCancle:self];
                }
                self.interacting = NO;
            }
            break;
        case UIGestureRecognizerStateCancelled:
            if (self.interacting) {
                [self cancelInteractiveTransition];
                self.interacting = NO;
                [self.delegate lgb_dragPopCancle:self];
            }
            break;
        default:
            break;
    }
}

@end
