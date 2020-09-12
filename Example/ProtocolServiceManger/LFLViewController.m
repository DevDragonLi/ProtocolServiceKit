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

//#import "LFLAccountTool.h"

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self normalExample];
    [self unRuleExample];
}
/// Map  =》 LFLAppDelegate.m
- (void)unRuleExample {
    Class <LFLUnRuleProtocol> ruleService = ServiceWithProtocol(LFLUnRuleProtocol);
    // 此处Class 实际为LFLTestRuleIMP
    [ruleService unRuleMethod];
}

/// Normal
- (void)normalExample {
    
    // VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
    Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
    
    // BOOL isVip = [LFLAccountTool isUserVipStatus];
    
    BOOL isVip = [vipService isCurrentUserVipStatus];
    
    if (vipService && isVip) {
        [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
    
    if (vipService && [vipService isCurrentUserVipStatus]) {
        [ServiceWithCachedProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
    
}

@end
