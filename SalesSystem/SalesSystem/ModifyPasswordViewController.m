//
//  ModifyPasswordViewController.m
//  SalesSystem
//
//  Created by Patrick on 15/3/31.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "ModifyPasswordViewController.h"
#import "Params.h"
#import "ProgressHUD.h"
#import "MD5.h"


@interface ModifyPasswordViewController ()

@end

@implementation ModifyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btn_modifyPassword:(id)sender {
    NSString *userid;
    userid = [[NSUserDefaults standardUserDefaults]stringForKey:@"SysUser_Id"];
    
    NSString *oldpassword = self.tf_oldpassword.text;
    NSString *newpassword = self.tf_newpassword.text;
    oldpassword = [[MD5 md5:oldpassword] substringWithRange:NSMakeRange(8, 16)];
    newpassword = [[MD5 md5:newpassword] substringWithRange:NSMakeRange(8, 16)];
    
    NSString *url = [Params getModifyPasswordURLWithUserId:userid andOldPassword:oldpassword andnewPassword:newpassword];
    [self startRequest:url success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        
        if ([[responseObject objectForKey:@"code"]isEqualToString:@"205"]) {
            //成功
            [ProgressHUD showSuccess:[responseObject objectForKey:@"msg"]];
            [self.navigationController popViewControllerAnimated:YES];
        }else{
            [ProgressHUD showError:[responseObject objectForKey:@"msg"]];

        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
