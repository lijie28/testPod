//
//  UIViewController+UMShare.m
//  cycj-shop
//
//  Created by 李杰 on 2017/5/8.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UIViewController+UMShare.h"
#import <UShareUI/UShareUI.h>

@implementation UIViewController (UMShare)

- (void)shareTitle:(NSString *)title description:(NSString *)description thumImage:(id)thumImage webpageUrl:(NSString *)webpageUrl
{
    
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),@(UMSocialPlatformType_WechatTimeLine)]];
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        [self shareWebPageToPlatformType:platformType title:title description:description thumImage:thumImage webpageUrl:webpageUrl] ;
    }];
}




- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title description:(NSString *)description thumImage:(id )thumImage webpageUrl:(NSString *)webpageUrl
{

    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:description thumImage:thumImage];
    
    //设置网页地址
    shareObject.webpageUrl = webpageUrl;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        //        [self alertWithError:error];
    }];
}

@end
