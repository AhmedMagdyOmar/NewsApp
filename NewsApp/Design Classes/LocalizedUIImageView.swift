//
//  LocalizedUIImageView.swift
//  Bro-Driver
//
//  Created by Ahmed Taha on 20/02/2023.
//

import UIKit
//import MOLH

class LocalizedUIImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.image = self.image?.flipIfNeeded()
    }
}

extension UIImage {
    func flippedImage() -> UIImage?{
        if let _cgImag = self.cgImage {
            let flippedimg = UIImage(cgImage: _cgImag, scale:self.scale , orientation: UIImage.Orientation.upMirrored)
            return flippedimg
        }
        return nil
    }
    
//    func flipIfNeeded() -> UIImage? {
////        if MOLHLanguage.isRTLLanguage() {
////            return self.flippedImage()
////        }
////        return self
//    }
}
