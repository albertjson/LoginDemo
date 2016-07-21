//
//  RecentsViewController.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "RecentsViewController.h"
#import "CommonTool.h"
#import "UIViewController+CheckLoginStatus.h"
#import "FeaturedViewController.h"

@interface RecentsViewController ()

@end

@implementation RecentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)myRecordAction:(id)sender
{
  
    //更改此值，使用不同的方法查看效果
    NSInteger  checkLoginType = 4;
    
    
    switch (checkLoginType) {
        case 1:
        {
            //最传统的方式
            [self checkloginWithType1];
            
        }
            break;
        case 2:
        {
            //在基类写方法做处理
            [self checkloginWithType2];
        }
            break;
        case 3:
        {
            //类别方法
            [self checkloginWithType3];
        }
            break;
        case 4:
        {
            //直接返回bool值，登陆成功不作处理，拓展性比较大
            [self checkloginWithType4];
        }
            break;
            
        default:
            break;
    }
    
    
}

- (void)checkloginWithType1
{
    NSString * username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSString * password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    
    if (!stringIsEmpty(username)&&!stringIsEmpty(password)) {
        //已登录
        [self performSegueWithIdentifier:@"myRecordSegue" sender:nil];
    }else{
        //跳转到登陆页面
        UIViewController * loginViewController = [CommonTool sbWithName:@"Main" identifier:@"LoginViewController"];
        UINavigationController * navgationVC = [[UINavigationController alloc] initWithRootViewController:loginViewController];
        [self presentViewController:navgationVC animated:YES completion:^{
            
        }];
    }
}
- (void)checkloginWithType2
{
    [self checkLoginWithLoginedBlock:^{
        
        NSLog(@"login sucess");
        [self performSegueWithIdentifier:@"myRecordSegue" sender:nil];
        
    } loginCancelBlock:^{
        NSLog(@"cancel login");
    }];
}
- (void)checkloginWithType3
{
    [self checkingLoginWithLoginedBlock:^{
        
        NSLog(@"login sucess");
        [self performSegueWithIdentifier:@"myRecordSegue" sender:nil];
        
    } loginCancelBlock:^{
        
        NSLog(@"cancel login");
    }];
}
- (void)checkloginWithType4
{
    if ([self isCheckingLogined]) {
        
        [self performSegueWithIdentifier:@"myRecordSegue" sender:nil];
    }
    
//    FeaturedViewController * featuredVC = [[FeaturedViewController alloc] init];
//    //self.navigationController 是你要重写的导航类
//    [self.navigationController pushViewController:featuredVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSString * username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];

    if ([segue.identifier isEqualToString:@"myRecordSegue"]) {
        [segue.destinationViewController setValue:username forKey:@"username"];
    }
}


@end
