//
//  BaseResponseProtocol.swift
//  Youssef
//
//  Created by Aomar on 16/12/2021.
//  Copyright © 2021 Aomar. All rights reserved.
//


import Foundation

protocol BaseResponseProtocol: Codable {
    associatedtype NetworkModel: Codable
    var data: NetworkModel? { get set }
    var isSuccess: Bool { get }
//    var errors: UnknownType<String, [String]>? { get }
    var message: String? { get }
    var status: String? { get }
    var articles: [NewsModel]? {get}
   // var links: Links? {get}
    //var meta: Meta? {get}
}

extension BaseResponseProtocol {
    public var isSuccess: Bool {
//        return true
        return (status == "ok")
    }
}

struct BaseResponse<T: Codable>: BaseResponseProtocol {
   
    var message: String?
    var status: String?
    var data: T?
    var articles: [NewsModel]?
    
}

struct EmptyData: Codable { }
