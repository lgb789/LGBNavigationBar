//
//  ViewController.m
//  CustomNavigationBar
//
//  Created by lgb789 on 16/5/12.
//  Copyright © 2016年 com.lgb. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+lgb_navigationBar.h"
#import "UIImage+LGImage.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat offsetY;
@end

@implementation ViewController

-(UIRectEdge)edgesForExtendedLayout
{
    return UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.offsetY = -1;
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
//    UIImage *img = [UIImage imageNamed:@"上条"];
    UIImage *image = [UIImage imageNamed:@"top_bg"];
//
//    [self.navigationController.navigationBar lgb_setBackgroundImage:img];
   
    [self.navigationController.navigationBar lgb_setBackgroundImage:image extended:NO];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar lgb_reset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
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
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [NSString stringWithFormat:@"cell->%ld", indexPath.row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (self.offsetY == -1) {
        self.offsetY = scrollView.contentOffset.y;
        return;
    }
    
    CGFloat offset = scrollView.contentOffset.y - self.offsetY;
    
    CGFloat alpha = MIN(1, offset / CGRectGetHeight(self.navigationController.navigationBar.bounds));
    
    NSLog(@"offset y-->%f,%f,%f", scrollView.contentOffset.y, alpha, self.offsetY);
    
    [self.navigationController.navigationBar lgb_setBackgroundAlpha:alpha];
    
    
}

-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
