//
//  LoginViewController.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "LoginViewController.h"
#import "CommonTool.h"

@interface LoginViewController ()

@property (nonatomic,weak) IBOutlet UITextField * usernameTextField;

@property (nonatomic,weak) IBOutlet UITextField * passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)closeLoginVCAction:(id)sender
{
    if (_loginCancelBlock) {
        _loginCancelBlock();
    }
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)loginAction:(id)sender
{
    NSString * username = _usernameTextField.text;
    NSString * password = _passwordTextField.text;
    
    if (stringIsEmpty(username)) {
        [CommonTool alertWithMessage:@"账号不能为空" baseController:self withCompletionHandler:nil];
        return;
    }
    if (stringIsEmpty(password)) {

        [CommonTool alertWithMessage:@"密码不能为空" baseController:self withCompletionHandler:nil];

        return;
    }
    
    
    //开始登陆
    //[NSThread sleepForTimeInterval:2];
    
    
    //登陆成功
    
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];

    [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loginInSucessNotification" object:nil];

    [self dismissViewControllerAnimated:YES completion:^{
        
        if (_loginOkBlock) {
            _loginOkBlock();
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    NSLog(@"LoginViewController dealloc");
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
