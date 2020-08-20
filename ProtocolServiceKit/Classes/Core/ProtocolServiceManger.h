//
//  ProtocolServiceManger.h
//  ProtocolServiceManger
//
//  Created by DevDragonli on 18/7/2020.
//

#import <Foundation/Foundation.h>

/// Recommend
#define ServiceWithCachedProtocol(cachedProtocol) [[ProtocolServiceManger sharedManger] serviceClassWithCachedProtocol:@protocol(cachedProtocol)]

#define ServiceWithProtocol(aProtocol) [[ProtocolServiceManger sharedManger] serviceClassWithProtocol:@protocol(aProtocol)]

NS_ASSUME_NONNULL_BEGIN

@interface ProtocolServiceManger : NSObject

+ (instancetype)sharedManger;

/// efficient Transfer aProtocol to Service Class
/// NOTE：查找优先级：按照命名规则，Map规则（serviceClass）
/// @param aProtocol  aProtocol
- (Class)serviceClassWithProtocol:(Protocol *)aProtocol;

/// efficient Transfer aProtocol to Service Class
/// NOTE：查找优先级：缓存，按照命名规则，Map规则（serviceClass）
/// @param cachedProtocol  aProtocol
- (Class)serviceClassWithCachedProtocol:(Protocol *)cachedProtocol;

/// 一次性配置无规则的Protocol && ServiceClass
/// @param mapDics  无规则类字典
- (void)configProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *> *)mapDics;
/// 动态新增配置无规则的Protocol && ServiceClass
/// @param mapDics  无规则类字典
- (void)addProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *> *)mapDics;

@end

NS_ASSUME_NONNULL_END
