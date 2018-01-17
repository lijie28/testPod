//
//  UILabel+Tools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/6/15.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Tools)

/** 行间距 */
@property (nonatomic, assign) CGFloat lineSpace;

- (void)changeLineSpace:(CGFloat)space;


- (void)sizeFitFrameWidth;

- (NSUInteger )getActualLines;

- (UILabel *)describeLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame;
@end
