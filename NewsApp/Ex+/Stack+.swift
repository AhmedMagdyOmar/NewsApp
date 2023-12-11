//
//  Stack+.swift
//  AMNUH-Driver
//
//  Created by Ahmed Elesawy on 1/16/20.
//  Copyright © 2020 Ahmed Elesawy. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    convenience init(views:[UIView],alignment : UIStackView.Alignment , distribution : UIStackView.Distribution,spacing:CGFloat) {
        self.init(frame: .zero)
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
         let _ =  views.map({self.addArrangedSubview($0)})
    }
}

extension UIStackView {
    var makeVertical: UIStackView {
        axis = .vertical
        return self
    }
    
    var makeHorizontal: UIStackView {
        axis = .horizontal
        return self
    }
}
