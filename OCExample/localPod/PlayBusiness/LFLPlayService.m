//
//  LFLPlayService.m
//  ProtocolServiceManger_Example
//
//  Created by admin on 19/7/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//

#import "LFLPlayService.h"

@interface LFLPlayService ()<LFLPlayProtocol>

@end

@implementation LFLPlayService

+ (void)playMiniVideo {
    NSLog(@"LFLPlayProtocol IMP Method Success Run！");
}


@end
