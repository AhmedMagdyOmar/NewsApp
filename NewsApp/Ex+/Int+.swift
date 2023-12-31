//
//  Int+.swift
//  Driver App
//
//  Created by youssef on 4/12/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import Foundation

extension Int {
    var string: String {
        return "\(self)"
    }
}

extension Double {
    var string: String {
        return "\(self)"
    }
}



extension Double{
    func round(to :Int)->Double{
        let divisor = pow(10.0, Double(to))
        return (self * divisor).rounded() / divisor
    }
}

