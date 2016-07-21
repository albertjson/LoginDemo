//
//  UIViewController+CheckLoginStatus.h
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface UIViewController (CheckLoginStatus)


/*
 **** 第二种实现方式，在UIViewController的类别中实现校验是否登陆等一系列逻辑的方法
 */

/**
 *  @author ZICHU, 16-07-20 20:07:17
 *
 *  检查是否需要登陆，不需要登陆直接调用登陆成功的回调，需要登陆弹出登陆页面
 *
 *  @param loginedBlock 登陆成功的回调
 *  @param cancelBlock  取消登陆回调
 *
 *  @return LoginViewController
 */
- (LoginViewController *)checkingLoginWithLoginedBlock:(void(^)())loginedBlock
                                   loginCancelBlock:(void(^)())cancelBlock;


/**
 *  @author ZICHU, 16-07-20 21:07:28
 *
 *  第三种实现方式，判断登陆状态
 *
 *  @return 未登录直接跳转到登陆并返回No已登录返回Yes不作处理
 */
- (BOOL)isCheckingLogined;

@end
