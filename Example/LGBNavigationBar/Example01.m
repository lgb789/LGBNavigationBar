//
//  Example01.m
//  LGBNavigationBar
//
//  Created by guoquan li on 2018/11/25.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "Example01.h"

@interface Example01 ()

@end

@implementation Example01

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.lgb_naviBar.navigationItem.title = @"Example01";
    self.view.backgroundColor = UIColor.grayColor;
    
    self.lgb_naviBar.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleTapRightButton)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.lgb_transition setPopGestureEnable:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.lgb_transition setPopGestureEnable:YES];
}

#pragma mark ------------------------------------------------- public -------------------------------------------------

#pragma mark ------------------------------------------------- private -------------------------------------------------

#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleTapRightButton
{
    [self.navigationController pushViewController:[Example01 new] animated:YES];
}
#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
