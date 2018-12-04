//
//  Example02.m
//  LGBNavigationBar
//
//  Created by guoquan li on 2018/11/25.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "Example02.h"

@interface Example02 ()

@end

@implementation Example02

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.lgb_naviBar.navigationItem.title = @"Example02";
    self.view.backgroundColor = UIColor.greenColor;
    
    self.lgb_naviBar.navigationItem.leftBarButtonItem = [UIBarButtonItem new];
    
    self.lgb_naviBar.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleTapRightButton)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark ------------------------------------------------- public -------------------------------------------------

#pragma mark ------------------------------------------------- private -------------------------------------------------

#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleTapRightButton
{
    [self.navigationController pushViewController:[Example02 new] animated:YES];
}
#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
