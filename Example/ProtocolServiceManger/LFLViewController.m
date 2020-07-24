//
//  LFLViewController.m
//  ProtocolServiceManger
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLViewController.h"
#import <ProtocolServiceManger/ProtocolServiceManger.h>

#import "LFLVipProtocol.h"
#import "LFLPlayProtocol.h"

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     VIP和播放业务复杂后，只公开Protocol文件决定业务对外能力
     组件交互：从VIP业务来校验当前用户是否VIP，进而决定是否可以触发播放业务执行播放
     */
    Class <LFLVipProtocol> vipService = ServiceWithProtocol(LFLVipProtocol);
    if (vipService && [vipService isCurrentUserVipStatus]) {
        [ServiceWithProtocol(LFLPlayProtocol) playMiniVideo];
    } else {
        NSLog(@"Error:LFLVipProtocol notfound service Class");
    }
}


@end
