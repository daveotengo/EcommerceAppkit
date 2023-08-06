//
//  MainPage.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 27/07/2023.
//

import SwiftUI

struct MainPage: View {
    
    @State var currentTab: Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack{
         
            TabView(selection: $currentTab){
                Home()
                    .tag(Tab.Home)

                
                Text("Liked")
                    .tag(Tab.Liked)
                
                ProfilePage()
                    .tag(Tab.Profile)
                
                Text("Cart")
                    .tag(Tab.Cart)
            }
        
           
            HStack(spacing: 0){
                ForEach(Tab.allCases,id: \.self){tab in
                    Button {
                        currentTab = tab
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .background(Color(.purple)
                                .opacity(0.1)
                                .cornerRadius(5)
                                .blur(radius: 5)
                                .padding(-7)
                                .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .purple : .black.opacity(0.3))
                    }
                    
                }
            }
            .padding([.horizontal, .bottom])
            .padding(.bottom, 10)
            
        }
        .background(.quaternary).ignoresSafeArea()
        
       
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

enum Tab: String, CaseIterable{
    case Home = "house.fill" //Home"
    case Liked = "heart.fill" //Liked
    case Profile = "person.fill" //Profile
    case Cart = "cart.fill" //Cart
}
