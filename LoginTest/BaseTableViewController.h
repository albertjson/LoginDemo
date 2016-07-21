//
//  BaseTableViewController.h
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BaseViewController.h"

@interface BaseTableViewController : UITableViewController


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
- (LoginViewController *)checkLoginWithLoginedBlock:(void(^)())loginedBlock
                                   loginCancelBlock:(void(^)())cancelBlock;

@end
