//
//  UIImage+UIImageExtras.h
//  cycj-shop
//
//  Created by 李杰 on 2017/2/9.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageExtras)

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

//将图片处理成圆角
- (UIImage *)dealImageIntoCircleImage;


@end
