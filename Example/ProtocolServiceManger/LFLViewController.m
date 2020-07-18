//
//  LFLViewController.m
//  ProtocolServiceManger
//
//  Created by DevdragonLi on 07/18/2020.
//  Copyright (c) 2020 DevdragonLi. All rights reserved.
//

#import "LFLViewController.h"
#import "LFLVipProtocol.h"
#import <ProtocolServiceManger/ProtocolServiceManger.h>

@interface LFLViewController ()

@end

@implementation LFLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
    
    Class <LFLVipProtocol> vipService = [[ProtocolServiceManger sharedManger] serviceClassWithProtocol:@protocol(LFLVipProtocol)];
      if (vipService) {
          NSString *userVipstatus = [vipService currentUserVipstatus];
          NSLog(@"LFLViewController:%@",userVipstatus);
      } else {
          NSLog(@"Error:LFLVipProtocol notfound service Class");
      }
}


@end
