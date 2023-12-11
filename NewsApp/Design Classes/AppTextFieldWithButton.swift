//
//  AppTextFieldWithButton.swift
//  zoz-client
//
//  Created by Ahmed Taha on 26/02/2023.
//

import UIKit

//class AppTextFieldWithButton: AppTextField {
//    
//    var buttonPressed: (() -> ())?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setupButton()
//    }
//    
//    @objc private func buttonAction(_ sender: UIButton) {
//        buttonPressed?()
//    }
//    
//    private func setupButton() {
//        let button = UIButton(type: .system)
//        button.setImage(contactsButtonImage, for: .normal)
//        button.tintColor = .hex("#8E8EA9")
//        
//        let view = UIView()
//        view.addSubview(button)
//        button.fillSuperview(padding: .init(0, side: 10))
//        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
//        rightViewMode = .always
//        rightView = view
//    }
//    
//    private var contactsButtonImage: UIImage {
//        return (UIImage(named: "location")?.withRenderingMode(.alwaysTemplate))!
//    }
//    
//}
