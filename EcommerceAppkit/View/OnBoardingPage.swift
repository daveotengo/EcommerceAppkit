//
//  OnBoardingPage.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 26/07/2023.
//

import SwiftUI

struct OnBoardingPage: View {
    let customFont = "Raleway-Regular"
    // Showing login Page
    @State var showLoginPage: Bool = false
    
    var body: some View {
        
        VStack{
            Text("Find your\nGadget")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Image("OnBoard")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Button{
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                Text("Get Started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
                    .shadow(color:.black.opacity(0.1), radius: 5,x: 5, y: 5)
                    .foregroundColor(.white)
                
            }
            .padding(.horizontal,30)
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
            
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.white)
        )
        .overlay(
        
            Group{
                
                if showLoginPage {
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        
        )
        
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
//            .previewDevice("iphone 8")
//        OnBoardingPage()
//            .previewDevice("iphone 12")
    }
}

extension View{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
