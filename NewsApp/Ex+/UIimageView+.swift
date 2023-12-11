//
//  UIimageView+.swift
//  Captain One
//
//  Created by Mohamed Akl on 19/06/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func load(with url: String?, placeHolder: UIImage? = UIImage.logo, cop: ((_ image: UIImage?) -> Void)? = nil) {
        
        image = placeHolder

        guard let urlString = url else { return }
        guard let url = URL(string: urlString) else { return }
        
        var activityIndicatorView: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            activityIndicatorView = UIActivityIndicatorView(style: .medium)
        } else {
            activityIndicatorView = UIActivityIndicatorView(style: .gray)
        }
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .mainColor
        activityIndicatorView.isHidden = false
        activityIndicatorView.hidesWhenStopped = true
        let options: SDWebImageOptions = [.continueInBackground]
        print("the url is \(url)")
        sd_setImage(with: url, placeholderImage: placeHolder, options: options, progress: nil) {[weak self] (image, error, cache, url) in
            activityIndicatorView.removeFromSuperview()
            if image == nil {
                self?.image = placeHolder
                cop?(nil)
            } else {
                self?.image = image
                cop?(image)
            }
        }
    }
}

extension UIButton {
    func load(with url: String?, cop: ((_ image: UIImage?) -> Void)? = nil) {
        let placeHolder = UIImage.logo
        setBackgroundImage(placeHolder, for: .normal)
        
        guard let urlString = url else { return }
        guard let url = URL(string: urlString) else { return }
        
        var activityIndicatorView: UIActivityIndicatorView
        
        if #available(iOS 13.0, *) {
            activityIndicatorView = UIActivityIndicatorView(style: .medium)
        } else {
            activityIndicatorView = UIActivityIndicatorView(style: .gray)
        }
        addSubview(activityIndicatorView)
        activityIndicatorView.centerInSuperview()
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = .mainColor
        activityIndicatorView.isHidden = false
        activityIndicatorView.hidesWhenStopped = true
        let options: SDWebImageOptions = [.continueInBackground]
        
        sd_setImage(with: url, for: .normal, placeholderImage: placeHolder, options: options, progress: nil) {[weak self] (image, error, cache, url) in
            activityIndicatorView.removeFromSuperview()
            if image == nil {
                self?.setBackgroundImage(placeHolder, for: .normal)
                cop?(nil)
            } else {
                self?.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
                cop?(image)
            }
        }
    }
}

class FlipImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        let language = L102Language.getCurrentLanguage()
        print(language)
        if language == "ar" {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
        }else{
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
