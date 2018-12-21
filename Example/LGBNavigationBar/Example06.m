//
//  Example06.m
//  LGBNavigationBar
//
//  Created by mac_256 on 2018/12/5.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "Example06.h"

@interface Example06 ()

@end

@implementation Example06

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.lgb_naviBar.navigationItem.title = @"Example06";
    self.view.backgroundColor = UIColor.brownColor;
    
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

#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark ------------------------------------------------- event -------------------------------------------------
-(void)handleTapRightButton
{
    
}
#pragma mark ------------------------------------------------- private -------------------------------------------------

#pragma mark ------------------------------------------------- getters -------------------------------------------------

@end
