//
//  AuthService.swift
//  
//
//  Created by Aomar on 03/10/2022.
//  Copyright © 2022 Aomar. All rights reserved.
//

import Foundation
struct UserDataResponseModel {
    var toke : String
}
typealias UserDataModel = UserDataResponseModel

class AuthService {
    
    private init () {
        // UserDefaults.$userData.sink(receiveValue: )
    }
    
    
   static var isUserAuthenticated: Bool {
    //    return UserDefaults.userData?.token != nil
       return true 
    }
}

extension UserDefaults {
    @UserDefault(key: Constants.Keys.userIntroKey, defaultValue: false)
    static var userOnBoardStatus: Bool?

  //  @UserDefault(key: Constants.Keys.userDataKey, defaultValue: nil)
    //static var userData: UserDataModel?
}


