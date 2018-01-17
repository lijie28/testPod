//
//  UIView+Tools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/2/23.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UIView+Tools.h"
#import "MBProgressHUD.h"
#import <QuartzCore/QuartzCore.h>


@implementation UIView (Tools)
- (UIView *)addViewLineWithFrame:(CGRect )frame
{
    UIView *viewLine = [[UIView alloc]initWithFrame:frame];
    viewLine.backgroundColor = kLineColor;
    [self addSubview:viewLine];
    return viewLine;
}

- (UIView *)addHorizontalViewLineAtY:(CGFloat)y
{
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, y, self.frame.size.width, 1)];
    viewLine.backgroundColor = kLineColor;
    [self addSubview:viewLine];
    return viewLine;
}

- (UIView *)addVerticalViewLineAtX:(CGFloat)x
{
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(x, 0, 1, self.frame.size.height)];
    viewLine.backgroundColor = kLineColor;
    [self addSubview:viewLine];
    return viewLine;
}


//label
- (UILabel *)addLabelWithText:(NSString *)text frame:(CGRect )frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.textColor = kTitle2Color;
    lab.font = k13Font;
    lab.text = text ;
    [self addSubview:lab];
    return lab;
}

- (UILabel *)addLabelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment frame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.text = text ;
//    lab.numberOfLines = numberOfLine;
    lab.textColor = textColor;
    lab.font = [UIFont systemFontOfSize:fontSize];
    
    lab.textAlignment = alignment;
    [self addSubview:lab];
//    [lab sizeToFit];
    return lab;
}



- (UIView *)addViewWithColor:(UIColor *)color frame:(CGRect)frame
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    [self addSubview:view];
    return view;
}

- (UILabel *)addSizeFitLabelWithText:(NSString *)text frame:(CGRect )frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.text = text ;
    lab.numberOfLines = 1;
    lab.textColor = kTitle2Color;
    lab.font = [UIFont systemFontOfSize:13];
//    lab.backgroundColor = kYellowColor;
    [self addSubview:lab];
    [lab sizeToFit];
    return lab;
}


- (UILabel *)addLabelWithAttributedText:(NSAttributedString *)attributedText fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment frame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
//    lab.numberOfLines = numberOfLine;
    lab.textColor = kTitle2Color;
    lab.font = [UIFont systemFontOfSize:fontSize];
    lab.textAlignment = alignment;
    lab.attributedText = attributedText ;
    [self addSubview:lab];
//    [lab sizeToFit];
    return lab;
}

- (UILabel *)addSizeFitLabelWithAttributedText:(NSAttributedString *)attributedText fontSize:(CGFloat)fontSize numberOfLine:(NSInteger)numberOfLine frame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.numberOfLines = numberOfLine;
    lab.textColor = kTitle2Color;
    lab.font = [UIFont systemFontOfSize:fontSize];
    lab.lineBreakMode = NSLineBreakByCharWrapping;
//    lab.backgroundColor = kYellowColor;
    lab.attributedText = attributedText ;
    [self addSubview:lab];
    [lab sizeToFit];
    return lab;
}

- (UILabel *)addSizeFitLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize numberOfLine:(NSInteger)numberOfLine frame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.text = text ;
    lab.numberOfLines = numberOfLine;
    lab.lineBreakMode = NSLineBreakByCharWrapping;
    lab.textColor = kTitle2Color;
    lab.font = [UIFont systemFontOfSize:fontSize];
//    lab.backgroundColor = kYellowColor;
    [self addSubview:lab];
    [lab sizeToFit];
    return lab;
}

- (UILabel *)addSizeFitLabelWithText:(NSString *)text textColor:(UIColor *)textColor fontSize:(CGFloat)fontSize numberOfLine:(NSInteger)numberOfLine frame:(CGRect)frame
{
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.text = text ;
    lab.numberOfLines = numberOfLine;
    lab.lineBreakMode = NSLineBreakByCharWrapping;
    lab.textColor = textColor;
    lab.font = [UIFont systemFontOfSize:fontSize];
    //    lab.backgroundColor = kYellowColor;
    [self addSubview:lab];
    [lab sizeToFit];
    return lab;
}

- (UIImageView *)addImageViewWithImage:(UIImage *)image frame:(CGRect)frame
{
    UIImageView *img = [[UIImageView alloc]init];
    img.frame = frame;
    img.image = image;
    [self addSubview:img];
    return img;
}



//是view进到这里
- (void)showProgressHUDWithImageName:(NSString *)imageName text:(NSString *)text
{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.userInteractionEnabled = NO;
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    if (imageName) {
        
        /*
        UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
         */
        
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        
        hud.square = YES;
        
    }else{
        hud.square = NO;
    }
    
    hud.label.text = NSLocalizedString(text, @"HUD done title");
    hud.label.textColor = [UIColor whiteColor];
    hud.label.numberOfLines = 0;
    hud.label.lineBreakMode = NSLineBreakByCharWrapping;
    hud.label.font = [UIFont systemFontOfSize:13.0f];
    hud.color = kColor(0, 0, 0, 0.7);
//    hud.color = kBlackColor;
//    hud.alpha = 0.7;
    
    [hud hideAnimated:YES afterDelay:2.f];
}

//- (UILabel *)describeLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame
//{
//    CGFloat rate = fontSize/15;
//        self.frame = frame;
//        self.text = text ;
//        self.textColor = color;
//        self.font = [UIFont systemFontOfSize:fontSize];
//        self.textAlignment = NSTextAlignmentCenter;
//        [self sizeToFit];
//        self.frame = CGRectMake(lab.frame.origin.x, lab.frame.origin.y, lab.frame.size.width +5, lab.frame.size.height +5);
//        
//        [[self layer] setCornerRadius:3];
//        [[self layer] setBorderWidth:1*rate];
//        [[self layer] setBorderColor:color.CGColor];
//        
//        return self;
////    }
//}

- (void)suitIPhoneXBottomH
{
    if (!iPhoneX) return;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y , self.frame.size.width, self.frame.size.height-24 -34);
}

- (void)suitIPhoneXBottomY
{
    if (!iPhoneX) return;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y -24 -34, self.frame.size.width, self.frame.size.height);
}


- (UIView *)addActivityLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame
{
//    CGFloat rate = fontSize/15;
    
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = frame;
    lab.text = text ;
    lab.textColor = kWhiteColor;
//    lab.backgroundColor = kYellowColor;
    lab.font = [UIFont systemFontOfSize:fontSize];
    lab.textAlignment = NSTextAlignmentCenter;
    [lab sizeToFit];
    lab.frame = CGRectMake(lab.frame.origin.x, lab.frame.origin.y, lab.frame.size.width +3, lab.frame.size.height +3);
    
//    [[lab layer] setCornerRadius:3];
//    [[lab layer] setBorderWidth:1*rate];
//    [[lab layer] setBorderColor:kBlackColor.CGColor];

    
    UIView *view = [[UIView alloc]initWithFrame:lab.frame];
    view.backgroundColor = color;
    view.layer.cornerRadius = 3;
    [self addSubview:view];
    
    lab.frame = CGRectMake(0, 0, view.frame.size.width , view.frame.size.height);
    
    [view addSubview:lab];
    return view;
}



- (UIButton *)addButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor fontSize:(CGFloat)fontSize cornerRadius:(CGFloat)cornerRadius hasLine:(BOOL)hasLine frame:(CGRect)frame
{
    
    if (fontSize == 0) fontSize = 13.0;
    if (cornerRadius == 0) cornerRadius = 8.0;
    if (title == nil) title = @"";
    if (titleColor == nil) titleColor = kTitle1Color;
    if (backgroundColor == nil) backgroundColor = kWhiteColor;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.backgroundColor = backgroundColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    
    
    [[btn layer] setCornerRadius:cornerRadius];
    
    if (hasLine) {
        [[btn layer] setBorderWidth:1];
        [[btn layer] setBorderColor:titleColor.CGColor];
    }
    
    [self addSubview:btn];
    
    
    
    return btn;
}

@end
