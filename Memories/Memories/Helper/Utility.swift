//
//  Utility.swift
//  Memories
//
//  Created by Wilson Shakya on 25/12/19.
//  Copyright © 2019 Wilson Shakya. All rights reserved.
//

import Foundation

class Utility {
    static func validateEmail(emailID:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: emailID)
        
    }
    static func validateOTC(otc:String) -> Bool {
        let otcFormat = "^\\d{4}$"
        let otcPredicate = NSPredicate(format:"SELF MATCHES %@", otcFormat)
        return otcPredicate.evaluate(with: otc)
    }
}
