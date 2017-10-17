//
//  UMShareCategory.m
//  HandheldDevices
//
//  Created by LiXiqing on 17/1/5.
//  Copyright © 2017年 LiXiQing. All rights reserved.
//

#import "UMShareCategory.h"
#import <UShareUI/UShareUI.h>

@implementation UMShareCategory

+ (void)shareUMShare:(NSString*)title content:(NSString *)content imageName:(NSString *)imageName jumpUrl:(NSString *)jumpUrl isPlatformTypeSms:(BOOL)isSms
{
    if (isSms == YES) {
        [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),
                                                   @(UMSocialPlatformType_WechatTimeLine),
                                                   @(UMSocialPlatformType_QQ),
                                                   @(UMSocialPlatformType_Qzone),
                                                   @(UMSocialPlatformType_Sina),
                                                   @(UMSocialPlatformType_Sms),
                                                   ]];
    }else{
        [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),
                                                   @(UMSocialPlatformType_WechatTimeLine),
                                                   @(UMSocialPlatformType_QQ),
                                                   @(UMSocialPlatformType_Qzone),
//                                                   @(UMSocialPlatformType_Sina),
                                                   ]];
    }
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        
        //创建分享消息对象
        UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
        
        //创建网页内容对象
        NSString* thumbURL = jumpUrl;
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:content thumImage:[UIImage imageNamed:imageName]];
        //设置网页地址
        shareObject.webpageUrl = thumbURL;
        //分享消息对象设置分享内容对象
        messageObject.shareObject = shareObject;
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
            }
        }];
    }];
    
}
@end
