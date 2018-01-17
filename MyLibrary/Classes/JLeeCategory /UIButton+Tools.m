//
//  UIButton+Tools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/6/1.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UIButton+Tools.h"

@implementation UIButton (Tools)

- (UIButton *)setTitle:(NSString *)title frame:(CGRect)frame image:(NSString *)imageName selectImage:(NSString *)selectImageName superView:(UIView *)superView action:(SEL)action tag:(NSInteger)tag
{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.frame = frame;
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:kTitle2Color forState:UIControlStateNormal];
    [self setTitleColor:kBaseOrangeColor forState:UIControlStateHighlighted];
    [self setTitleColor:kBaseOrangeColor forState:UIControlStateSelected];
    self.titleLabel.font = k15Font;
    
    //    btn.backgroundColor = kYellowColor;
    [self addTarget:superView action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:self];
    self.tag = tag;
    
    if (![imageName isEqualToString:@""]) {
        [self setImage:IMAGE(imageName) forState:UIControlStateNormal];
        //        NSString *imageNameSelected = [NSString stringWithFormat:@"%@_select",imageName];
        if (IMAGE(selectImageName)) {
            [self setImage:IMAGE(selectImageName) forState:UIControlStateHighlighted];
            [self setImage:IMAGE(selectImageName) forState:UIControlStateSelected];
        }
        UIImage *image = IMAGE(imageName);
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -image.size.width, 0, image.size.width)];
        [self setImageEdgeInsets:UIEdgeInsetsMake(0, frame.size.width - image.size.width -kWidth(10), 0, 0)];
        
    }
    
    //保证所有touch事件button的highlighted属性为NO,即可去除高亮效果
    [self addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
    return self;
}


- (void)preventFlicker:(UIButton *)button {
    button.highlighted = NO;
}

@end
