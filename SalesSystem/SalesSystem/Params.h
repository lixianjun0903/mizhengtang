//
//  Params.h
//  SalesSystem
//
//  Created by Patrick on 15/4/2.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Params : NSObject

#define LOGIN "http://115.29.36.21:4838/MobileUser.asmx/AuthenticateLogin?"
#define MODIFYPASSWORD "http://115.29.36.21:4838/MobileUser.asmx/ModifyPassword?"

#define MODIFYUSERINFO "http://115.29.36.21:4838/MobileUser.asmx/ModifyUserInfo?"

#define SUBMITDATE "http://115.29.36.21:4838/SalesInfo.asmx/SubmitData?"


/**
 * @param Username 登陆的用户名
 * @param Password 加密后的密码
 * **/
+(NSString *)getLoginURLWithUserName:(NSString *)username andPassWord:(NSString *)password;

/**
 * @param userId    用户id
 * @param oldPassword   旧密码
 * @param newPassword   新密码
 * **/
+(NSString *)getModifyPasswordURLWithUserId:(NSString *)userid
                             andOldPassword:(NSString *)oldpassword
                             andnewPassword:(NSString *)newpassword;

+(NSString *)getModifyUserInfoWithUserId:(NSString *)userid andUserName:(NSString *)username;

/**
 * /SalesInfo.asmx/SubmitData?userId=string&salesCount=string&visitCount=string
 * @param userId   用户id
 * @param salesCount 销量数据
 * @param visitCount 访问量
 * **/
+(NSString *)getSubmitDataURLWithUserId:(NSString *)userid
                             andsalesCount:(NSString *)salesCount
                              andvisitCount:(NSString *)visitCount;

@end
