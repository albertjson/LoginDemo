//
//  BaseNavgationController.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "BaseNavgationController.h"
#import "LoginViewController.h"
#import "CommonTool.h"

@interface BaseNavgationController ()

@end

@implementation BaseNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //此处判断是否登陆的逻辑可由单例去做判断
    NSString * username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString * password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    //将要展现的页面需要登录
    if ([self checkContollerIsNeedLogin:viewController]) {
        
        if (!stringIsEmpty(username)&&!stringIsEmpty(password)) {
            //已登录
            
        }else{
            //跳转到登陆页面
            LoginViewController * loginViewController = (LoginViewController *)[CommonTool sbWithName:@"Main" identifier:@"LoginViewController"];
            
            UINavigationController * navgationVC = [[UINavigationController alloc] initWithRootViewController:loginViewController];
            [self presentViewController:navgationVC animated:YES completion:^{
                
            }];
            return;
        }

    }
    
    
    [super pushViewController:viewController animated:YES];
    
}
- (BOOL )checkContollerIsNeedLogin:(UIViewController*)controller
{
    for (NSString * classString in self.needLoginsArray) {
        
        Class tempClass = NSClassFromString(classString);
        
        if ([controller isKindOfClass:tempClass]) {
            
            return YES;
        }
    }
    return NO;
}
 */

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
