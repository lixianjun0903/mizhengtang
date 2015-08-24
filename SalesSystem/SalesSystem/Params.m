//
//  Params.m
//  SalesSystem
//
//  Created by Patrick on 15/4/2.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "Params.h"

@implementation Params

+(NSString *)getLoginURLWithUserName:(NSString *)username andPassWord:(NSString *)password{
    NSString *url = [[NSString alloc]initWithFormat:@"%s%@%@%@%@",LOGIN,@"loginName=",username,@"&Password=",password];
    return url;
}

+(NSString *)getModifyPasswordURLWithUserId:(NSString *)userid
                             andOldPassword:(NSString *)oldpassword
                             andnewPassword:(NSString *)newpassword{
    NSString *url = [[NSString alloc]initWithFormat:@"%s%@%@%@%@%@%@",MODIFYPASSWORD,@"userId=",userid,@"&oldPassword=",oldpassword,@"&newPassword=",newpassword];
    return url;
}

+(NSString *)getModifyUserInfoWithUserId:(NSString *)userid andUserName:(NSString *)username{
    NSString *url = [[NSString alloc]initWithFormat:@"%s%@%@%@%@",MODIFYUSERINFO,@"userId=",userid,@"&userName=",username];
    return url;
}

+(NSString *)getSubmitDataURLWithUserId:(NSString *)userid
                              andsalesCount:(NSString *)salesCount
                              andvisitCount:(NSString *)visitCount{
    NSString *url = [[NSString alloc]initWithFormat:@"%s%@%@%@%@%@%@",SUBMITDATE,@"userId=",userid,@"&salesCount=",salesCount,@"&visitCount=",visitCount];
    return url;

}

@end
