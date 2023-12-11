//
//  AppError.swift
//  Youssef
//
//  Created by Aomar on 16/12/2021.
//  Copyright © 2021 Aomar. All rights reserved.
//

import Foundation

protocol AppError: LocalizedError {
    var errorDescription: String { get }
}

enum MyAppError: AppError {
    
    case networkError
    case businessError(String)
    case basicError
    public var errorDescription: String {
        switch self {
        case .networkError:
            return Constants.Error.networkErrorMessage
        case .businessError( let error):
            return error
        case .basicError:
            return "Something wrong happened, try again later."
        }
    }
}
