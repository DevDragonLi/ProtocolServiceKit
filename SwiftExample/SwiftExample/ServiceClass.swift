//
//  ServiceClass.swift
//  ServiceClass
//
//  Created by DevDragonLi on 3/12/2020.
//  Copyright © 2020 ServiceClass. All rights reserved.
//  

import Foundation
import ProtocolServiceKit

class ServiceClass {
    
    static  public func configIgnoreSafeMode(ignoreSafeMode:Bool) {
        ProService.sharedManger().ignoreSafeMode = ignoreSafeMode
    }
    
    static  public func serviceClass(aProtocol:Protocol) -> AnyClass {
        return ProService.sharedManger().serviceClass(with: aProtocol)
    }
    
    static  public func serviceCacheClass(aProtocol:Protocol) -> AnyClass {
        return ProService.sharedManger().serviceClass(withCachedProtocol: aProtocol)
    }
    
    static  public func configProtocolServiceMaps(mapDic:[String:String]) {
        ProService.sharedManger().configProtocolServiceMaps(withDic:mapDic)
    }
}

