//
//  UIColor+.swift
//  Madares Bus
//
//  Created by youssef on 12/17/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let mainColor = UIColor(named: "MainColor")!
    static let mainWhite = UIColor.white
    static let mainBlack = UIColor.black
    static let blackAlpha = UIColor(named: "BlackAlpha")!
//    static let mainGray = UIColor(named: "Gray")!
    static let borderColor = UIColor(named: "BorderColor")!
    static let silverColor = UIColor(named: "sliver")!
    static let mango = UIColor(named: "mango")!
    static let B1B1B1 = UIColor(named:"#B1B1B1")!
    static let disableColor = UIColor(named: "disableColor")
    static let F9F9F9 = UIColor(named: "#F9F9F9")
    
    static let mainBorderColor = UIColor(named: "BorderColor")
    static let darkPurble = UIColor(named: "Dark purble")
    static let mainGray = UIColor(named : "MainGray")
    static let mainYellow = UIColor(named : "MainYellow")
    static let mainGreen = UIColor(named: "succesColor")
    static let mainRed = UIColor(named : "WrongColor")
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    static func hex(_ hex: String?) -> UIColor {
        var cString: String = hex?.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() ?? ""
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
