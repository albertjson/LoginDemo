//
//  CommonTool.m
//  LoginTest
//
//  Created by choice-ios1 on 16/7/20.
//  Copyright © 2016年 choice-ios1. All rights reserved.
//

#import "CommonTool.h"

@implementation CommonTool

+ (__kindof UIViewController*)sbWithName:(NSString*)name
                              identifier:(NSString*)identifier{
    
    if ([name isEqualToString:@""]||name==nil) {
        return nil;
    }
    if ([identifier isEqualToString:@""]||name==nil) {
        return nil;
    }
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    
    UIViewController * controller = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    return controller;
}

+ (void)alertWithMessage:(NSString *)message
          baseController:(UIViewController *)controller
   withCompletionHandler:(void (^)(void)) completionHandler
{
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            if (completionHandler) {
                completionHandler();
            }
        }]];
        [controller presentViewController:alertController animated:YES completion:NULL];
}

@end

/*
 字符串是否没有内容
 */
inline BOOL stringIsEmpty(NSString* str){
    BOOL ret=NO;
    if(str==nil||[str isKindOfClass:[NSNull class]]){
        ret=YES;
    }else{
        NSString * temp=[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if([temp length]<1){
            ret=YES;
        }
    }
    return ret;
}
