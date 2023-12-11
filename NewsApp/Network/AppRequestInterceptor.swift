//
//  AppRequestInterceptor.swift
//  Aomar
//
//  Created by Aomar on 7/14/22.
//  Copyright © 2022 Aomar. All rights reserved.
//

import Foundation
import Alamofire

class AppRequestInterceptor: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        //        urlRequest.setValue("en", forHTTPHeaderField: "Accept-Language")
        //        urlRequest.setValue("os", forHTTPHeaderField: "ios")
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue(L102Language.getCurrentLanguage(), forHTTPHeaderField: "Accept-Language")
        
         let token = "57c64a59ec4649afbbada24f5244a4f3" //UserDefaults.userData?.token {
//            let token = "20|2apPMt1UjN3d9XhVqPaOlLunWBoj1AAFm4InpMVr"
       // let token = "1|5kLA8aOIMg5ImcRdjd6k7IT0oigHAr4N6Hi03W6r"
//        let token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3dhc3NlbG5hLnBocHY4LmFhaXQtZC5jb20vYXBpL2NsaWVudC9sb2dpbiIsImlhdCI6MTY3Mzg2MjAzNSwiZXhwIjoxNzA1Mzk4MDM1LCJuYmYiOjE2NzM4NjIwMzUsImp0aSI6IjVraXdWS1d3WlJhT1p1Y1ciLCJzdWIiOiIxNjEiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.h23yIwI3kiCyYcgEdF8mdn24hntzwOSgbA2qVPUpPsI"
            urlRequest.setValue("apiKey= \(token)", forHTTPHeaderField: "Authorization")
            
            
            completion(.success(urlRequest))
       }
        
        func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
            let statusCode = request.response?.statusCode
            if statusCode == 401 {
                AppWindowManger.restartAppAndRemoveUserDefaults(from: .logout)
                completion(.doNotRetryWithError(MyAppError.basicError))
            } else {
                completion(.doNotRetryWithError(MyAppError.networkError))
            }
        }
    
}

//func saveUserData(data: UserDataResponseModel) {
//    let token = UserDefaults.userData?.token
//    var userData = data
//    userData.token = token
//    UserDefaults.userData = userData
//}
