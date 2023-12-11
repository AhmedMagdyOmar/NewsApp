//
//  Storage Manger.swift
//  SaudiMarch
//
//  Created by Aomar on 03/10/2022.
//  Copyright © 2022 Aomar. All rights reserved.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<Value: Codable> {
    
    init(key: String, defaultValue: Value? = nil) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    let key: String
    let defaultValue: Value?
    var container: UserDefaults = .standard
    private let publisher = PassthroughSubject<Value?, Never>()
    
    var wrappedValue: Value? {
        get {
            guard let savedData = container.object(forKey: key) as? Data, let loadedData = savedData.decode(to: Value.self)
            else { return defaultValue }
            return loadedData
        } set {
             
            // Check whether we're dealing with an optional and remove the object if the new value is nil.
            if let optional = newValue as? AnyOptional, optional.isNil {
                container.removeObject(forKey: key)
            } else if let encoded = newValue.toData() {
                container.set(encoded, forKey: key)
            }
            publisher.send(newValue)
        }
    }

    var projectedValue: AnyPublisher<Value?, Never> {
        return publisher.eraseToAnyPublisher()
    }
}

extension UserDefault where Value: ExpressibleByNilLiteral {
    
    /// Creates a new User Defaults property wrapper for the given key.
    /// - Parameters:
    ///   - key: The key to use with the user defaults store.
    init(key: String) {
        self.init(key: key, defaultValue: nil)
    }
}
