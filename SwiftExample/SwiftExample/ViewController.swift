//
//  ViewController.swift
//  SwiftExample
//
//  Created by Devdragonli on 16/8/2020.
//  Copyright © 2020 Devdragonli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        ProtocolServiceNormalDemo()
        // ProtocolServiceMapDemo()
    }
    
    func ProtocolServiceNormalDemo() {
        
        // 1.1 use
        let normalService : AnyClass = ServiceClass.serviceClass(aProtocol: SwiftNormalProtocol.self)
        // 1.2 Xcode can tip functions
        normalService.normalFunction()
        
        // 1.3 cache Service Class
        let normalCacheServiceDemo : AnyClass = ServiceClass.serviceCacheClass(aProtocol: SwiftNormalProtocol.self)
        normalCacheServiceDemo.normalFunction()
        
        // 2.0 recommend most use Example
        let normalCacheService : AnyClass = ServiceClass.serviceCacheClass(aProtocol: SwiftNormalProtocol.self)
        
        normalCacheService.normalFunction()
        
    }
    
    func ProtocolServiceMapDemo() {
        // Map 涉及空间命名问题，后续版本再完善支持!
        ServiceClass.configProtocolServiceMaps(mapDic: ["SwiftExample.MapExampleProtocol":"SwiftExample.MapUnRuleClass"])
    }
    
}

