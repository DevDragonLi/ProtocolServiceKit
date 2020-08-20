//
//  ProtocolServiceManger.m
//  ProtocolServiceManger
//
//  Created by DevDragonli on 18/7/2020.
//

#import "ProtocolServiceManger.h"

@interface ProtocolServiceManger ()

/// Map
@property (nonatomic,strong,nullable) NSMutableDictionary < NSString *, NSString * > * mapDics;

/// cache
@property (nonatomic,strong,nullable) NSMutableDictionary < NSString *, NSString * > * cacheDics;

@end

@implementation ProtocolServiceManger

+ (instancetype)sharedManger {
    static dispatch_once_t once;
    static ProtocolServiceManger *sharedManger;
    dispatch_once(&once, ^{
        sharedManger = [[[self class] alloc] init];
        sharedManger.mapDics = [NSMutableDictionary dictionary];
        sharedManger.cacheDics = [NSMutableDictionary dictionary];
    });
    return sharedManger;
}

- (Class)serviceClassWithProtocol:(Protocol *)aProtocol {
    return [self serviceClassWithProtocol:aProtocol isCache:NO];
}

#pragma mark - cache 


- (Class)serviceClassWithCachedProtocol:(Protocol *)cachedProtocol {
    // cache Type
    NSString *cacheServiceClass = [self.cacheDics objectForKey:NSStringFromProtocol(cachedProtocol)];
    if (cacheServiceClass) {
        return [self checkServiceClass:NSClassFromString(cacheServiceClass) aProtocol:cachedProtocol];
    } else {
        return [self serviceClassWithProtocol:cachedProtocol isCache:YES];
    }
}

- (Class)serviceClassWithProtocol:(Protocol *)aProtocol
                          isCache:(BOOL)isCache {
    // current Protocol is Exist
    if (!aProtocol) {
        NSAssert(!aProtocol, @"protocol not exist !");
        return nil;
    }
    // Normal Service Class
    NSString *serviceClassString = [NSStringFromProtocol(aProtocol) stringByReplacingOccurrencesOfString:@"Protocol" withString:@"Service"];
    Class serviceClass = NSClassFromString(serviceClassString);
    if (!serviceClass) {
        serviceClass = [self tryMapServiceClassWithProtocol:aProtocol];
    }
    if (isCache) {
        [self.cacheDics setValue:NSStringFromClass(serviceClass) forKey:NSStringFromProtocol(aProtocol)];
        
    }
    return [self checkServiceClass:serviceClass aProtocol:aProtocol];
}


#pragma mark - check Service Class

- (Class)checkServiceClass:(Class)serviceClass aProtocol:(Protocol *)aProtocol {
    // make Sure implClass conformsToProtocol then return ServiceClass
    if (serviceClass && [serviceClass conformsToProtocol:aProtocol]) {
        return serviceClass;
    } else {
        NSAssert(!serviceClass, @"Current Class Not implementation Method or Not exist Service Class");
        return nil;
    }
}

#pragma mark - map

- (Class)tryMapServiceClassWithProtocol:(Protocol *)aProtocol {
    NSString *mapClassString = [self.mapDics objectForKey:NSStringFromProtocol(aProtocol)];
    return NSClassFromString(mapClassString);
}

- (void)configProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *>*)mapDics {
    [self addProtocolServiceMapsWithDic:mapDics];
}

- (void)addProtocolServiceMapsWithDic:(NSDictionary < NSString * ,NSString *>* )mapDics {
    [mapDics enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull protocolKey, NSString *  _Nonnull serviceClassString, BOOL * _Nonnull stop) {
        [self.mapDics setValue:serviceClassString forKey:protocolKey];
    }];
}

@end
