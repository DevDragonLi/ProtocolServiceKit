//
//  ProtocolServiceManger.h
//  ProtocolServiceManger
//
//  Created by DevDragonli on 18/7/2020.
//

#import <Foundation/Foundation.h>

#define ServiceWithProtocol(aProtocol) [[ProtocolServiceManger sharedManger] serviceClassWithProtocol:@protocol(aProtocol)]

NS_ASSUME_NONNULL_BEGIN

@interface ProtocolServiceManger : NSObject

+ (instancetype)sharedManger;

/// efficient Transfer aProtocol to Service Class
/// @param aProtocol  aProtocol
- (Class)serviceClassWithProtocol:(Protocol *)aProtocol;

@end

NS_ASSUME_NONNULL_END
