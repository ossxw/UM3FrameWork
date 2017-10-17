//
//  UMShareCategory.h
//  HandheldDevices
//
//  Created by LiXiqing on 17/1/5.
//  Copyright © 2017年 LiXiQing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UMShareCategory : NSObject
+(void)shareUMShare:(NSString*)title content:(NSString *)content imageName:(NSString *)imageName jumpUrl:(NSString *)jumpUrl isPlatformTypeSms:(BOOL)isSms;
@end
