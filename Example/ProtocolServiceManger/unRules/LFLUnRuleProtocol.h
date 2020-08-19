//
//  LFLUnRuleProtocol.h
//  ProtocolServiceManger_Example
//
//  Created by admin on 19/8/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LFLUnRuleProtocol <NSObject>

/// Example：当前协议实现类，并非LFLUnRuleService
+ (void)unRuleMethod;

@end

NS_ASSUME_NONNULL_END
