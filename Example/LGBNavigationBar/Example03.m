//
//  Example03.m
//  LGBNavigationBar
//
//  Created by guoquan li on 2018/11/25.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "Example03.h"

@interface Example03 ()

@end

@implementation Example03

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
  
//    self.lgb_naviBar.navigationItem.title = @"Example03";
    self.view.backgroundColor = UIColor.purpleColor;
    
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.backgroundColor = UIColor.redColor;
    bt.frame = CGRectMake(0, 0, 100, 40);
    bt.center = self.view.center;
    [bt addTarget:self action:@selector(handleTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
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
-(void)handleTapButton
{
    [self.navigationController pushViewController:[Example03 new] animated:YES];
}
#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
