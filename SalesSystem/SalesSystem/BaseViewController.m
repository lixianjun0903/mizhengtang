//
//  BaseViewController.m
//  SalesSystem
//
//  Created by Patrick on 15/3/29.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "BaseViewController.h"
#import "AFHTTPRequestOperationManager.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //增加键盘关闭功能
    
//    keyBoardController=[[UIKeyboardViewController alloc] initWithControllerDelegate:self];
//    [keyBoardController addToolbarToKeyboard];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startRequest:(NSString *)requestURL
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"text/plain; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager GET:requestURL parameters:nil success:success failure:failure];
    
}

-(NSString *)getOffRubbishWithString:(NSString *)str
{
    NSMutableString *responseString = [NSMutableString stringWithString:str];
    NSString *character = nil;
    for (int i = 0; i < responseString.length; i ++) {
        character = [responseString substringWithRange:NSMakeRange(i, 1)];
        if ([character isEqualToString:@"\\"])
            [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    
    [responseString stringByReplacingOccurrencesOfString:@"\'" withString:@""];
    
    return responseString;
}

/**
 *  modal跳转方法
 *
 *  @param StoryBoardName StoryBoard的文件名
 *  @param StoryBoardID   StoryBoard里面的UI的ID
 
 */
-(void)modalNewControllerWithStoryBoardName:(NSString *)StoryBoardName andStoryBoardID:(NSString *)StoryBoardID
{
    UIStoryboard *newControllerStoryBoard = [UIStoryboard storyboardWithName:StoryBoardName bundle:nil];
    UIViewController *newController = [newControllerStoryBoard instantiateViewControllerWithIdentifier:StoryBoardID];
    [self presentViewController:newController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
