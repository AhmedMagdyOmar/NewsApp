//
//  UIImage+.swift
//  Driver App
//
//  Created by youssef on 4/12/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

extension UIImage {
    var template: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
    
    var original: UIImage {
        return self.withRenderingMode(.alwaysOriginal)
    }
}

extension UIImage{
    func toData()->Data?{
        let data = self.jpegData(compressionQuality: 0.5)
        return data
    }
}
extension UIImage {
//    static let homeTab = UIImage(named: "selectedHome")!
//    static let notifyTab = UIImage(named: "Notification")!
//    static let myOrderTab = UIImage(named: "unSelectedCart")!
//    static let profileTab = UIImage(named: "unSelectedOffers")!
//    
//    static let check = UIImage(named: "radioSelected")!
//  
//    static let blackLocation = UIImage(named: "blackLocation")!
//    static let grayLocation = UIImage(named: "grayLocation")!
//    static let current = UIImage(named: "currentLocation")!
//    
//    static let closeEye = UIImage(named: "visibility_off")!
//    static let openEye = UIImage(named: "visibility_on")!
    static let back = UIImage(named: "backLeft")!
//
    static let logo = UIImage(named: "logoPur")!
//    static let vectorLogo = UIImage(named: "WLogo")!
//
//    static let selectedRadioImage = UIImage(named: "grayFillRadio")!
//    static let unSelectedRadioImage = UIImage(named: "grayEmptyRadio")!
//    static let homeFill = UIImage(named: "homeFill")!

}
