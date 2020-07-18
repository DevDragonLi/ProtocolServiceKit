//
//  LFLVipService.m
//  ProtocolServiceManger_Example
//
//  Created by admin on 18/7/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFLVipProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface LFLVipService : NSObject<LFLVipProtocol>

@end

NS_ASSUME_NONNULL_END


@implementation LFLVipService

+ (NSString *)currentUserVipstatus {
    return @"VIP10";
}


@end
