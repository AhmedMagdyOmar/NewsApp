//
//  AppDelegate.swift
//  PrintingHouse
//
//  Created by Ahmed on 21/02/2023.
//

import UIKit
import AlamofireEasyLogger
import GoogleMaps
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    let alamofireLogger = FancyAppAlamofireLogger(prettyPrint: true) {
        print($0)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configWindow()
        iniGoogleMap()
        setLanguage()
        configNavigation()
        IQKeyboardManager.shared.enable = true
        return true
    }
}


extension AppDelegate {
    private func iniGoogleMap() {
        GMSServices.provideAPIKey(Constants.apiGoogleMap)
    }
    
    private func configWindow() {
        window = UIWindow()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
       // window?.rootViewController = TabBarController()//IntroViewController().toNavigation
        //if UserDefaults.userData?.token == nil {
        let vm = NewsHomeViewModelIMP()
        window?.rootViewController = NewsHomeViewController(viewModel: vm).toNavigation
        //}else{
           // window?.rootViewController = TabBarController()

        //}
    }
    
    private func setLanguage(){
       L102Localizer.DoTheMagic()
        print("the lang is \(L102Language.getCurrentLanguage())")
        L102Language.setAppleLanguageTo(lang: L102Language.getCurrentLanguage())
                UIView.appearance().semanticContentAttribute = .forceLeftToRight

    }
    
    
    private func configNavigation() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.backIndicatorImage = #imageLiteral(resourceName: "leftIcon")
        navigationBar.backIndicatorImage?.withRenderingMode(.alwaysTemplate)
        navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "backLeft")
        navigationBar.tintColor = .black
        let  BarButtonItemAppearance = UIBarButtonItem.appearance()
        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)


    }
    
    func appConfig() {
        //IQKeyboardManager.shared.enable = true
    }
}

//    extension UIApplication {
//        var statusBarUIView: UIView? {
//
//            if #available(iOS 13.0, *) {
//                let tag = 3848245
//
//                let keyWindow = UIApplication.shared.connectedScenes
//                    .map({$0 as? UIWindowScene})
//                    .compactMap({$0})
//                    .first?.windows.first
//
//                if let statusBar = keyWindow?.viewWithTag(tag) {
//                    return statusBar
//                } else {
//                    let height = keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
//                    let statusBarView = UIView(frame: height)
//                    statusBarView.tag = tag
//                    statusBarView.layer.zPosition = 999999
//
//                    keyWindow?.addSubview(statusBarView)
//                    return statusBarView
//                }
//
//            } else {
//
//                if responds(to: Selector(("statusBar"))) {
//                    return value(forKey: "statusBar") as? UIView
//                }
//            }
//            return nil
//        }
//    }
    
