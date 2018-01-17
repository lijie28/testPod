//
//  UIView+NumberNotice.m
//  cycj-shop
//
//  Created by 李杰 on 17/2/4.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UIView+NumberNotice.h"

@implementation UIView (NumberNotice)

- (void)getTheViewSize
{
    NSLog(@"width:%f,height:%f",self.frame.size.width,self.frame.size.height);
}

- (void)setupTheCustomNotice:(NSInteger)countNum
{
    
    NSString *strNum =  [NSString stringWithFormat:@"%ld",(long)countNum];
    
    CGSize size =[strNum sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    
    UILabel *labTest = [[UILabel alloc]init];
    labTest.font = [UIFont systemFontOfSize:9];
    labTest.text = strNum;
    labTest.textAlignment = NSTextAlignmentCenter;
    labTest.layer.cornerRadius = 7;
    
    
    labTest.backgroundColor = [UIColor whiteColor];
    labTest.textColor = [UIColor redColor];
    
    //设置边框的宽度为20
    
    labTest.layer.borderWidth=1;
    
    labTest.layer.borderColor=[UIColor redColor].CGColor;
    
    labTest.clipsToBounds = YES;
    
    if (size.height>size.width) {
        
        labTest.frame = CGRectMake(self.frame.size.width - (size.height+3)/2, 0, size.height+3, size.height+3);
        
    }else{
        
        labTest.frame = CGRectMake(self.frame.size.width - (size.width+3)/2, 0, size.width+3, size.height+3);
    }
    
    [self addSubview:labTest];
}
@end
