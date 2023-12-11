//
//  PasswordTextField.swift
//  Wasselna-New
//
//  Created by Youssef on 14/11/2022.
//

import UIKit

//class PasswordTextField: AppTextField {
//    
//    private var passwordButtonImage: UIImage {
//       if isSecureTextEntry {
//           return (UIImage(named: "eyeslash")?.withRenderingMode(.alwaysOriginal))!
//        } else {
//            return (UIImage(named: "eye")?.withRenderingMode(.alwaysOriginal))!
//        }
//    }
//    
//    public override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        isSecureTextEntry = true
//        
//        let showPasswordButton = UIButton(type: .system)
//        showPasswordButton.setImage(passwordButtonImage, for: .normal)
//        
//        let view = UIView()
//        view.addSubview(showPasswordButton)
//        showPasswordButton.fillSuperview(padding: .init(0, side: 10))
//        
//        showPasswordButton.addTarget(self, action: #selector(showPasswordButtonAction(_:)), for: .touchUpInside)
//        rightViewMode = .always
//        rightView = view
//    }
//    
//    @objc private func showPasswordButtonAction(_ sender: UIButton) {
//        isSecureTextEntry.toggle()
//        sender.setImage(passwordButtonImage, for: .normal)
//    }
//}
