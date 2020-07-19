//
//  LFLPlayService.m
//  ProtocolServiceManger_Example
//
//  Created by admin on 19/7/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFLPlayProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface LFLPlayService : NSObject<LFLPlayProtocol>

@end

NS_ASSUME_NONNULL_END

@implementation LFLPlayService

+ (void)playMiniVideo {
    NSLog(@"LFLPlayProtocol IMP Method Success Run！");
    NSLog(@"%s",__func__);
}


@end
