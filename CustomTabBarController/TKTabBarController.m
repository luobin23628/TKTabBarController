//
//  TKTabBarController.m
//  CustomTabBarController
//
//  Created by LuoBin on 12-12-26.
//  Copyright (c) 2012年 LuoBin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import "TKTabBarController.h"

static NSInteger SelectionIndicatorViewTag = NSIntegerMax;

static char selectionIndicatorImageInsetKey;

@implementation UITabBar (Custom)

- (void)setTkBackgroundImage:(UIImage *)tkBackgroundImage {
    if ([self respondsToSelector:@selector(setBackgroundImage:)]) {
        [self setBackgroundImage:tkBackgroundImage];
    } else {
        self.layer.contents = (id)tkBackgroundImage.CGImage;
    }
}

- (UIImage *)tkBackgroundImage {
    if ([self respondsToSelector:@selector(backgroundImage)]) {
        return self.backgroundImage;
    } else {
        id contents = self.layer.contents;
        if ([contents isKindOfClass:[UIImage class]]) {
            return contents;
        }
        return nil;
    }
}

- (UIImage *) tkSelectionIndicatorImage {
    UIImageView *selectionIndicatorView = [self selectionIndicatorView];
    return selectionIndicatorView.image;
}

- (void) setTkSelectionIndicatorImage:(UIImage *)selectionIndicatorImage {
    UIImageView * selectionIndicatorView = self.selectionIndicatorView;
    if (selectionIndicatorImage != selectionIndicatorView.image) {
        if (selectionIndicatorImage == nil) {
            [selectionIndicatorView removeFromSuperview];
            selectionIndicatorView = nil;
        } else {
            if (selectionIndicatorView == nil) {
                selectionIndicatorView = [[UIImageView alloc] init];
                selectionIndicatorView.tag = SelectionIndicatorViewTag;
                [self addSubview:selectionIndicatorView];
                [selectionIndicatorView release];
            }
            selectionIndicatorView.image = selectionIndicatorImage;
        }
        
        [self updateSelectionIndicatorView];
    }
}

- (UIImageView *)selectionIndicatorView {
    for (UIView *subview in self.subviews) {
        if (subview.tag == SelectionIndicatorViewTag && [subview isKindOfClass:[UIImageView class]]) {
            return (UIImageView *)subview;
        }
    }
    return nil;
}

- (void)setSelectionIndicatorImageInset:(UIEdgeInsets)selectionIndicatorImageInset {
    UIEdgeInsets oldSelectionIndicatorImageInset = self.selectionIndicatorImageInset;
    if (!UIEdgeInsetsEqualToEdgeInsets(oldSelectionIndicatorImageInset, selectionIndicatorImageInset)) {
        NSValue *value = [NSValue valueWithUIEdgeInsets:selectionIndicatorImageInset];
        objc_setAssociatedObject(self, &selectionIndicatorImageInsetKey, value, OBJC_ASSOCIATION_RETAIN);
        [self updateSelectionIndicatorView];
    }
}

- (UIEdgeInsets)selectionIndicatorImageInset {
    id v = objc_getAssociatedObject(self, &selectionIndicatorImageInsetKey);
    if (v == nil || v == [NSNull null] || ![v isKindOfClass:[NSValue class]]) {
        return UIEdgeInsetsZero;
    } else {
        return [v UIEdgeInsetsValue];
    }
}

- (void) updateSelectionIndicatorView {
    for (UIView *subview in self.subviews) {
        if ([subview isKindOfClass:[UIControl class]]) {
            for (UIView *subsubview in [subview subviews]) {
                if ([NSStringFromClass([subsubview class]) isEqualToString:@"UITabBarSelectionIndicatorView"]) {
                    subsubview.hidden = YES;
                }
            }
        }
    }
    
    UIImageView *selectionIndicatorView = self.selectionIndicatorView;
    if (selectionIndicatorView) {
        NSInteger width = CGRectGetWidth(self.bounds) / self.items.count;
        NSInteger x = ([self.items indexOfObject:self.selectedItem]) * width;
        selectionIndicatorView.frame = UIEdgeInsetsInsetRect(CGRectMake(x, 0, width, CGRectGetHeight(self.bounds)), self.selectionIndicatorImageInset);
    }
}

@end

@interface TKTabBarController ()

@end

@implementation TKTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setSelectedViewController:(UIViewController *)selectedViewController {
    [super setSelectedViewController:selectedViewController];
    [self.tabBar updateSelectionIndicatorView];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    [self.tabBar updateSelectionIndicatorView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self.tabBar updateSelectionIndicatorView];
}

@end
