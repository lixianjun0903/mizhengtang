//
//  ModifyUserNameViewController.m
//  SalesSystem
//
//  Created by Patrick on 15/3/31.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "ModifyUserNameViewController.h"
#import "Params.h"
#import "ProgressHUD.h"


@interface ModifyUserNameViewController ()

@end

@implementation ModifyUserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
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

- (IBAction)modifyUsername:(id)sender {
    NSString *username = self.tf_username.text;
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"SysUser_Id"];
    
    NSString *url = [Params getModifyUserInfoWithUserId:userId andUserName:username];
    
    [self startRequest:url success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"json：%@",responseObject);
        NSString *code = [responseObject objectForKey:@"code"];
        
        if([code isEqualToString:@"303"]){
            //成功
            [ProgressHUD showSuccess:[responseObject objectForKey:@"msg"]];
            NSUserDefaults *userDefaults;
            [userDefaults setObject:username forKey:@"MobileUser_Name"];
            
            
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            //失败
            [ProgressHUD showError:[responseObject objectForKey:@"msg"]];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
@end
