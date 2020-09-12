//
//  LFLVipProtocol.h
//  ProtocolServiceManger_Example
//
//  Created by admin on 18/7/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//  账户组件，仅对外公开此LFLVipProtocol头文件&&屏蔽组件内部实现

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LFLVipProtocol <NSObject>

+ (BOOL)isCurrentUserVipStatus;

@end

NS_ASSUME_NONNULL_END
