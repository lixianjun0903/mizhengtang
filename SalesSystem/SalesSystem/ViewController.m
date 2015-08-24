//
//  ViewController.m
//  SalesSystem
//
//  Created by Patrick on 15/3/29.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "ViewController.h"
#import "Params.h"
#import "MD5.h"
#import "ProgressHUD.h"
#import "IQKeyboardManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * imageView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 63)];
    imageView.backgroundColor = [UIColor colorWithRed:24/255.0 green:152/255.0 blue:132/255.0 alpha:1];
    
    [self.view addSubview:imageView];
    
    UILabel * tiitleLable =[[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    tiitleLable.text = @"秘珍堂数据上传";
    tiitleLable.font =[UIFont systemFontOfSize:18];
    tiitleLable.textColor =[UIColor whiteColor];
    tiitleLable.textAlignment = NSTextAlignmentCenter;
    [imageView addSubview:tiitleLable];
    [[IQKeyboardManager sharedManager] setEnable:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    //登录功能
    NSString *username = self.tf_username.text;
    NSString *password = self.tf_password.text;
    self.tf_username.placeholder = @"请输入用户名";
    self.tf_username.textColor = [UIColor grayColor];
    self.tf_password.placeholder  = @"请输入密码";
    self.tf_password.textColor = [UIColor grayColor];
    self.tf_password.font = [UIFont systemFontOfSize:16];
    self.tf_username.font = [UIFont systemFontOfSize:16];
    
    NSString *encodePassword =[MD5 md5:password];
    encodePassword = [encodePassword substringWithRange:NSMakeRange(8, 16)];
    NSString *url = [Params getLoginURLWithUserName:username andPassWord:encodePassword];
    
    [ProgressHUD show:@"请稍后"];
    
    
    [self startRequest:url success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [ProgressHUD dismiss];
        NSLog(@"JSON: %@", responseObject);
        NSDictionary *Dict_json = responseObject;
        
        NSString *str_code = [Dict_json objectForKey:@"code"];
        
        int code = [str_code intValue];
        NSString *msg;
        NSData *data;
        NSDictionary *dictmsg;
        NSUserDefaults *userDefaults;
        switch (code) {
            case 104:
                //登录成功
                NSLog(@"登录成功");
                msg = [Dict_json objectForKey:@"msg"];
                data=[msg dataUsingEncoding:NSUTF8StringEncoding];
                dictmsg = (NSDictionary *)[data mutableObjectFromJSONData];
                userDefaults = [NSUserDefaults standardUserDefaults];
                
                //保存登录后信息
                [userDefaults setObject:[dictmsg objectForKey:@"SysUser_Id"] forKey:@"SysUser_Id"];
                [userDefaults setObject:[dictmsg objectForKey:@"MobileUser_Name"] forKey:@"MobileUser_Name"];
                
                
                [self modalNewControllerWithStoryBoardName:@"Main" andStoryBoardID:@"mainnavigation"];
                break;
                
            default:
                    [ProgressHUD showError:[Dict_json objectForKey:@"msg"]];
                break;
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [ProgressHUD dismiss];
        [ProgressHUD showError:@"请求失败"];
        NSLog(@"Error: %@", error);
    }];
}
@end
