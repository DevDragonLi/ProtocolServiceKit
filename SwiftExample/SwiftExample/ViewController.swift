//
//  ViewController.swift
//  SwiftExample
//
//  Created by Devdragonli on 16/8/2020.
//  Copyright © 2020 Devdragonli. All rights reserved.
//

import UIKit

import ProtocolServiceKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        ProtocolServiceDemo()
    }
    
    func ProtocolServiceDemo() {
        // 1. use
        let normalService : AnyClass = ProService.sharedManger().serviceClass(with:SwiftNormalProtocol.self)
        // 2. can tip functions （AnyClass）
        normalService.normalFunction()
        
        let mapService : AnyClass = ProService.sharedManger().serviceClass(with: MapExampleProtocol.self)
        mapService.MapExampleFunction()
        
        // 3. project most use
        let normalCacheService : AnyClass = ProService.sharedManger().serviceClass(withCachedProtocol: SwiftNormalProtocol.self)
        normalCacheService.normalFunction()
        
        // 3.1 speed return normalCacheServiceDemo instance
        let normalCacheServiceDemo : AnyClass = ProService.sharedManger().serviceClass(withCachedProtocol: SwiftNormalProtocol.self)
        normalCacheServiceDemo.normalFunction()
        
    }
    
}

