//
//  UIViewController+UMShare.h
//  cycj-shop
//
//  Created by 李杰 on 2017/5/8.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UMShare)

- (void)shareTitle:(NSString *)title description:(NSString *)description thumImage:(id)thumImage webpageUrl:(NSString *)webpageUrl;

@end
