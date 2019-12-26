//
//  GetInViewModel.swift
//  Memories
//
//  Created by Wilson Shakya on 24/12/19.
//  Copyright © 2019 Wilson Shakya. All rights reserved.
//

import Foundation

class GetInViewModel {
    
    var getInState : GetInState = .UserExists
    var isUserExist = false
    
    func isUserExists (email:String) -> APIResponse {
        getInState = .OTPVerification
        isUserExist = false
        return .success
    }
    
    func isOTPVerified (otp : String) -> APIResponse {
        getInState = .UserNameSet
        if isUserExist {
             UserDefaultManager.setIsLogin(value: true)
        }
       return .success
    }
    
    func setUserName (userName: String) -> APIResponse {
        getInState = .UserNameSet
        UserDefaultManager.setIsLogin(value: true)
        return .success
    }
    
}

enum GetInState {
    case UserExists
    case OTPVerification
    case UserNameSet
}

enum APIResponse {
    case success
    case error
}
