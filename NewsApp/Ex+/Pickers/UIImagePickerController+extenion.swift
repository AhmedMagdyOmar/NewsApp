//
//  UIImagePickerController+extenion.swift
//  Captain One Driver
//
//  Created by Mohamed Akl on 19/06/2022.
//  Copyright © 2022 Mohamed Akl. All rights reserved.
//

import UIKit
import AVFoundation


public protocol ImagePickerDelegate: AnyObject, UIGestureRecognizerDelegate {
    func didSelect(image: UIImage?)
}

open class ImagePicker: NSObject {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?
    
    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        
        super.init()
        
        self.presentationController = presentationController
        self.delegate = delegate
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.modalPresentationStyle = .overFullScreen
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    public func present(from sourceView: UIView, type: UIImagePickerController.SourceType) {
        
        self.pickerController.sourceType = type
        self.presentationController?.modalPresentationStyle = .overFullScreen
        self.presentationController?.present(self.pickerController, animated: true)
        
    }
    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)
        self.delegate?.didSelect(image: image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
      
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        pickerController.navigationBar.barTintColor = .black
        pickerController.navigationBar.isTranslucent = false
        pickerController.navigationBar.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        pickerController.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        ]
    }
    
}

