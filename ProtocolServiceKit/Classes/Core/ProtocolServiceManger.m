//
//  ProtocolServiceManger.m
//  ProtocolServiceManger
//
//  Created by DevDragonli on 18/7/2020.
//

#import "ProtocolServiceManger.h"

@interface ProtocolServiceManger ()

@property (nonatomic,strong,nullable) NSMutableDictionary < NSString *, NSString * > * mapDics;

@end

@implementation ProtocolServiceManger

+ (instancetype)sharedManger {
    static dispatch_once_t once;
    static ProtocolServiceManger *sharedManger;
    dispatch_once(&once, ^{
        sharedManger = [[[self class] alloc] init];
        sharedManger.mapDics = [NSMutableDictionary dictionary];
    });
    return sharedManger;
}

- (Class)serviceClassWithProtocol:(Protocol *)aProtocol {
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
    
    // make Sure implClass conformsToProtocol then return ServiceClass
    if (serviceClass && [serviceClass conformsToProtocol:aProtocol]) {
        return serviceClass;
    } else {
        NSAssert(!serviceClass, @"Current Class Not implementation Method or Not exist Service Class");
        return nil;
    }
}

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
