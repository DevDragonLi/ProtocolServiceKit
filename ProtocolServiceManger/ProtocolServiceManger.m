//
//  ProtocolServiceManger.m
//  ProtocolServiceManger
//
//  Created by DevDragonli on 18/7/2020.
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
        NSAssert(!aProtocol, @"protocol not exist !");
        return nil;
    }
    NSString *serviceClassString = [NSStringFromProtocol(aProtocol) stringByReplacingOccurrencesOfString:@"Protocol" withString:@"Service"];
    
    Class implClass = NSClassFromString(serviceClassString);
    
    if (implClass && [implClass conformsToProtocol:aProtocol]) {
        return implClass;
    } else {
        NSAssert(!implClass, @"Current Class Not implementation Method or Not exist Service Class");
        return nil;
    }
}


@end
