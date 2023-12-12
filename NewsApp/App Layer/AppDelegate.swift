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
import CoreData

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
    
    
    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "NewsModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
             
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
        window?.rootViewController = ObjectFactoryIMP.mainNewsScreen.viewController.toNavigation
   
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
        IQKeyboardManager.shared.enable = true
    }
}
