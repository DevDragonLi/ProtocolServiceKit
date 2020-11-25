//
//  LFLAppDelegate.m
//  ProtocolServiceManger
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLAppDelegate.h"
#import <ProtocolServiceKit/ProtocolServiceKit.h>

//#import "LFLUnRuleProtocol.h"
//#import "LFLTestRuleIMP.h"

@implementation LFLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initConfigServiceMaps];
    return YES;
}

- (void)initConfigServiceMaps {
    
//    ProService.sharedManger.ignoreSafeMode = YES;
    
    NSDictionary *mapDic = @{
        @"LFLUnRuleProtocol":@"LFLTestRuleIMP"
    };
    //recommend : 项目Map较多，可plist文件维护【避免代码硬编码类出错】！
    [[ProService sharedManger] configProtocolServiceMapsWithDic:mapDic];
}


@end
