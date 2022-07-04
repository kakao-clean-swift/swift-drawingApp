//
//  ViewController.swift
//  swift-drawingapp
//
//  Created by JK on 2022/07/04.
//

import UIKit

class DrawViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = ChatClient()
        let manager = ChatManager(client: client)
        manager.login()
    }


}

