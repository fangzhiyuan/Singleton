//
//  ShareManager.m
//  Singleton
//
//  Created by 威盛电气 on 2017/6/20.
//  Copyright © 2017年 fzy. All rights reserved.
//

#import "ShareManager.h"

@implementation ShareManager
+(ShareManager *)shareUserInfo{
    static ShareManager *shareMager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareMager = [[self alloc] init];
    });
    return shareMager;
}
@end
