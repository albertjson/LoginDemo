//
//  MeViewController.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "MeViewController.h"
#import "CommonTool.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(loginOrLoginOutAction:)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData) name:@"loginInSucessNotification" object:nil];
    
    [self loadData];
}
- (void)loadData
{
    NSString * loginStatus = @"";

    NSString * username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString * password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    if (!stringIsEmpty(username)&&!stringIsEmpty(password)) {
        //已登录
        loginStatus = @"去注销";
        self.navigationItem.title = username;
    }else{
        loginStatus = @"去登陆";
        self.navigationItem.title = @"Me";
    }
    self.navigationItem.leftBarButtonItem.title = loginStatus;
    
}

- (void)loginOrLoginOutAction:(UIBarButtonItem*)item
{
    if ([item.title isEqualToString:@"去注销"]) {
        
        //注销操作
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
        
        [self loadData];
        
    }else{
        
        //跳转到登陆页面
        UIViewController * loginViewController = [CommonTool sbWithName:@"Main" identifier:@"LoginViewController"];
        
        UINavigationController * navgationVC = [[UINavigationController alloc] initWithRootViewController:loginViewController];
        [self presentViewController:navgationVC animated:YES completion:^{
            
        }];
    }
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
