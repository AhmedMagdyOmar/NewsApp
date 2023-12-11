//
//  AppTextField.swift
//  New-Zoz-Resturant
//
//  Created by Youssef on 12/01/2023.
//

import UIKit
import Combine

//enum TextFieldType {
//    case name
//    case email
//    case password
//    case phone(count : Int = 8 )
//    case message
//    case subject
//    case title
//    case buildingNumber
//    case floorNumber
//    case apartmentNumber
//    case address
//}

//class AppTextField: SkyFloatingLabelTextField , UITextFieldDelegate {
//    
//    
//    
//    var type: TextFieldType = .name
//    
//    @Published var textValue: String = ""
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        textColor = .hex("#101010")
//        lineColor = .hex("#E9E8F8")
//        selectedLineColor = .hex("#783D73")
//        placeholderColor = .hex("#8E8EA9")
//        tintColor = .hex("#8E8EA9")
//        titleColor = .hex("#8E8EA9")
//        selectedTitleColor = .hex("#8E8EA9")
//        lineHeight = 1
//        errorColor = .red
//        titleFont = .mainRegular(of: 10)
//        font =  .mainMedium(of: 14)
//        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidEnd)
//    }
//
//    
//    @objc
//    func textFieldDidChange(_ textField: UITextField) {
//        text = textField.text
//        
//        if text.isNilOrEmpty {
////             rightView = .none
//            errorMessage = nil
//        } else {
//            //validate()
//        }
//        
//      
//    }
//    
//    func handleRightView(hasError: Bool) {
////        if !hasError {
////            rightViewMode = .always
////            rightView = UIImageView(image: .init(named: "tickcircle"))
////        } else {
////            rightViewMode = .always
////            rightView = UIImageView(image: .init(named: "closecircle"))
////        }
//    }
//    
////    func validate() {
////        do {
////            switch type {
////            case .name:
////                try Validator.validateName(with: text)
////            case .email:
////                try Validator.validateMail(with: text)
////            case .password:
////                try Validator.validatePassword(with: text)
////            case .phone(let count):
////                try Validator.validatePhone(with: text,count: count)
////            case .message:
////                break
////            case .subject:
////                break
////            case .title:
////                try Validator.validateTitle(with: text)
////            case .buildingNumber:
////                try Validator.validateBuildingNumber(with: text)
////            case .floorNumber:
////                try Validator.validateFloorNumber(with: text)
////            case .apartmentNumber:
////                try Validator.validateApartmentNumber(with: text)
////            case .address:
////                try Validator.validateAddress(with: text)
////            }
////
////            handleRightView(hasError: false)
////            errorMessage = nil
////        } catch let error {
////            errorMessage = error.validatorErrorAssociatedMessage
////            handleRightView(hasError: true)
////        }
////    }
//    
//}
