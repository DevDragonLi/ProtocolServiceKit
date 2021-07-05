//
//  LFLAppDelegate.m
//  ProtocolServiceKit_Demo
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLAppDelegate.h"
#import <ProtocolServiceKit/ProtocolServiceKit.h>

@implementation LFLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configServiceMaps];
    
    return YES;
}

- (void)configServiceMaps {
    
    NSDictionary *mapDic = @{
        @"LFLUnRuleProtocol":@"LFLTestRuleIMP"
    };
    //recommend : 项目Map较多，可plist文件维护【避免代码硬编码类出错】！
    [[ProService sharedManger] configProtocolServiceMapsWithDic:mapDic];
}

@end
