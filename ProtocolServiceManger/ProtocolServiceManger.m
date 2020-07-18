//
//  ProtocolServiceManger.m
//  ProtocolServiceManger
//
//  Created by admin on 18/7/2020.
//

#import "ProtocolServiceManger.h"

@implementation ProtocolServiceManger

+ (instancetype)sharedManger {
    static dispatch_once_t once;
    static ProtocolServiceManger *sharedManger;
    dispatch_once(&once, ^{
        sharedManger = [[[self class] alloc] init];
    });
    return sharedManger;
}

- (Class)serviceClassWithProtocol:(Protocol *)aProtocol {
    
    if (!aProtocol) {
        NSAssert(aProtocol, @"ServiceIMPClass Not Fount");
        return nil;
    }
    NSString *serviceClassString = [NSStringFromProtocol(aProtocol) stringByReplacingOccurrencesOfString:@"Protocol" withString:@"Service"];
    
    Class implClass = NSClassFromString(serviceClassString);
    
    if (implClass && [implClass conformsToProtocol:aProtocol]) {
        return implClass;
    } else {
        NSAssert(aProtocol, @"Current Class Not implementation Method");
        return nil;
    }
}


@end
