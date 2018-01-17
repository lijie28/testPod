//
//  UIButton+Tools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/6/1.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Tools)
- (UIButton *)setTitle:(NSString *)title frame:(CGRect)frame image:(NSString *)imageName selectImage:(NSString *)selectImageName superView:(UIView *)superView action:(SEL)action tag:(NSInteger)tag;

@end
