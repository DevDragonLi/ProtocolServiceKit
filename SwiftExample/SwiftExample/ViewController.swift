//
//  ViewController.swift
//  SwiftExample
//
//  Created by admin on 16/8/2020.
//  Copyright © 2020 zd. All rights reserved.
//

import UIKit

import ProtocolServiceKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        normalDemo()
    }
    
    func normalDemo() {
        
        let testSerivce : AnyClass = ProService.sharedManger().serviceClass(with:SwiftTestProtocol.self)
    
        testSerivce.demo()
    
    }
    
}

