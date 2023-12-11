//
//  NetworkState.swift
//  Youssef
//
//  Created by Aomar on 7/14/22.
//  Copyright © 2022 Aomar. All rights reserved.
//

import Foundation

enum NetworkState<R: Codable> {
    case success(BaseResponse<R>?)
    case anyModelSuccess(R?)
    case fail(AppError)
    
    var data: BaseResponse<R>? {
        switch self {
            case .success(let data):
                return data
            default: return nil
        }
    }
    
    var error: AppError? {
        switch self {
            case .fail(let error):
                return error
            default: return nil
        }
    }
    
    var isSuccess: Bool {
        return data != nil
    }
    
    init(_ response: BaseResponse<R>) {
        if response.isSuccess {
            self = .success(response)
        } else if let error = response.message {
            self = .fail(MyAppError.businessError(error))
        } else {
            self = .fail(MyAppError.networkError)
        }
    }
    
    init(_ response: R?) {
        if let response {
            self = .anyModelSuccess(response)
        } else {
            self = .fail(MyAppError.networkError)
        }
    }
}
