//
//  LoginPageModel.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 27/07/2023.
//

import SwiftUI

class LoginPageModel: ObservableObject {
   
    //Login Properties
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    //Register Properties
    @Published var registerUser: Bool = false
    @Published var re_Enter_Password: String = ""
    @Published var showReEnterPassword: Bool = false
    
    @AppStorage("log_Status") var log_Status: Bool = false

    func Login(){
        withAnimation{
            log_Status = true
        }
    }
    
    func Register(){
        withAnimation{
            log_Status = true
        }
    }
    
    func ForgotPassword(){
        
    }

}


