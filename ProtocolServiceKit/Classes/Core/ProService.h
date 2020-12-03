//
//  ProService.h
//  ProService
//
//  Created by DevDragonli on 18/7/2020.
//

#import <Foundation/Foundation.h>

/// Recommend：cache Service Class
#define ServiceWithCachedProtocol(cachedProtocol) [[ProService sharedManger] serviceClassWithCachedProtocol:@protocol(cachedProtocol)]

/// Uncache Service Class
#define ServiceWithProtocol(aProtocol) [[ProService sharedManger] serviceClassWithProtocol:@protocol(aProtocol)]

NS_ASSUME_NONNULL_BEGIN

@interface ProService : NSObject

/// Default  Value NO 【setting YES，ignore All Error Type 】
@property (nonatomic,assign)BOOL ignoreSafeMode;

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
/// NOTE: main Thread run【make sure any map Service can Return Frist】
- (void)configProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *> *)mapDics;

@end

NS_ASSUME_NONNULL_END
