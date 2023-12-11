//
//  BaseView.swift
//  Torch
//
//  Created by youssef on 8/11/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

protocol BaseViewProtocol: AnyObject {
    var activityIndicatorView: NVActivityIndicatorView { get }
    func startLoading()
    func stopLoading()
    func showAlert(with message: String, title: AllertTitles)
}

extension BaseViewProtocol where Self: UIViewController {
    func showAlert(with message: String, title: AllertTitles) {
        // showAlertController(message: message)
        AlertViewHandler().showAlert(message: message, title: title)
    }
    
    func startLoading() {
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = UIScreen.main.bounds.center
        activityIndicatorView.startAnimating()
    }
    
    func stopLoading() {
        activityIndicatorView.removeFromSuperview()
        activityIndicatorView.stopAnimating()
    }
}
