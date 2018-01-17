//
//  UIView+Tools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/2/23.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Tools)


- (UIImageView *)addImageViewWithImage:(UIImage *)image frame:(CGRect)frame;
- (UIView *)addViewLineWithFrame:(CGRect )frame;
- (UIView *)addHorizontalViewLineAtY:(CGFloat)y;
- (UIView *)addVerticalViewLineAtX:(CGFloat)x;

- (UILabel *)addLabelWithText:(NSString *)text frame:(CGRect )frame;

- (UILabel *)addLabelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment frame:(CGRect)frame ;

- (UILabel *)addSizeFitLabelWithText:(NSString *)text frame:(CGRect )frame;

- (UILabel *)addSizeFitLabelWithText:(NSString *)text
                            fontSize:(CGFloat)fontSize
                        numberOfLine:(NSInteger)numberOfLine
                               frame:(CGRect)frame;


- (UILabel *)addLabelWithAttributedText:(NSAttributedString *)attributedText fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment frame:(CGRect)frame;

- (UILabel *)addSizeFitLabelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize numberOfLine:(NSInteger)numberOfLine frame:(CGRect)frame;

- (UILabel *)addSizeFitLabelWithAttributedText:(NSAttributedString *)attributedText
                                      fontSize:(CGFloat)fontSize
                                  numberOfLine:(NSInteger)numberOfLine
                                         frame:(CGRect)frame;


//- (UILabel *)addDescribeLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame;

- (UIView *)addActivityLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame;
- (void)showProgressHUDWithImageName:(NSString *)imageName text:(NSString *)text;

- (UIView *)addViewWithColor:(UIColor *)color frame:(CGRect)frame;
- (void)suitIPhoneXBottomY;
- (void)suitIPhoneXBottomH;



- (UIButton *)addButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor fontSize:(CGFloat)fontSize cornerRadius:(CGFloat)cornerRadius hasLine:(BOOL)hasLine frame:(CGRect)frame;
@end
