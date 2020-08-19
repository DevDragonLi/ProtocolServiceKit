//
//  LFLTestRuleIMP.m
//  ProtocolServiceManger_Example
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
    NSLog(@"协议为：%@,实际实现类为%@",NSStringFromProtocol(@protocol(LFLUnRuleProtocol)),NSStringFromClass([self class]));
}

@end
