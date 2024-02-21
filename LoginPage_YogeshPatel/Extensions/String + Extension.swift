//
//  String + Extension.swift
//  LoginPage_YogeshPatel
//
//  Created by csuftitan on 2/20/24.
//

import Foundation

extension String{
    //validate Email
    func validateEmail() -> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr : emailRegex)
    }
    
    func validatePassword(min : Int = 8, max : Int = 12) -> Bool{
        //Minimum 8 characters atleast 1 Alphabet and 1 Number:
        var passRegEx = ""
        if min >= max{
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),}$"
        }else {
            passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),\(max)}$"
        }
        
        return applyPredicateOnRegex(regexStr: passRegEx)
    }
    
    func applyPredicateOnRegex(regexStr : String) -> Bool{
        //trim white space
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        //SELF - matched to itself, MATCHES - tells to evaluate, %@ placeholder which will have regexString
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
