//
//  ViewController.swift
//  SwiftExample
//
//  Created by Devdragonli on 16/8/2020.
//  Copyright © 2020 Devdragonli. All rights reserved.
//

import UIKit
import ProtocolServiceKit.ProService

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        ProtocolServiceNormalDemo()
        ProtocolServiceMapDemo()
    }
    
    func ProtocolServiceNormalDemo() {
        
        // 1.1 use
        let normalService : AnyClass = ProtocolService.serviceClass(aProtocol: SwiftNormalProtocol.self)
        
        // 1.2 Xcode can tip functions
        
        normalService.normalFunction()
        
        // 1.3 cache Service Class
        let normalCacheServiceDemo : AnyClass = ProtocolService.serviceCacheClass(aProtocol: SwiftNormalProtocol.self)
        normalCacheServiceDemo.normalFunction()
        
        // 2.0 recommend most use Example
        let normalCacheService : AnyClass = ProtocolService.serviceCacheClass(aProtocol: SwiftNormalProtocol.self)
        
        normalCacheService.normalFunction()
        
    }
    
    func ProtocolServiceMapDemo() {
        ProtocolService.configProtocolServiceMaps(mapDic: ["MapExampleProtocol":"MapUnRuleClass"], nameSpace: nil)
        ProtocolService.configProtocolServiceMaps(mapDic: ["MapExampleProtocol":"MapUnRuleClass"], nameSpace: "SwiftExample")
        let mapCacheService : AnyClass = ProtocolService.serviceCacheClass(aProtocol: MapExampleProtocol.self)
        mapCacheService.MapExampleFunction()
    }
    
}

