//
//  UIViewController+MyNotice.h
//  cycj-shop
//
//  Created by 李杰 on 2017/6/14.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSObject (MyNotice)


//刚登陆
- (void)noticeJustHadToken;

//密码失效
- (void)noticeTokenExpired;

//强制更新
- (void)noticeForceUpdate;

- (void)noticeTheShoppingCartToUpdate;

- (void)noticeOrderStateNumAndWalletUpdate;

- (void)noticeNoNetwork;

- (void)noticeFinishRefreshUserInfo;

- (void)noticeFinishLoadUserHeadImage;

- (void)noticeToOpenBackgroundSetting;
#pragma mark - 打开其它页面的通知--需要传参
////打开普通网页
//- (void)postHtmlUrl:(NSString *)htmlUrl;
////打开活动页
//- (void)postSpecialId:(NSString *)postSpecialId;
////打开店铺
//- (void)postShopId:(NSString *)shopId;
////打开商品
//- (void)postGoodsId:(NSString *)goodsId;
////打开我的订单详情
//- (void)postOrderSn:(NSString *)orderSn;
////打开退货订单详情
//- (void)postRefundOrderSn:(NSString *)refundOrderSn;
//统一入口
- (void)postAction:(NSString *)action parameter:(id)parameter afterSecond:(CGFloat)second;

@end
