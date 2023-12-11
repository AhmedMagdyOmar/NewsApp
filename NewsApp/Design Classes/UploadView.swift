//
//  UploadView.swift
//  New-Zoz-driver
//
//  Created by Youssef on 16/01/2023.
//

import UIKit

class UploadView: ViewWithButtonEffect {
    
    var imageData: Data? {
        didSet {
            if imageData != nil {
                imageView?.image = .init(named: "tickcircle")
            } else {
                imageView?.image = .init(named: "tickcircle")
            }
        }
    }
    
    var vc: UIViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        target = {[weak self] in
            guard let vc = self?.vc else { return }
            PhotoServices.shared.pickImageFromGalary(on: vc, sourceType: .photoLibrary) { image in
                self?.imageData = image.toData()
            }
        }
    }
}
