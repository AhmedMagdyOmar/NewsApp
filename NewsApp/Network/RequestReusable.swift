//
// RequestReusable.swift
// SaudiMarch
//
// Created by Aomar on 19/10/2022.
// Copyright © 2022 Aomar. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestReusable: Alamofire.URLRequestConvertible, AnyObject {
    var body: JsonEncadable? { get set }
    func addPathVariables(path: [String])
}

class NetworkRequest: RequestReusable {
    
    init(url: RequestUrl, method: HTTPMethod, encoding: RequestEncodingType = .json) {
        self.urlReq = url
        self.method = method
        self.encoding = encoding
    }
    
    var body: JsonEncadable?
    
    private let urlReq: RequestUrl
    private let method: HTTPMethod
    private let encoding: RequestEncodingType
    private var pathVariables = ""
    
    func addPathVariables(path: [String]) {
        pathVariables = path.joined(separator: "/")
    }
    
    func asURLRequest() throws -> URLRequest {
        let urlString = urlReq.value.appending(pathVariables).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: urlString)!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.value.encode(urlRequest, with: body?.json)
    }
}
