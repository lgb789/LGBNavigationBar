//
//  LGBViewController.m
//  LGBNavigationBar
//
//  Created by lgb789 on 05/12/2016.
//  Copyright (c) 2016 lgb789. All rights reserved.
//

#import "LGBViewController.h"
#import "ViewController.h"

@interface LGBViewController ()

@end

@implementation LGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleRightButton)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleRightButton
{
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}

@end
