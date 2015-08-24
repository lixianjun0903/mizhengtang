//
//  ViewController.h
//  SalesSystem
//
//  Created by Patrick on 15/3/29.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UITextField *tf_username;
@property (weak, nonatomic) IBOutlet UITextField *tf_password;

@property (weak, nonatomic) IBOutlet UIButton *btn_login;
- (IBAction)login:(id)sender;
@end

