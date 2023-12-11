//
//  ContainerShadowView.swift
//  Wasselna-Client
//
//  Created by rania refaat on 28/11/2022.
//

import UIKit

class ContainerShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.applySketchShadow(color: .black, alpha: 0.29, x: 0, y: 15, blur: 30, spread: 0)
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.viewCornerRadius = 40
    }

}
