//
//  AppWindowManger.swift
//  SaudiMarch
//
//  Created by Youssef on 06/11/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation
import UIKit


enum ResetTypes {
    case logout
    case deleteAccount
}


class AppWindowManger {

    private init() { }
    
    static func restartAppAndRemoveUserDefaults(from: ResetTypes) {
        //UserDefaults.userData = nil
        AppWindowManger.reset()
    }
    
    static func makeTransition(to vc: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }!
            keyWindow.rootViewController = vc
            UIView.transition(with: keyWindow, duration: 0.5, options: .curveEaseIn, animations: nil, completion: nil)
        }
    }
    
    static func reset() {
        DispatchQueue.main.async {
            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }!
           // if Validator.isUserLoggedIn {
               // keyWindow.rootViewController = TabBarController()
            //} else {
                //keyWindow.rootViewController = LoginViewController().toNavigation
            //}
            UIView.transition(with: keyWindow, duration: 0.5, options: .curveEaseIn, animations: nil, completion: nil)

        }
    }
    
    static func goToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }!
           // keyWindow.rootViewController = TabBarController()
            UIView.transition(with: keyWindow, duration: 0.5, options: .curveEaseIn, animations: nil, completion: nil)
        }
    }
}

