//
//  LGBNavigationBar.h
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/23.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGBNavigationBar : UINavigationBar <UINavigationBarDelegate>
@property (nonatomic, strong) UINavigationItem *navigationItem;

-(instancetype)initWithViewController:(UIViewController *)viewController;

-(void)setBackButtonItem:(UIBarButtonItem *)backButtonItem UI_APPEARANCE_SELECTOR;
@end
