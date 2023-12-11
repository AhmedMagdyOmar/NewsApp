//
//  ContactUsErrorViewController.swift
//  Captain One Driver
//
//  Created by mahroUS on 15/10/2565 BE.
//  Copyright © 2565 BE Mohamed Akl. All rights reserved.
//

import UIKit

class ContactUsErrorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    
    @IBAction func ccontactUsButton(_ sender: Any) {
//        let vc = ContactUSViewController()
//        push(vc)
    }
    
    @IBAction func tryAgainButton(_ sender: Any) {
     
        self.removeAnimate()
    }
    
    @IBAction func disMissViewBtn(_ sender: Any) {
        self.removeAnimate()
    }
}

