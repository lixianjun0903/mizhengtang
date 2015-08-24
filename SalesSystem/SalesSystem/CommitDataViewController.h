//
//  CommitDataViewController.h
//  SalesSystem
//
//  Created by Patrick on 15/3/31.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "BaseViewController.h"

@interface CommitDataViewController : BaseViewController<UIAlertViewDelegate>


//@property (weak, nonatomic) IBOutlet UIBarButtonItem *usernameItem;
//@property (weak, nonatomic) IBOutlet UIButton *usernrameItem;
//@property (weak, nonatomic) IBOutlet UILable *andrewuserItem;
@property(weak,nonatomic) IBOutlet UILabel *andrewuserItem;


@property (weak, nonatomic) IBOutlet UITextField *tf_collect;
@property (weak, nonatomic) IBOutlet UITextField *tf_visit;
@property (weak, nonatomic) IBOutlet UINavigationItem *Nav_title;



- (IBAction)submit:(id)sender;
- (IBAction)exit:(id)sender;
@end
