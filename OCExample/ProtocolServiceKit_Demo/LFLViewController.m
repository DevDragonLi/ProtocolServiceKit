//
//  LFLViewController.m
//  ProtocolServiceKit_Demo
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

/**
    #import <AccountBusiness/LFLAccountTool.h>   Compiler error [组件仅仅对外API 层可访问]
 */

#import "LFLViewController.h"
#import <ProtocolServiceKit/ProtocolServiceKit.h>

#import <AccountBusiness/LFLVipProtocol.h>
#import <PlayBusiness/LFLPlayProtocol.h>

#import "LFLUnRuleProtocol.h"

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self normalExample];
}

/// Map  =》 LFLAppDelegate.m
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    // 此处Class 实际为LFLTestRuleIMP
    Class <LFLUnRuleProtocol> ruleService = ServiceWithProtocol(LFLUnRuleProtocol);
    // 类函数
    [ruleService unRuleMethod];
    
    // 对象函数 ：代码提醒
    [[ruleService shared] test];
    
}

/// normalExample
- (void)normalExample {
    
    // VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
    Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
    
    // 不直接使用对应账户类 [LFLAccountTool isUserVipStatus];
    BOOL isVip = [vipService isCurrentUserVipStatus];

    if (vipService && isVip) {
        // ServiceWithCachedProtocol:缓存API
        [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol not Found service Class");
    }
    
    if (vipService && [vipService isCurrentUserVipStatus]) {
        [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol not Found service Class");
    }
}

@end
