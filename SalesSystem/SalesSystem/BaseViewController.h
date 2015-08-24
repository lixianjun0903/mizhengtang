//
//  BaseViewController.h
//  SalesSystem
//
//  Created by Patrick on 15/3/29.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperation.h"
#import "Utils.h"
#import "JSONKit.h"

@interface BaseViewController : UIViewController

//开始请求
-(void)startRequest:(NSString *)requestURL
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

//去除 json 的斜杠
-(NSString *)getOffRubbishWithString:(NSString *)str;

/**
 *  总体跳转方法
 *
 *  @param StoryBoardName StoryBoard的文件名
 *  @param StoryBoardID   StoryBoard里面的UI的ID
 */
-(void)modalNewControllerWithStoryBoardName:(NSString *)StoryBoardName andStoryBoardID:(NSString *)StoryBoardID;
@end
