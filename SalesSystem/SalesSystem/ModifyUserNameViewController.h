//
//  ModifyUserNameViewController.h
//  SalesSystem
//
//  Created by Patrick on 15/3/31.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "BaseViewController.h"

@interface ModifyUserNameViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *tf_username;
- (IBAction)modifyUsername:(id)sender;
@end
