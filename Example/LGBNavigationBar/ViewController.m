//
//  ViewController.m
//  LGBNavigationBar
//
//  Created by guoquan li on 2018/11/25.
//Copyright © 2018 lgb789. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation ViewController

#pragma mark ------------------------------------------------- lifecycle ------------------------------------------------

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"gesture:%@", self.navigationController.view.gestureRecognizers);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

#pragma mark ------------------------------------------------- public -------------------------------------------------

#pragma mark ------------------------------------------------- private -------------------------------------------------
-(void)setupViews
{
    UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
    
    self.lgb_naviBar.navigationItem.title = @"Example";
    
    NSLog(@"navi bar frame:%@", NSStringFromCGRect(self.navigationController.navigationBar.frame));
    self.view.backgroundColor = UIColor.whiteColor;
    self.tableView.frame = CGRectMake(0, CGRectGetHeight(self.navigationController.navigationBar.frame) + 20, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.navigationController.navigationBar.frame) - 20);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view insertSubview:self.tableView belowSubview:self.lgb_naviBar];
    
    self.data = @[
                  @"Example01",
                  @"Example02",
                  @"Example03",
                  @"Example04",
                  ];
}
#pragma mark ------------------------------------------------- delegate -------------------------------------------------

#pragma mark - UITableViewDelegate, UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class class = NSClassFromString(self.data[indexPath.row]);
    UIViewController *c = [class new];
    [self.navigationController pushViewController:c animated:YES];
}

#pragma mark ------------------------------------------------- event -------------------------------------------------

#pragma mark ------------------------------------------------- getters -------------------------------------------------
-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [UITableView new];
    }
    return _tableView;
}
@end
