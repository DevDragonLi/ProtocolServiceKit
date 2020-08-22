//
//  ProtocolServiceManger.h
//  ProtocolServiceManger
//
//  Created by DevDragonli on 18/7/2020.
//

#import <Foundation/Foundation.h>

/// Recommend
#define ServiceWithCachedProtocol(cachedProtocol) [[ProService sharedManger] serviceClassWithCachedProtocol:@protocol(cachedProtocol)]

#define ServiceWithProtocol(aProtocol) [[ProService sharedManger] serviceClassWithProtocol:@protocol(aProtocol)]

NS_ASSUME_NONNULL_BEGIN

@interface ProService : NSObject

+ (instancetype)sharedManger;

/// Efficient  Protocol <=> Service Class
/// Find Service Class Priority：1.NameRules   2.Map Rules
/// @param aProtocol  aProtocol
- (Class)serviceClassWithProtocol:(Protocol *)aProtocol;

/// efficient Transfer aProtocol to Service Class
/// NOTE：only Recommend user in Core Module ！
/// Find Service Class Priority：1. Cache Service Class 2.NameRules   3.Map Rules
/// @param cachedProtocol  aProtocol
- (Class)serviceClassWithCachedProtocol:(Protocol *)cachedProtocol;

/// config Protocol && ServiceClass MapDics
/// @param mapDics   Map < Key:protocolStringKey Value:serviceClassString >
- (void)configProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *> *)mapDics;

@end

NS_ASSUME_NONNULL_END
