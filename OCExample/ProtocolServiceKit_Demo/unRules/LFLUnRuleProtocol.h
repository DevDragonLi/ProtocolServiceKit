//
//  LFLUnRuleProtocol.h
//  ProtocolServiceKit_Demo_Example
//
//  Created by admin on 19/8/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ProtocolServiceKit/ProSharedProtocol.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LFLUnRuleProtocol <ProSharedProtocol>

+ (void)unRuleMethod;

- (NSString *)test;

@end

NS_ASSUME_NONNULL_END
