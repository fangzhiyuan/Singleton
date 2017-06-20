//
//  ShareManager.h
//  Singleton
//
//  Created by 威盛电气 on 2017/6/20.
//  Copyright © 2017年 fzy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareManager : NSObject
@property(nonatomic,copy)NSString *text;

+(ShareManager *)shareUserInfo;
@end
