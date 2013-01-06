TKTabBarController
==================

可以自定义普通和按下图片，选中效果的自定义TabbarController

使用方法：
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    TKFirstViewController *firstViewController = [[TKFirstViewController alloc] init];
    firstViewController.tabBarItem = [[[TKTabBarItem alloc] initWithTitle:@"First" unselectedImage:[UIImage imageNamed:@"bottom_tabbar1_n.png"] selectedImage:[UIImage imageNamed:@"bottom_tabbar1_p.png"] tag:0] autorelease];
    [viewControllers addObject:firstViewController];
    [firstViewController release];
    
    TKSecondViewController *secondViewController = [[TKSecondViewController alloc] init];
    secondViewController.tabBarItem = [[[TKTabBarItem alloc] initWithTitle:@"Second" unselectedImage:[UIImage imageNamed:@"bottom_tabbar2_n.png"] selectedImage:[UIImage imageNamed:@"bottom_tabbar2_p.png"] tag:1] autorelease];
    [viewControllers addObject:secondViewController];
    [secondViewController release];
    
    TKThirdViewController *thirdViewController = [[TKThirdViewController alloc] init];
    thirdViewController.tabBarItem = [[[TKTabBarItem alloc] initWithTitle:@"Third" unselectedImage:[UIImage imageNamed:@"bottom_tabbar3_n.png"] selectedImage:[UIImage imageNamed:@"bottom_tabbar3_p.png"] tag:2] autorelease];
    [viewControllers addObject:thirdViewController];
    [thirdViewController release];
    
    TKTabBarController *tabBarController = [[TKTabBarController alloc] init];
    tabBarController.tabBar.tkBackgroundImage = [UIImage imageNamed:@"tabbar-bg.png"];
    tabBarController.tabBar.tkSelectionIndicatorImage = [[UIImage imageNamed:@"tabbar-button-bg-selected.png"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    tabBarController.viewControllers = viewControllers;
