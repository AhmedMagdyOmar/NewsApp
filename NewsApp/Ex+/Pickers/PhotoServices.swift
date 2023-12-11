//
//  PhotoServices.swift
//  Driver App
//
//  Created by youssef on 9/15/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation
import MobileCoreServices
import UIKit
// import AVFoundation

class PhotoServices: NSObject {
    
    static let shared = PhotoServices()
    
    var completion: ((UIImage) -> Void)?
    private let imagePicker = UIImagePickerController()
    
    override init() {
        super.init()
        // imagePicker.allowsEditing = true
        // imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    func pickImageFromGalary(on: UIViewController, sourceType: UIImagePickerController.SourceType, completion: @escaping (_ image: UIImage)->()) {
        imagePicker.sourceType = sourceType
        DispatchQueue.main.async {
            on.present(self.imagePicker, animated: true) {
                self.completion = completion
            }
        }
    }
}

// MARK: UIImagePickerControllerDelegate methods
extension PhotoServices: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            DispatchQueue.main.async {
                picker.dismiss(animated: true) {
                    self.completion?(image)
                }
            }
        } else if let image = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                picker.dismiss(animated: true) {
                    self.completion?(image)
                }
            }
        }
//        else if let videoURL = info[.mediaURL] as? URL {
//            DispatchQueue.main.async {
//                picker.dismiss(animated: true) {
//                    self.completion?(videoURL)
//                }
//            }
//        }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
}


class NewPhotoServices: NSObject {
    
    static let shared = NewPhotoServices()
    
    var completion: ((_ file: Any, _ name: String) -> Void)?
    private let imagePicker = UIImagePickerController()
    
    override init() {
        super.init()
        // imagePicker.allowsEditing = true
        // imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.mediaTypes = [kUTTypeMovie as String, kUTTypeImage as String]
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.navigationBar.tintColor = .black
        imagePicker.navigationBar.barTintColor = .blue
        imagePicker.navigationBar.backgroundColor = .red
        imagePicker.navigationBar.isTranslucent = false
        imagePicker.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        imagePicker.mediaTypes = ["public.image"]

    }
    
      func pickImageFromGallery(on: UIViewController, completion: @escaping (_ image: Any, _ name: String)->(), _ sourceType: UIImagePickerController.SourceType = .photoLibrary) {
        imagePicker.sourceType = sourceType
        DispatchQueue.main.async {
            on.present(self.imagePicker, animated: true) {
                self.completion = completion
            }
        }
    }
    
    func showAlert(on view: UIViewController,  completion: @escaping (_ image: Any, _ name: String)->()){

        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera".localize, style: .default, handler: { [weak self] (_) in
            self?.pickImageFromGallery(on: view, completion: completion, .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library".localize, style: .destructive, handler: { [weak self] (_) in
            self?.pickImageFromGallery(on: view, completion: completion)
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localize, style: .cancel, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
}

// MARK: UIImagePickerControllerDelegate methods
extension NewPhotoServices: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var imgName: String = ""
        if let imgUrl = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            
            print(imgName)
            imgName = imgUrl.lastPathComponent
        }
        if let image = info[.editedImage] as? UIImage {
            DispatchQueue.main.async {
                picker.dismiss(animated: true) {
                    self.completion?(image, imgName)
                }
            }
        } else if let image = info[.originalImage] as? UIImage {
            DispatchQueue.main.async {
                picker.dismiss(animated: true) {
                    self.completion?(image, imgName)
                }
            }
        } else if let videoURL = info[.mediaURL] as? URL {
            DispatchQueue.main.async {
                picker.dismiss(animated: true) {
                    self.completion?(videoURL, imgName)
                }
            }
        }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
}

