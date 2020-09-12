//
//  LFLVipService.m
//  ProtocolServiceManger_Example
//
//  Created by admin on 18/7/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//  对接能力层，可引用内部任意类，
//  组件化开发模式下，⚠️不对外开放此文件。

#import <Foundation/Foundation.h>

#import "LFLVipProtocol.h"
#import "LFLAccountTool.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFLVipService : NSObject<LFLVipProtocol>

@end

NS_ASSUME_NONNULL_END


@implementation LFLVipService

+ (BOOL)isCurrentUserVipStatus {
    NSLog(@"LFLVipProtocol IMP Method Success Run！");
    return [LFLAccountTool isUserVipStatus];
//    return YES;
}


@end
