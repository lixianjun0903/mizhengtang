//
//  ModifyPasswordViewController.h
//  SalesSystem
//
//  Created by Patrick on 15/3/31.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "BaseViewController.h"

@interface ModifyPasswordViewController : BaseViewController
//旧密码
@property (weak, nonatomic) IBOutlet UITextField *tf_oldpassword;
//新密码
@property (weak, nonatomic) IBOutlet UITextField *tf_newpassword;
- (IBAction)btn_modifyPassword:(id)sender;
- (IBAction)back:(id)sender;

@end
