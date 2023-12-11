//
//  TabBarController.swift
//  PrintingHouse
//
//  Created by Ahmed on 28/02/2023.
//

import UIKit

//class TabBarController: UITabBarController {
//    
//    private let controllers = [
//        AppNavigationController(rootViewController: MainProfileViewController()),
//        AppNavigationController(rootViewController: CartViewController()),
//        AppNavigationController(rootViewController: OffersCollectionViewController(modeType: .defaultMode)),
//        AppNavigationController(rootViewController: SectorsTabViewController()),
//        AppNavigationController(rootViewController: HomeMainViewController())
//    ]
//    
//    let indicator: UIView = {
//        let view = UIView()
//        view.backgroundColor = .mainColor
//        view.frame.size = CGSize(width: 5, height: 5)
//        view.layer.cornerRadius = 2.5
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewControllers = tabItems
//        tabBar.addSubview(indicator)
//        self.delegate = self
//        configTabBarStyle()
//        selectedIndex = 4
////        hideNavigationBar(status: true)
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        animate(index: 4)
//    }
//
//    private func configTabBarStyle() {
//        tabBar.backgroundColor = .white
//        tabBar.unselectedItemTintColor = .hex("#D3D3D3")
//        tabBar.tintColor = .mainColor
//        let font = UIFont.mainMedium(of: 13)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: font], for: .selected)
//    }
//    
//    private lazy var tabItems: [UIViewController] = [
//        generateUITabBarItemFor(controllers[0], name: "profile" , title: "".localized, tag: 0),
//        generateUITabBarItemFor(controllers[1], name: "shopping" , title: "".localized, tag: 1),
//        generateUITabBarItemFor(controllers[2], name: "middle" , title: "".localized, tag: 2),
//        generateUITabBarItemFor(controllers[3], name: "notifi" , title: "".localized, tag: 3),
//        generateUITabBarItemFor(controllers[4], name: "home" , title: "".localized, tag: 4),
//    ]
//    
//    
//    
//    private func animate(index: Int) {
//        let buttons = tabBar.subviews
//            .filter({ String(describing: $0).contains("Button") })
//
//        guard index < buttons.count else {
//            return
//        }
//
//        let selectedButton = buttons[index]
//        UIView.animate(
//            withDuration: 0.25,
//            delay: 0,
//            options: .curveEaseInOut,
//            animations: {
//                let point = CGPoint(
//                    x: selectedButton.center.x,
//                    y: selectedButton.frame.maxY - 1
//                )
//
//                self.indicator.center = point
//            },
//            completion: nil
//        )
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let size = tabBar.frame.size
//        let rect = CGRect(x: 0, y: -2, width: size.width, height: size.height)
//        let shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: 12)
//        
//        tabBar.layer.masksToBounds = false
//        tabBar.shadowImage = UIImage()
//        tabBar.backgroundImage = UIImage()
//        tabBar.layer.shadowOffset = CGSize(width: 0, height: -5)
//        tabBar.layer.shadowRadius = 2
//        tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
//        tabBar.layer.shadowOpacity = 1
//        tabBar.layer.cornerRadius = 18
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner,.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        animate(index: selectedIndex)
//    }
//
//    private func generateUITabBarItemFor(_ controller: UIViewController, name: String, title: String, tag: Int) -> UIViewController {
//        let item = UITabBarItem(title: title, image: UIImage(named: name), tag: tag)
//        item.selectedImage = UIImage(named: "\(name)")
//        controller.tabBarItem = item
//        controllers[tag].delegate = self
//        return controller
//    }
//}

//extension TabBarController: UINavigationControllerDelegate, UITabBarControllerDelegate {
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard  let items = tabBar.items, let index = items.firstIndex(of: item) else { return }
//        animate(index: index)
//    }
//
//    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
//        let tabBarViews = [ HomeMainViewController.self,
//                            CartViewController.self,
//                            OffersCollectionViewController.self,
//                            SectorsTabViewController.self,
//                            MainProfileViewController.self
//        ]
//        tabBar.isHidden = !tabBarViews.contains(where: {viewController.isKind(of: $0)})
//        tabBar.isTranslucent = true
//    }
//}
