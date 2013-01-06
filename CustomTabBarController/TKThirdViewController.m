//
//  TKThirdViewController.m
//  CustomTabBarController
//
//  Created by LuoBin on 12-12-26.
//  Copyright (c) 2012年 LuoBin. All rights reserved.
//

#import "TKThirdViewController.h"
#import "TKTabBarController.h"

@interface TKThirdViewController ()

@end

@implementation TKThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(130, 100, 60, 30);
    [btn setTitle:@"test" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(removeIndicatorView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)removeIndicatorView {
    self.tabBarController.tabBar.tkSelectionIndicatorImage = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
