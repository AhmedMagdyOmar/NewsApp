//
//  Data.swift
//  SaudiMarch
//
//  Created by Youssef on 03/10/2022.
//  Copyright © 2022 Youssef. All rights reserved.
//

import Foundation

extension Data {
    func decode<T: Decodable>(to model: T.Type) -> T? {
        let decoder = JSONDecoder()
        let decoded = try? decoder.decode(model.self, from: self)
        return decoded
    }
}
