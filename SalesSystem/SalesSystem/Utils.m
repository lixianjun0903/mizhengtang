//
//  Utils.m
//  SalesSystem
//
//  Created by Patrick on 15/4/2.
//  Copyright (c) 2015年 Patrick. All rights reserved.
//

#import "Utils.h"

@implementation Utils

//去斜杠
+(NSString *) getOffRubbishWithString:(NSString *)str
{
    NSMutableString *responseString = [NSMutableString stringWithString:str];
    NSString *character = nil;
    for (int i = 0; i < responseString.length; i ++) {
        character = [responseString substringWithRange:NSMakeRange(i, 1)];
        if ([character isEqualToString:@"\\\""])
            [responseString deleteCharactersInRange:NSMakeRange(i, 1)];
    }
    
    [responseString stringByReplacingOccurrencesOfString:@"\'" withString:@""];
    
    return responseString;
}

@end
