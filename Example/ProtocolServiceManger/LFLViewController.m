//
//  LFLViewController.m
//  ProtocolServiceManger
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLViewController.h"

#import "LFLVipProtocol.h"
#import "LFLPlayProtocol.h"
#import "LFLUnRuleProtocol.h"
#import <ProtocolServiceKit/ProtocolServiceKit.h>

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self normalExample];
    [self unRuleExample];
}
/// 非规则配置，参考LFLAppDelegate.m 配置细节
- (void)unRuleExample {
    Class <LFLUnRuleProtocol> ruleService = ServiceWithProtocol(LFLUnRuleProtocol);
    // 此处Class 实际为LFLTestRuleIMP
    [ruleService unRuleMethod];
    
}

/// 常规案例
- (void)normalExample {
    
    // VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
    Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
    
    if (vipService && [vipService isCurrentUserVipStatus]) {
        [ServiceWithProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
    
}

@end
