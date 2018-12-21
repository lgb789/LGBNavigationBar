//
//  Example04.m
//  LGBNavigationBar
//
//  Created by mac_256 on 2018/12/5.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "Example04.h"
#import "Example05.h"

@interface Example04 ()

@end

@implementation Example04

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lgb_naviBar.navigationItem.title = @"Example04";
    self.view.backgroundColor = UIColor.orangeColor;
    
    self.lgb_naviBar.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleTapRightButton)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSLog(@"example04 viewWillAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    NSLog(@"example04 viewWillDisappear");
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController.lgb_transition setPopPanType:LGBTransitionPanTypePan];
}
#pragma mark ------------------------------------------------- public -------------------------------------------------

#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleTapRightButton
{
    [self.navigationController pushViewController:[Example05 new] animated:YES];
}
#pragma mark ------------------------------------------------- private -------------------------------------------------

#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
