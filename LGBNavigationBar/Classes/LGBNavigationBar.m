//
//  LGBNavigationBar.m
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/23.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import "LGBNavigationBar.h"

@interface LGBNavigationBar ()
@property (nonatomic, weak) UIViewController *viewController;
@property (nonatomic, weak) UINavigationController *navigationController;
@property (nonatomic, strong) NSLayoutConstraint *topConstraint;

@end

static NSString *kNaviBarCenterKey = @"center";

@implementation LGBNavigationBar

- (void)dealloc
{
    if (self.navigationController) {
        [self.navigationController.navigationBar removeObserver:self forKeyPath:kNaviBarCenterKey];
    }
}

#pragma mark ------------------------------------------------- init --------------------------------------------------

-(instancetype)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    if (self) {
        self.viewController = viewController;
        self.navigationController = viewController.navigationController;
        [self configBar];
    }
    return self;
}

#pragma mark ------------------------------------------------- public -------------------------------------------------
-(void)setBackButtonItem:(UIBarButtonItem *)backButtonItem
{
    if (self.navigationController.viewControllers.count > 1 && self.navigationItem.leftBarButtonItem == nil && self.navigationItem.leftBarButtonItems == nil) {
        self.navigationItem.leftBarButtonItem = backButtonItem;
        [self.navigationItem.leftBarButtonItem setTarget:self];
        [self.navigationItem.leftBarButtonItem setAction:@selector(handlePressedBackButtonItem)];
    }
}
#pragma mark ------------------------------------------------- private -------------------------------------------------
-(void)configBar
{
    self.items = @[self.navigationItem];
    self.delegate = self;
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.viewController.view addSubview:self];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.viewController.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.viewController.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    
    NSLayoutConstraint *topConstraint = nil;
    
    if (@available(iOS 11.0, *)) {
        topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.viewController.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        
    } else {
        // Fallback on earlier versions
        topConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.viewController.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame)];
    }
    
    self.topConstraint = topConstraint;
    
    [self.viewController.view addConstraints:@[leftConstraint, rightConstraint, topConstraint]];
    
    [self.navigationController.navigationBar addObserver:self forKeyPath:kNaviBarCenterKey options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark ------------------------------------------------- delegate -------------------------------------------------
-(UIBarPosition)positionForBar:(id<UIBarPositioning>)bar
{
    return UIBarPositionTopAttached;
}
#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (object == self.navigationController.navigationBar) {

        if (@available(iOS 11.0, *)){
            
        }else{
            //更新约束
            self.topConstraint.constant = CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame);
        }
        
        
    }
}

-(void)handlePressedBackButtonItem
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ------------------------------------------------- getters -------------------------------------------------

-(UINavigationItem *)navigationItem
{
    if (_navigationItem == nil) {
        _navigationItem = [UINavigationItem new];
    }
    return _navigationItem;
}

@end
