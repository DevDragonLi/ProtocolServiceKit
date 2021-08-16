//
//  ProShared.h
//  ProtocolServiceKit
//
//  Created by DevDragonli on 2021/3/12.
//

#import <Foundation/Foundation.h>
#import "ProSharedProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProShared : NSObject <ProSharedProtocol>

/// gets singleton object
/// return singleton
+ (instancetype)shared;

- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)new NS_UNAVAILABLE;


@end

NS_ASSUME_NONNULL_END
