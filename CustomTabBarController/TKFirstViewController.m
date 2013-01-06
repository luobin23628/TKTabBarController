//
//  TKFirstViewController.m
//  CustomTabBarController
//
//  Created by LuoBin on 12-12-26.
//  Copyright (c) 2012年 LuoBin. All rights reserved.
//

#import "TKFirstViewController.h"

@interface TKFirstViewController ()

@end

@implementation TKFirstViewController

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
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
