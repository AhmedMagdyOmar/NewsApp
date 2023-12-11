//
//  Error+.swift
//  Madares Bus
//
//  Created by youssef on 12/17/19.
//  Copyright © 2019 youssef. All rights reserved.
//

import Foundation

extension NSError {
    class func create(description: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }
}

extension Error {
    func validatorError() -> AppError {
        return self as! AppError
    }
    
    var validatorErrorAssociatedMessage: String {
        return (self as! AppError).errorDescription
    }
}

func Log<T>(_ object: T?, filename: String = #file, line: Int = #line, funcname: String = #function) {
    #if DEBUG
    guard let object = object else { return }
    print("***** \(Date()) \(filename.components(separatedBy: "/").last ?? "") (line: \(line)) :: \(funcname) :: \(object)")
    #endif
}
