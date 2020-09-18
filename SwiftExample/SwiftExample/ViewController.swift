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
        normalDemo()
    }
    
    func normalDemo() {
        let normalService : AnyClass = ProService.sharedManger().serviceClass(with:SwiftNormalProtocol.self)
        // can tip functions
        normalService.normalFunction()
    }
    
}

