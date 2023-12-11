//
//  BaseViewController.swift
//  BaseProject
//
//  Created by youssef on 7/28/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseController: UIViewController, BaseViewProtocol {
    
    lazy var activityIndicatorView = NVActivityIndicatorView(frame: .init(x: 0, y: 0, width: 80, height: 80), type: .ballClipRotate, color: .mainColor, padding: .zero)
    
    var bag = AppBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = self.navigationController?.viewControllers.first
        if vc == self.navigationController?.visibleViewController {
            //Code Here
            print("root")
        } else {
//            setNavigationItem()
        }
    }
    
 
}


extension BaseController {
    
    func handleScreenState<T>(_ state: ScreenState<T>) {
        switch state {
        case .ideal:
            self.stopLoading()
        case .loading:
            self.startLoading()
        case .success(_):
            self.stopLoading()
        case .failure(let error):
            self.stopLoading()
            self.showAlert(with: error, title: .error)
        case .successWith(let message):
            self.stopLoading()
            self.showAlert(with: message, title: .success)
        }
    }
}
