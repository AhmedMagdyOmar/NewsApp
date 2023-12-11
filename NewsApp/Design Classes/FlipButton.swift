//
//  FlipButton.swift
//  zoz-client
//
//  Created by rania refaat on 15/02/2023.
//

import UIKit

class FlipButton: UIButton {
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
