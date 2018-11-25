//
//  LGBTransition.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import "LGBTransition.h"
#import "LGBDragPop.h"
#import "LGBPushAnimation.h"
#import "LGBPopAnimation.h"

@interface LGBTransition () <UINavigationControllerDelegate>
@property (nonatomic, weak) UINavigationController *navigationController;

@property (nonatomic, strong) LGBDragPop *dragPop;
@property (nonatomic, strong) LGBPushAnimation *pushAnimation;
@property (nonatomic, strong) LGBPopAnimation *popAnimation;
@end

@implementation LGBTransition

#pragma mark ------------------------------------------------- init --------------------------------------------------
-(instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    if (self) {
        self.navigationController = navigationController;
    }
    return self;
}
#pragma mark ------------------------------------------------- public -------------------------------------------------
-(void)transitionEnable:(BOOL)enable
{
    self.navigationController.delegate = enable ? self : nil;
}

-(void)resetTransition
{
    self.navigationController.delegate = self;
    self.dragPop = [LGBDragPop new];
    self.dragPop.navigationController = self.navigationController;
    self.pushAnimation = [LGBPushAnimation new];
    self.popAnimation = [LGBPopAnimation new];
}

#pragma mark ------------------------------------------------- private -------------------------------------------------

#pragma mark ------------------------------------------------- delegate -------------------------------------------------
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{

    return operation == UINavigationControllerOperationPop ? self.popAnimation : self.pushAnimation;
    
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{

    return self.dragPop.interacting ? self.dragPop : nil;
}
#pragma mark ------------------------------------------------- event -------------------------------------------------

#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
