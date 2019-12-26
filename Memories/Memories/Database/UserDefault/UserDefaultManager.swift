//
//  UserDefault.swift
//  Memories
//
//  Created by Wilson Shakya on 24/12/19.
//  Copyright © 2019 Wilson Shakya. All rights reserved.
//

import Foundation

class UserDefaultManager {
    
   static func isLogedIn() -> Bool{
     return UserDefaults.standard.bool(forKey: UserDefaultKey.isLogin.rawValue)
    }
    
   static func setIsLogin(value:Bool)  {
         UserDefaults.standard.set(value, forKey: UserDefaultKey.isLogin.rawValue)
    }
}
