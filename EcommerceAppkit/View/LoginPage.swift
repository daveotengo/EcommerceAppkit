//
//  LoginPage.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 27/07/2023.
//

import SwiftUI

struct LoginPage: View {
    let customFont = "Raleway-Regular"
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        VStack{
            VStack{
                Text("Welcome\nback")
                    .font(.custom(customFont, size: 55))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: getRect().height / 3.5 )
                    .padding()
                    .foregroundColor(.white)
                    .background(
                        
                        ZStack{
                          
                            LinearGradient(colors: [
                                Color(CGColor.init(red: 0, green: 200, blue: 400, alpha: 500)),
                                Color(CGColor.init(red: 0, green: 100, blue: 200, alpha: 700))
                                    .opacity(0.8),
                                Color(CGColor.init(red: 10, green: 12, blue: 20, alpha: 700)),
                            ],
                            startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                            
                        Circle()
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .blur(radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .padding(30)
                            
                        Circle()
                                .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                                .frame(width: 23, height: 23)
                                .blur(radius: 3)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding(.leading, 30)
                        
                        }
              
                )
                
            }
            //.frame(height: getRect().height / 3.5)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text("Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "dave@gmail.com", value: $loginData.email, showPassword: $loginData.showPassword)
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "12345", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    
                    if loginData.registerUser{
                        CustomTextField(icon: "lock", title: "Re-Enter Password", hint: "12345", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 30)
                    }
                    
                    
                    
                    //Forgotpassword Button
                    Button{
                        loginData.ForgotPassword()
                    } label: {
                        Text("Forgot Password")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                     // Login Button
                    Button{
                        if loginData.registerUser {
                            loginData.Register()
                        }else{
                            loginData.Login()
                        }
                    } label: {
                        Text("Login")
                            .font(.custom(customFont, size: 17)
                                .bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(.purple)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5 )
                          
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    // Register User Button
                    Button{
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back to Login" : "Create Account" )
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.purple)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity)
                    
                    
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            
            .clipShape(CustomeCorners(corners: [.topLeft, .topRight], radius: 25))
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.purple))
        
        .onChange(of: loginData.registerUser) { newValue in
            
            loginData.email = ""
            loginData.password = ""
            loginData.re_Enter_Password = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
            
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool> ) ->some View{
        VStack(alignment: .leading, spacing: 12){
            Label{
                Text(title)
                    .font(.custom(customFont, size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            }else{
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
           
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            Group{
                if title.contains("Password") {
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(!showPassword.wrappedValue ? "Show" : "Hide")
                            .font(.custom(customFont, size: 13))
                            .foregroundColor(.purple)
                    })
                    .offset(y: 8)
                  
                }
            }
            ,alignment: .trailing
               
        )
    }
    
    
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
