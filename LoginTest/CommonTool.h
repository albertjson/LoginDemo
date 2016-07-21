//
//  CommonTool.h
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonTool : NSObject

/**
 *  快捷方法查找故事版中对应视图
 *
 *  @param name       storyboard name
 *  @param identifier storyboard id
 *
 *  @return 已查询到的控制器
 */
+ (__kindof UIViewController*)sbWithName:(NSString*)name
                              identifier:(NSString*)identifier;

/**
 * @brief   便捷提示框
 */
+ (void)alertWithMessage:(NSString *)message
          baseController:(UIViewController *)controller
   withCompletionHandler:(void (^)(void)) completionHandler;

@end


extern BOOL stringIsEmpty(NSString* str);
