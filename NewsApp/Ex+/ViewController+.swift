//
// UIViewController.swift
//
//
//  Created by youssef on 9/16/18.
//  Copyright © 2018 youssef. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    func viewTapped(viewTapped: UIView, action: Selector) {
        let tap = UITapGestureRecognizer(target: self, action: action)
        viewTapped.addGestureRecognizer(tap)
    }
    
    func customPresent(_ vc: UIViewController) {
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc ,animated: true, completion: nil)
    }
    
    func presentModelyVC(_ vc: UIViewController) {
        vc.definesPresentationContext = true
        if #available(iOS 13, *) {
            // vc.modalPresentationStyle = .fullScreen
        } else {
            vc.modalPresentationStyle = .custom
        }
        present(vc, animated: true, completion: nil)
    }
    
    func push(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushWithTitle(_ vc : UIViewController , title : String) {
        vc.setNavigationItemWithTitle(title: title)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func push(after: Double,_ vc: UIViewController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func popMe() {
        navigationController?.popViewController(animated: true)
    }
    
    func popMe(after: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func popToRoot(after: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + after) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
//    func popToLogin() {
//        for controller in self.navigationController!.viewControllers as Array {
//            if controller.isKind(of: LoginViewController.self) {
//                self.navigationController!.popToViewController(controller, animated: true)
//                break
//            }
//        }
//    }
    
    func navTitle(title: String? = nil) {
        if let title = title, title != "" {
            let titleLabel = UILabel().withTextColor(.white).withText(title)
            titleLabel.font = .mainMedium(of: 20)
            titleLabel.withHeight(25)
            navigationItem.titleView = titleLabel
        }
    }
    
    func configNavBar(title: String? = nil, isLarge: Bool, backgroundColor: UIColor = .white) {
        navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = isLarge
        navigationController?.navigationBar.isOpaque = true
        navigationController?.navigationBar.backgroundColor = backgroundColor
        navigationController?.navigationBar.tintColor = .mainWhite
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func showAlertController(title: String? = "", message: String?, selfDismissing: Bool = true, time: TimeInterval = 2) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
//        alert.view.tintColor = .white
        alert.title = title
        alert.message = message
        
        if !selfDismissing {
            alert.addAction(UIAlertAction(title: "Ok".localize, style: .cancel, handler: nil))
        }
        
        present(alert, animated: true)
        
        if selfDismissing {
            Timer.scheduledTimer(withTimeInterval: time, repeats: false) { t in
                t.invalidate()
                alert.dismiss(animated: true)
            }
        }
    }
    
    func setTitle(_ title: String? = "") {
        navigationItem.title = title
        let attributes: [NSAttributedString.Key: Any] = [.font: UIFont.mainBold(of: 16), .foregroundColor: UIColor.mainBlack]
        let logo = UIImage.logo
        let imageView = UIImageView(image:logo)
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationItem.title = title
        if title == "" {
            navigationItem.titleView = imageView
        }
    }
    
    func transparentNavBar(tintColor: UIColor = .black) {
//        navigationController?.navigationBar.isOpaque = false
//        navigationController?.navigationBar.backgroundColor = .clear
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.view.backgroundColor = .clear
//        navigationController?.navigationBar.tintColor = tintColor
//        setShadowNav()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear


    }
    
    func setStatusBarColor(to color: UIColor = .mainWhite) {
        var statusBar: UIView
        
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
            let frame = keyWindow?.windowScene?.statusBarManager?.statusBarFrame
            statusBar = UIView(frame: frame ?? .zero)
            keyWindow?.addSubview(statusBar)
        } else {
            statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView ?? UIView()
        }
        
        // statusBar.backgroundColor = color
    }
    
    @objc
    func dismissMePlease() {
        dismiss(animated: true, completion: nil)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func setNavigationItem() {

        let image: UIImage = UIImage.back
        let leftButton = UIButton()
        leftButton.setImage(image, for: .normal)
        leftButton.backgroundColor = .mainWhite
        let mySelectedAttributedTitle = NSAttributedString(string: "", attributes: [.font: UIFont.mainMedium(of: 16)])
        leftButton.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
        leftButton.addTarget { [weak self] in
            guard let self = self else {return}
            self.popMe()
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        setShadowNav()
    }
    
    func setNavigationItemWithTitle(title: String) {
        let image: UIImage = UIImage.back
        let leftButton = UIButton()
        leftButton.setImage(image, for: .normal)
        leftButton.backgroundColor = .mainWhite
        let mySelectedAttributedTitle = NSAttributedString(string: "", attributes: [.font: UIFont.mainBold(of: 24)])
        leftButton.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
        leftButton.addTarget { [weak self] in
            guard let self = self else {return}
            self.popMe()
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Montserrat-Bold", size: 24)
        let stackView = UIStackView(arrangedSubviews: [leftButton, titleLabel])
        stackView.spacing = 5
        stackView.alignment = .center
        navigationItem.leftBarButtonItem = .init(customView: stackView)
//        navigationItem.indi
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
//        setShadowNav()
    }
    
    
    func setNavigationItemWithCategoryData(title: String, location: String, reviewsBtnTitle: String) {
        let image: UIImage = UIImage.back
        let leftButton = UIButton()
        leftButton.setImage(image, for: .normal)
        leftButton.backgroundColor = .mainWhite
        let mySelectedAttributedTitle = NSAttributedString(string: "", attributes: [.font: UIFont.mainMedium(of: 16)])
        leftButton.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
        leftButton.addTarget { [weak self] in
            guard let self = self else {return}
            self.popMe()
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "Tajawal-Bold", size: 14)
        
        let locationLabel = UILabel()
        locationLabel.text = location
        locationLabel.textColor = .black
        locationLabel.font = UIFont(name: "Tajawal-regular", size: 12)
        
        let reviewsBtn = UIButton()
        reviewsBtn.setTitle(reviewsBtnTitle, for: .normal)
        reviewsBtn.titleLabel?.font = UIFont(name: "Tajawal-regular", size: 12)
        reviewsBtn.setTitleColor(.hex("#B1B1B1"), for: .normal)

            
        //reviewsBtn.titleLabel?.font = UIFont(name: "Tajawal-regular", size: 8)
        
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, locationLabel, reviewsBtn])
        verticalStackView.spacing = 5
        verticalStackView.axis = .vertical
    
        let stackView = UIStackView(arrangedSubviews: [leftButton, verticalStackView])
        stackView.spacing = 5
        stackView.alignment = .center
        navigationItem.leftBarButtonItem = .init(customView: stackView)
        navigationItem.leftBarButtonItem?.tintColor = .red
//       navigationItem.indi
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        setShadowNav()
    }
    
    var hideNavigation: UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        nav.setNavigationBarHidden(true, animated: true)
        return nav
    }
    func removeAnimate(){
               
        UIView.animate(withDuration: 0.25, animations: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){

            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                  
            self.view.alpha = 0.0;

            }
        }, completion:{(finished : Bool)  in
                  
            if (finished){
                        
                self.view.removeFromSuperview()
            }
        });
    }
    
    private func setShadowNav(){
        navigationController?.navigationBar.backgroundColor = .mainWhite
        navigationController?.navigationBar.layer.masksToBounds = false
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.4
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        navigationController?.navigationBar.layer.shadowRadius = 1
//        navigationItem.setHidesBackButton(true, animated: true)

    }
    
//    func setSkipNavigation(vc: UIViewController? = LoginViewController()) {
//
//        let leftButton = UIButton()
//        leftButton.setTitle("Skip".localize, for: .normal)
//        let mySelectedAttributedTitle = NSAttributedString(string: "", attributes: [.font: UIFont.mainMedium(of: 16)])
//        leftButton.setAttributedTitle(mySelectedAttributedTitle, for: .normal)
//        leftButton.setTitleColor(.mainBlack, for: .normal)
//
//        leftButton.addTarget { _ in
//
//            let vc = vc?.toNavigation
//            AppDelegate.shared.window?.rootViewController = vc
//        }
//
//        let rightImage = UIImage.logo
//        let rightButton = UIButton()
//        rightButton.setImage(rightImage, for: .normal)
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
//        setShadowNav()
//
//    }
//    func setLogoNavTitle(vc: UIViewController? = LoginViewController()) {
//
//        let image = UIImage.logo
//        let imageView = UIImageView(image: image)
//
//        guard let controller = vc else {return}
//        guard let navController = controller.navigationController else {return}
//
//        let _ = navController.navigationBar.frame.size.width
//        let _ = navController.navigationBar.frame.size.height
//
//        imageView.frame = CGRect(x: 0, y: 0, width: 66, height: 29)
//        imageView.contentMode = .scaleAspectFit
//        imageView.center = navController.navigationBar.center
//
//        navigationItem.titleView = imageView
//        setShadowNav()
//
//    }
    func hideNavigationBar(status: Bool) {
        navigationController?.setNavigationBarHidden(status, animated: true)
        let backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
       // navigationItem.backBarButtonItem?.
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    func setProfileRightButton(vc: UIViewController? = LoginViewController()) {
//
//        let viewFN = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
//        viewFN.layer.cornerRadius = viewFN.frame.height / 2
//
//
//        let rightButton = UIButton()
//        let rightImage = UIImage.init(named: "man1")
//        rightButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
//        rightButton.layer.cornerRadius = 16
//        rightButton.clipsToBounds = true
//        rightButton.layer.masksToBounds = true
//
//        rightButton.setImage(rightImage, for: .normal)
//
//        rightButton.addTarget { _ in
//            vc?.push(MainProfileViewController())
//        }
//        viewFN.addSubview(rightButton)
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewFN)
//       
//        setShadowNav()
//
//    }
    
    func setNavigationImage(image: String = "logo", buttonType: NavigationButtonType = .left) {
        
        let barButtonItem = UIBarButtonItem(image:  UIImage(named: image)?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
        if buttonType == .left {
            navigationItem.leftBarButtonItem = barButtonItem
            
        } else if buttonType == .right {
            navigationItem.rightBarButtonItem =  barButtonItem
        } else {
            let image = UIImage(named: image)
            let imageView = UIImageView(image:image)
            navigationItem.titleView = imageView
        }
    }
    
    func setNavigationButtonTitle(title: String,size:CGFloat = 16, buttonType:NavigationButtonType = .left, titleColor: UIColor = .mainColor, action: Selector?) {
        let font = UIFont(name: "Glory", size: size)
        
        let barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        barButtonItem.tintColor = titleColor
        barButtonItem.setTitleTextAttributes([.font: font], for: .normal)
        if buttonType == .left {
            navigationItem.leftBarButtonItem = barButtonItem
        } else {
            navigationItem.rightBarButtonItem = barButtonItem
        }
    }
}

extension UIViewController {
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }
    
    func removeNotificationsObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    var toNavigation: UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
    
    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
                    (self.navigationController?.navigationBar.frame.height ?? 0.0)
            return topBarHeight
        }
    }
}

extension UIViewController {
    func addChildViewController(childViewController: UIViewController, childViewControllerContainer: UIView, comp: (() -> ())? = nil) {
        
        removeChildViewControllers()
        
        addChild(childViewController)
        
        childViewControllerContainer.addSubview(childViewController.view)
        childViewController.view.frame = childViewControllerContainer.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
        comp?()
    }
    
    func removeChildViewControllers() {
        if children.count > 0 {
            for i in  1..<children.count {
                children[i].willMove(toParent: nil)
                children[i].view.removeFromSuperview()
                children[i].removeFromParent()
            }
        }
    }
}


extension UIViewController{
    
    func navigatewithGoogleMap(url: String){
        if let url = URL(string: url) , UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }else{
            let aler = UIAlertController(title: "Warning".localize, message: "You not installed Google Map Please Install it First".localize, preferredStyle: .alert)
            self.presentModelyVC(aler)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                aler.dismissMePlease()
                self.openAppStore(id:"585027354")
            }
        }
    }
    
    func openAppStore(id:String) {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/id\(id)"),
           UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) { (opened) in
                if(opened){
                    print("App Store Opened")
                }
            }
        } else {
            print("Can't Open URL on Simulator")
        }
    }
    
    func navToGoogleMap(sourceLat: Double, sourceLng: Double, destinationLat: Double, destinationLng: Double){
        let url = "http://maps.google.com/maps?saddr=\(sourceLat),\(sourceLng)&daddr=\(destinationLat),\(destinationLng)"
        print(url)
        
        if let url = URL(string: url) , UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }else{
            let aler = UIAlertController(title: "Warning".localize, message: "You not installed Google Map Please Install it First".localize, preferredStyle: .alert)
            self.presentModelyVC(aler)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                aler.dismissMePlease()
                self.openAppStore(id:"585027354")
            }
        }
        
    }
}

extension UIImageView {
    func getImageFrom(gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}

extension UINavigationBar {
    
    
    func getImageFrom(gradientLayer: CAGradientLayer) -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradientLayer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
}


extension UIViewController {
    func alertPermission() {
        let alertController = UIAlertController(title: "Location Permission Required".localize, message: "Please enable location permissions in settings.".localize, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Settings".localize, style: .default, handler: { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
        })
        let cancelAction = UIAlertAction(title: "Cancel".localize, style: UIAlertAction.Style.cancel)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func callingMobile(mobile:String?)  {
        guard let phone = mobile else{return}
        let url: NSURL = URL(string: "TEL://\(phone)")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
}
extension UIViewController {
    func tableDesign(TVC: UITableView) {
        TVC.tableFooterView = UIView()
        TVC.separatorInset = .zero
        TVC.contentInset = .zero
    }
}
import UIKit

extension UIView {
    func setRadius(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    func setShadow(radius: CGFloat){
        self.layer.shadowColor =  #colorLiteral(red: 0.9276052713, green: 0.9383915663, blue: 0.9752113223, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 6, height: 6)
        self.layer.shadowRadius = 13
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = radius
//        let rect = bounds.insetBy(dx: -1, dy: -1)
//        self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
    }
}

public enum NavigationButtonType {
    case left
    case right
    case middle
}

extension UIViewController {
    func openUrl(url: String?) {
        let value = url ?? ""
        guard let _url  = URL(string: value) else{return}
        openURL(url: _url)
    }
    
      @objc func openURL(url:URL){
        
        if UIApplication.shared.canOpenURL(url as URL)
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }else{
            
            //            alertNoButton(message: Messages.appNotInstalled)
            
        }
    }
}
