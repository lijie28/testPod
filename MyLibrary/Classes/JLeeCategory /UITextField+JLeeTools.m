//
//  UITextField+JLeeTools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/6/16.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UITextField+JLeeTools.h"

@implementation UITextField (JLeeTools)


- (void)changeWordSpace:(CGFloat)space
{
    
    CGRect rect = self.frame;
    NSTextAlignment ali = self.textAlignment;
    
    self.text = @"";
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    
    self.frame = rect;
    self.textAlignment = ali;
}

@end
