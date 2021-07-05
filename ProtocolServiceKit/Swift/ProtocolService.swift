//
//  ProtocolService.swift
//  ProtocolService
//
//  Created by DevDragonLi on 3/12/2020.
//  Copyright © 2020 ServiceRouter. All rights reserved.

//  Swift Project user this Service Class

import Foundation

@objcMembers open class ProtocolService {
    
    static  public func configIgnoreSafeMode(ignoreSafeMode:Bool) {
        ProService.sharedManger().ignoreSafeMode = ignoreSafeMode
    }
    
    static  public func serviceClass(aProtocol:Protocol) -> AnyClass {
        return ProService.sharedManger().serviceClass(with: aProtocol)
    }
    
    static  public func serviceCacheClass(aProtocol:Protocol) -> AnyClass {
        return ProService.sharedManger().serviceClass(withCachedProtocol: aProtocol)
    }
    
    static  public func configProtocolServiceMaps(mapDic:[String:String],nameSpace:String) {
        // ⚠️：I wont want check Parmas this function！！！
        var nameSpaceMapDic = [String:String]()
        mapDic.forEach { key,value in
            let keyValue = nameSpace + "." + key
            let value = nameSpace + "." + value
            nameSpaceMapDic[keyValue] = value
        }
        ProService.sharedManger().configProtocolServiceMaps(withDic:nameSpaceMapDic)
    }
}

