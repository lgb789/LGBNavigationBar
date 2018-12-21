//
//  Example05.m
//  LGBNavigationBar
//
//  Created by mac_256 on 2018/12/5.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "Example05.h"
#import "Example06.h"

@interface Example05 ()

@end

@implementation Example05

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lgb_naviBar.navigationItem.title = @"Example05";
    self.view.backgroundColor = UIColor.brownColor;
    
    self.lgb_naviBar.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleTapRightButton)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSLog(@"example05 view appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

//    [self.navigationController.lgb_transition setPanPopGestureEnable:YES];
    NSLog(@"example05 viewWillDisappear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"example05 did appear");
//    [self.navigationController.lgb_transition setScreenPanPopGestureEnable:YES];
    [self.navigationController.lgb_transition setPopPanType:LGBTransitionPanTypeScreenPan];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"example05 viewDidDisappear");
//    [self.navigationController.lgb_transition setPanPopGestureEnable:YES];
}

#pragma mark ------------------------------------------------- public -------------------------------------------------

#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleTapRightButton
{
    [self.navigationController pushViewController:[Example06 new] animated:YES];
}
#pragma mark ------------------------------------------------- private -------------------------------------------------

#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
