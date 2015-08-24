//
//  CommitDataViewController.m
//  SalesSystem
//
//  Created by Patrick on 15/3/31.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "CommitDataViewController.h"
#import "ProgressHUD.h"
#import "Params.h"

@interface CommitDataViewController ()

@end

@implementation CommitDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    NSString *str =[[NSUserDefaults standardUserDefaults]stringForKey:@"MobileUser_Name"];
    //[self.usernameItem setTitle:str forState:UIControlStateNormal];
    //[self.andrewuserItem setTitle:str forState:UIControlStateNormal];
    [self.andrewuserItem setText:str];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *collect = self.tf_collect.text;
    NSString *visit = self.tf_visit.text;
    
    //获取上次上传的时间
    NSString *lastdate = [[NSUserDefaults standardUserDefaults]stringForKey:@"Last_Time"];
    if(lastdate){
        NSDate *now=[NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//        NSDate *last =[dateFormatter dateFromString:@"2015-04-11"];
        NSDate *last =[dateFormatter dateFromString:lastdate];
        
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        unsigned int unitFlags = NSDayCalendarUnit;
        NSDateComponents *comps = [gregorian components:unitFlags fromDate:last  toDate:now  options:0];
        int days = [comps day];
        NSLog(@"天数===%d",days);
        
        if(days >1){
            NSString *message = [[NSString alloc] initWithFormat:@" 销售量：%@ 访问量：%@ 是否上传？",collect,visit];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
            // optional - add more buttons:
            [alert addButtonWithTitle:@"确定"];
            [alert show];
        }else{
            [ProgressHUD showError:@"今天已经提交过了，请明天再试"];
        }
    }else{
        NSString *message = [[NSString alloc] initWithFormat:@" 销售量：%@ 访问量：%@ 是否上传？",collect,visit];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil];
        // optional - add more buttons:
        [alert addButtonWithTitle:@"确定"];
        [alert show];

    }
    
    
    
}

- (IBAction)exit:(id)sender {
    //退出功能
    [self modalNewControllerWithStoryBoardName:@"Main" andStoryBoardID:@"login"];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   //NSLog(@"%d",buttonIndex);
    
    NSString *collect;
    NSString *visit;
    NSString *userid;
    
    NSString *url;
    
    switch (buttonIndex) {
        case 1:
            //确定
            [ProgressHUD show:@"请稍后"];
            
            collect = self.tf_collect.text;
            visit = self.tf_visit.text;
            userid = [[NSUserDefaults standardUserDefaults]stringForKey:@"SysUser_Id"];
            
            url = [Params getSubmitDataURLWithUserId:userid andsalesCount:collect andvisitCount:visit];
            
            [self startRequest:url success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [ProgressHUD dismiss];
                NSLog(@"JSON: %@", responseObject);
                
                NSString *code = [responseObject objectForKey:@"code"];
                if ([code isEqualToString:@"407"]) {
                    //上传成功
                    [ProgressHUD showSuccess:[responseObject objectForKey:@"msg"]];
                    self.tf_collect.text = @"";
                    self.tf_visit.text = @"";
                    
                    
                    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                    
                    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                    [dateFormatter setDateFormat:@"yyyy-MM-dd"];

                    
                    [userDefaults setObject:[dateFormatter stringFromDate:[NSDate date]] forKey:@"Last_Time"];
                }else{
                    //上传失败
                    [ProgressHUD showError:[responseObject objectForKey:@"msg"]];
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [ProgressHUD dismiss];
                [ProgressHUD showError:@"请求失败"];
                NSLog(@"Error: %@", error);
            }];
            
            break;
//        case 0:
//            //取消
//            
//            break;
    }
    
}
@end
