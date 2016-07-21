//
//  LoginViewController.h
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^ZCBasicBlock)(void);


@interface LoginViewController : BaseViewController

@property (nonatomic, copy) ZCBasicBlock loginOkBlock;
@property (nonatomic, copy) ZCBasicBlock loginCancelBlock;

@end
