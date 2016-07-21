//
//  UIViewController+CheckLoginStatus.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "UIViewController+CheckLoginStatus.h"
#import "CommonTool.h"

@implementation UIViewController (CheckLoginStatus)



- (LoginViewController *)checkingLoginWithLoginedBlock:(void(^)())loginedBlock
                                   loginCancelBlock:(void(^)())cancelBlock
{
    //此处判断是否登陆的逻辑可由单例去做判断
    NSString * username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString * password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    if (!stringIsEmpty(username)&&!stringIsEmpty(password)) {
        //已登录
        if (loginedBlock) {
            loginedBlock();
        }
        return nil;
    }else{
        //跳转到登陆页面
        LoginViewController * loginViewController = (LoginViewController *)[CommonTool sbWithName:@"Main" identifier:@"LoginViewController"];
        
        loginViewController.loginOkBlock = loginedBlock;
        loginViewController.loginCancelBlock = cancelBlock;
        
        UINavigationController * navgationVC = [[UINavigationController alloc] initWithRootViewController:loginViewController];
        [self presentViewController:navgationVC animated:YES completion:^{
            
        }];
        return loginViewController;
    }
}
- (BOOL)isCheckingLogined
{
    //此处判断是否登陆的逻辑可由单例去做判断
    NSString * username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString * password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    if (!stringIsEmpty(username)&&!stringIsEmpty(password)) {
        //已登录

        return YES;
    }else{
        //跳转到登陆页面
        LoginViewController * loginViewController = (LoginViewController *)[CommonTool sbWithName:@"Main" identifier:@"LoginViewController"];
                
        UINavigationController * navgationVC = [[UINavigationController alloc] initWithRootViewController:loginViewController];
        [self presentViewController:navgationVC animated:YES completion:^{
            
        }];
        return NO;
    }
    
}

@end
