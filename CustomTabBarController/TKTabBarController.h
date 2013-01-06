//
//  TKTabBarController.h
//  CustomTabBarController
//
//  Created by LuoBin on 12-12-26.
//  Copyright (c) 2012年 LuoBin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Custom)

@property(nonatomic,retain) UIImage *tkBackgroundImage;
@property(nonatomic,assign) UIEdgeInsets selectionIndicatorImageInset;
@property(nonatomic,retain) UIImage *tkSelectionIndicatorImage;

@end

@interface TKTabBarController : UITabBarController

@end

