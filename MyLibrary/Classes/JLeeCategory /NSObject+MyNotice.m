//
//  UIViewController+MyNotice.m
//  cycj-shop
//
//  Created by 李杰 on 2017/6/14.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "NSObject+MyNotice.h"

@implementation NSObject (MyNotice)



//刚登陆
- (void)noticeJustHadToken
{
    //创建一个消息对象
    NSNotification *notice = [NSNotification notificationWithName:@"JustHadToken" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}


- (void)noticeTokenExpired
{
    //创建一个消息对象
    NSNotification *notice = [NSNotification notificationWithName:@"TokenExpired" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
}


- (void)noticeForceUpdate
{
    //创建一个消息对象
    NSNotification *notice = [NSNotification notificationWithName:@"ForceUpdate" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}




- (void)noticeNoNetwork
{
    //创建一个消息对象
    NSNotification *notice = [NSNotification notificationWithName:@"NoNetwork" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}


- (void)noticeTheShoppingCartToUpdate
{
    //创建一个消息对象
    NSNotification *notice = [NSNotification notificationWithName:@"shoppingCartUpdate" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}

- (void)noticeOrderStateNumAndWalletUpdate
{
    //创建一个消息对象
    NSNotification *notice = [NSNotification notificationWithName:@"OrderStateNumAndWalletUpdate" object:nil userInfo:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}


- (void)noticeFinishRefreshUserInfo
{
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"UserInfo" object:nil];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
    
}

- (void)noticeFinishLoadUserHeadImage
{
    
    //创建一个消息对象
    NSNotification * notice = [NSNotification notificationWithName:@"UserInfo" object:@"imgHead"];
    //发送消息
    [[NSNotificationCenter defaultCenter]postNotification:notice];
}


//- (void)noticeToOpenBackgroundSetting
//{
//    //创建一个消息对象
//    NSNotification *notice = [NSNotification notificationWithName:@"openBackgroundSetting" object:nil userInfo:nil];
//    //发送消息
//    [[NSNotificationCenter defaultCenter]postNotification:notice];
//
//}

#pragma mark - 打开其它页面的通知--需要传参
- (void)postAction:(NSString *)action parameter:(id)parameter afterSecond:(CGFloat)second
{
//    if (second == nil) second = 0;
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, second*NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSDictionary *dic = nil;
        if (parameter != nil) dic = @{@"parameter":parameter};
        
        //创建一个消息对象
        NSNotification *notice = [NSNotification notificationWithName:action object:nil userInfo:dic];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:notice];
    });
}

//- (void)postHtmlUrl:(NSString *)htmlUrl
//{
//    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSDictionary *dic = @{@"parameter":htmlUrl};
//        //创建一个消息对象
//        NSNotification *notice = [NSNotification notificationWithName:@"openHtml" object:nil userInfo:dic];
//        //发送消息
//        [[NSNotificationCenter defaultCenter]postNotification:notice];
//    });
//}
//
//- (void)postSpecialId:(NSString *)postSpecialId
//{
//    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSDictionary *dic = @{@"parameter":postSpecialId};
//        //创建一个消息对象
//        NSNotification *notice = [NSNotification notificationWithName:@"openActivityH5" object:nil userInfo:dic];
//        //发送消息
//        [[NSNotificationCenter defaultCenter]postNotification:notice];
//    });
//}
//
//
//- (void)postShopId:(NSString *)shopId
//{
//    
//    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSDictionary *dic = @{@"parameter":shopId};
//        //创建一个消息对象
//        NSNotification *notice = [NSNotification notificationWithName:@"openShopDetail" object:nil userInfo:dic];
//        //发送消息
//        [[NSNotificationCenter defaultCenter]postNotification:notice];
//    });
//}
//
//
//- (void)postGoodsId:(NSString *)goodsId
//{
//    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSDictionary *dic = @{@"parameter":goodsId};
//        //创建一个消息对象
//        NSNotification *notice = [NSNotification notificationWithName:@"openGoodsDetail" object:nil userInfo:dic];
//        //发送消息
//        [[NSNotificationCenter defaultCenter]postNotification:notice];
//    });
//    
//}
//
//
//- (void)postOrderSn:(NSString *)orderSn
//{
//    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSDictionary *dic = @{@"parameter":orderSn};
//        //创建一个消息对象
//        NSNotification *notice = [NSNotification notificationWithName:@"openOrderDetail" object:nil userInfo:dic];
//        //发送消息
//        [[NSNotificationCenter defaultCenter]postNotification:notice];
//    });
//    
//}
//
//
//- (void)postRefundOrderSn:(NSString *)refundOrderSn
//{
//    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
//    dispatch_after(time, dispatch_get_main_queue(), ^{
//        NSDictionary *dic = @{@"parameter":refundOrderSn};
//        //创建一个消息对象
//        NSNotification *notice = [NSNotification notificationWithName:@"openRefundOrderDetail" object:nil userInfo:dic];
//        //发送消息
//        [[NSNotificationCenter defaultCenter]postNotification:notice];
//    });
//    
//}


@end
