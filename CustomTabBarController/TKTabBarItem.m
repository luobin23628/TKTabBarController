

//
//  TKTabBarItem.m
//  CustomTabBarController
//
//  Created by LuoBin on 12-12-26.
//  Copyright (c) 2012年 LuoBin. All rights reserved.
//

#import "TKTabBarItem.h"

@interface TKTabBarItem()

@property (nonatomic, retain) UIImage *customSelectedImage;
@property (nonatomic, retain) UIImage *customUnselectedImage;

@end

@implementation TKTabBarItem

@synthesize customSelectedImage;
@synthesize customUnselectedImage;

#pragma mark -
#pragma mark Initialization and destruction

- (id)initWithTitle:(NSString *)title unselectedImage:(UIImage *)anUnselectedImage selectedImage:(UIImage *)aSelectedImage tag:(NSInteger)tag {
	self.customSelectedImage = aSelectedImage;
	return [self initWithTitle:title image:anUnselectedImage tag:tag];
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image tag:(NSInteger)tag {
	if (self = [super initWithTitle:title image:image tag:tag]) {
		self.customUnselectedImage = image;
	}
	return self;
}

- (void)dealloc {
    [customSelectedImage release];
    [customUnselectedImage release];   
    [super dealloc];
}

#pragma mark -
#pragma mark Overwritten methods

-(UIImage *)selectedImage {
    return self.customSelectedImage;
}

-(UIImage *)unselectedImage {
    return self.customUnselectedImage;
}

@end
