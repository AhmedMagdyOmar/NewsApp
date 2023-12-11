//
//  Font.swift
//  SaudiMarch
//
//  Created by Youssef on 9/29/22.
//  Copyright © 2022 Youssef. All rights reserved.
//

import UIKit

extension UIFont {
    static func mainRegular(of size: CGFloat) -> UIFont {
        var name = ""
        if L102Language.currentAppleLanguage() == "ar" {
           // name = ArabicFont.regular.name
        } else {
            //name = EnglishFont.regular.name
        }
        guard let font = UIFont(name: name , size: size) else { return .systemFont(ofSize: size)}
       
        return font
    }
    
    static func mainBold(of size: CGFloat) -> UIFont {
        var name = ""
        if L102Language.currentAppleLanguage() == "ar" {
           // name = ArabicFont.bold.name
        } else {
            //name = EnglishFont.bold.name
        }
        guard let font = UIFont(name: name , size: size) else { return .systemFont(ofSize: size)}
       
        return font
    }
    
    static func mainSemiBold(of size: CGFloat) -> UIFont {
        var name = ""
        if L102Language.currentAppleLanguage() == "ar" {
            //name = ArabicFont.semiBold.name
        } else {
           // name = EnglishFont.semiBold.name
        }
        guard let font = UIFont(name: name , size: size) else { return .systemFont(ofSize: size)}
       
        return font
    }
    
    static func mainMedium(of size: CGFloat) -> UIFont {
        var name = ""
        if L102Language.currentAppleLanguage() == "ar" {
           // name = ArabicFont.medium.name
        } else {
          //  name = EnglishFont.medium.name
        }
        guard let font = UIFont(name: name , size: size) else { return .systemFont(ofSize: size)}
       
        return font
    }
}
