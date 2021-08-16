//
//  ProShared.m
//  ProtocolServiceKit
//
//  Created by DevDragonli on 2021/3/12.
//

#import "ProShared.h"

@implementation ProShared

+ (instancetype)shared {
    
    static ProShared *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[super allocWithZone:NULL] init];
    });
    
    return sharedSingleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [ProShared shared];
}

- (instancetype)copyWithZone:(nullable NSZone *)zone {
    return [ProShared shared];
}

- (instancetype)mutableCopyWithZone:(nullable NSZone *)zone {
    return [ProShared shared];
}


@end
