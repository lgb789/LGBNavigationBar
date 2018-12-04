//
//  LGBTransition.h
//  LGBNaviBar
//
//  Created by guoquan li on 2018/11/24.
//Copyright © 2018 guoquan li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGBTransition : NSObject

-(instancetype)initWithNavigationController:(UINavigationController *)navigationController;

-(void)resetTransition;

-(void)setPopGestureEnable:(BOOL)enable;
@end
