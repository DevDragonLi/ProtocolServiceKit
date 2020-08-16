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
        
        let testService: AnyClass = ProtocolServiceKit.ProtocolServiceManger.shared().serviceClass(with: SwiftTestProtocol.self)
        
        testService.demo()
        
    }


}

