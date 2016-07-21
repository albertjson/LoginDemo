//
//  BaseViewController.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "BaseViewController.h"
#import "CommonTool.h"
#import "LoginViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (LoginViewController *)checkLoginWithLoginedBlock:(void(^)())loginedBlock
                                   loginCancelBlock:(void(^)())cancelBlock
{
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
