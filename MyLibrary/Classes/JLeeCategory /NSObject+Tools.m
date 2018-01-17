//
//  NSObject+Tools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/2/8.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "NSObject+Tools.h"
#import <sys/utsname.h>

@implementation NSObject (Tools)

//
//#pragma mark - c的圆角算法--来自大神github:https://github.com/hehe520/ClipCorner
//
//// 判断点 (px, py) 在不在圆心 (cx, cy) 半径 r 的圆内
//static inline bool isCircle(float cx, float cy, float r, float px, float py) {
//    if ((px-cx) * (px-cx) + (py-cy) * (py-cy) > r * r) {
//        return false;
//    }
//    return true;
//}
//
//// 裁剪圆角
//void cornerImage(UInt32 *const img, int w, int h, CGFloat cornerRadius) {
//    CGFloat c = cornerRadius;
//    CGFloat min = w > h ? h : w;
//    
//    if (c < 0) { c = 0; }
//    if (c > min * 0.5) { c = min * 0.5; }
//    
//    // 左上 y:[0, c), x:[x, c-y)
//    for (int y=0; y<c; y++) {
//        for (int x=0; x<c-y; x++) {
//            UInt32 *p = img + y * w + x;    // p 32位指针，RGBA排列，各8位
//            if (isCircle(c, c, c, x, y) == false) {
//                *p = 0;
//            }
//        }
//    }
//    // 右上 y:[0, c), x:[w-c+y, w)
//    int tmp = w-c;
//    for (int y=0; y<c; y++) {
//        for (int x=tmp+y; x<w; x++) {
//            UInt32 *p = img + y * w + x;
//            if (isCircle(w-c, c, c, x, y) == false) {
//                *p = 0;
//            }
//        }
//    }
//    // 左下 y:[h-c, h), x:[0, y-h+c)
//    tmp = h-c;
//    for (int y=h-c; y<h; y++) {
//        for (int x=0; x<y-tmp; x++) {
//            UInt32 *p = img + y * w + x;
//            if (isCircle(c, h-c, c, x, y) == false) {
//                *p = 0;
//            }
//        }
//    }
//    // 右下 y~[h-c, h), x~[w-c+h-y, w)
//    tmp = w-c+h;
//    for (int y=h-c; y<h; y++) {
//        for (int x=tmp-y; x<w; x++) {
//            UInt32 *p = img + y * w + x;
//            if (isCircle(w-c, h-c, c, x, y) == false) {
//                *p = 0;
//            }
//        }
//    }
//}
//
//void releaseData(void *info, const void *data, size_t size) {
//    free((void *)data);
//}
//

#pragma mark - 用到的方法

//将图片转成二进制文件 并获取对应名字
- (NSArray<UIImage *> *)getImages:(NSArray<UIImage *> *)images Detail:(void(^)(NSArray *arrImgName,NSArray *arrImgData))block
{
    
    if (![images isKindOfClass:[NSArray<UIImage *> class]]) return nil;
    
    NSArray *arrImages = [(NSArray<UIImage *> *)images copy];
    
    NSMutableArray *newArrName = [NSMutableArray array];
    NSMutableArray *newArrData = [NSMutableArray array];
    NSMutableArray *newArrImg = [NSMutableArray array];
    
    for (NSInteger i = 0 ; i< arrImages.count ; i++) {
        
        UIImage *image = arrImages[i];
        //将图片转成data
        
//        NSData *data = UIImagePNGRepresentation(image);
        NSData *data = UIImageJPEGRepresentation(image,1);
        
        //将data转成图片,加入到新数组
        UIImage *imageReturn = [UIImage imageWithData: data];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        //使用日期生成图片名称
        formatter.dateFormat = @"yyyyMMddHHmmssSSSS";
        
        int a = (arc4random() % 8999) + 1000;
        int b = (arc4random() % 8999) + 1000;
        
        NSString *fileName = [NSString stringWithFormat:@"%d-%@-%d.jpg",a,[formatter stringFromDate:[NSDate date]],b];
        
        [newArrImg addObject:imageReturn];
        [newArrData addObject:data];
        [newArrName addObject:fileName];
        
    }
    
    if (block) block(newArrName,newArrData);
    
    return newArrImg;
    
}

- (UIImage *)createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (NSAttributedString *)dealWithPrice:(NSString *)price size:(CGFloat)size
{
    
    if ([price hasValue]) {
        NSString *goodsPrice = [@"¥ " stringByAppendingString:price];
        NSMutableAttributedString *attGoodsPrice = [[NSMutableAttributedString alloc]initWithString:goodsPrice ];
        [attGoodsPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:NSMakeRange(0, 1 )];
        
        return attGoodsPrice;
    }else{
        return nil;
    }
}



- (NSString *)timeWithTimeStamp:(NSString *)timeStamp format:(NSString *)format
{
    
    if (![format hasValue]) format = @"yyyy-MM-dd HH:mm:ss";
        // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeStamp doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}




- (NSString *)getNowTimeStamp
{
    
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
}

- (id)getJson:(NSString *)jsonName
{
    NSString * jsonPath = [[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"];
    NSData * jsonData = [[NSData alloc]initWithContentsOfFile:jsonPath];
    id jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    return jsonDic;
}


- (NSString *)iphoneType {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if ([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if ([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    
    if ([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
    
}

@end
