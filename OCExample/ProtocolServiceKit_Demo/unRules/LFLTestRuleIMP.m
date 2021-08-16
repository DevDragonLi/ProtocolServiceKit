//
//  LFLTestRuleIMP.m
//  ProtocolServiceKit_Demo_Example
//
//  Created by admin on 19/8/2020.
//  Copyright © 2020 DevdragonLi. All rights reserved.
//

#import "LFLTestRuleIMP.h"

#import "LFLUnRuleProtocol.h"

@interface LFLTestRuleIMP () <LFLUnRuleProtocol>

@end

@implementation LFLTestRuleIMP


+ (void)unRuleMethod {
    NSLog(@"协议：%@,实际服务类名%@",NSStringFromProtocol(@protocol(LFLUnRuleProtocol)),NSStringFromClass([self class]));
}

- (NSString *)test {
    NSLog(@"我是对象函数");
    return @"test";
}

+ (nonnull instancetype)shared {
    return [super shared];
}

@end
