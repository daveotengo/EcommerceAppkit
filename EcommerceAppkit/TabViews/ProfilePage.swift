//
//  ProfilePage.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 02/08/2023.
//

import SwiftUI

struct ProfilePage: View {
    
    let customFont = "Raleway-Regular"

    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    Text("My Profile")
                        .font(.custom(customFont, size: 28).bold())
                        .frame(maxWidth : .infinity, alignment: .leading)
                    VStack(spacing: 15){
                        Image("Profile_image")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            //.cornerRadius(200)
                            .clipShape(Circle())
                            .offset(y: -30)
                            .padding(.bottom, -30)
                    
                    Text("Rosina Doe")
                        .font(.custom(customFont, size: 16))
                        .fontWeight(.semibold)
                    
                    HStack(alignment: .top,spacing: 10){
                        Image(systemName: "location.north.circle.fill")
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: 180))
                        
                        Text("Adress: 43 Oxford Road\nM13 4GR\nManchester")
                            .font(.custom(customFont, size: 15))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                        
                    
                  }
                    
                    .padding([.horizontal, .bottom])
                    .background(
                        Color.white
                            .cornerRadius(12)
                    
                    )
                    .padding()
                    .padding(.top,40)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4) // Add a shadow for a raised effect

                    
                    // Custom Navigation Links
                    CustomNavigationLink(title:"Edit Profile"){
                        Text("")
                            .navigationTitle("Edit Profile")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white).ignoresSafeArea()
                    }
                    
                    
                    CustomNavigationLink(title:"Shopping Address"){
                        Text("")
                            .navigationTitle("Shopping Address")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white).ignoresSafeArea()
                    }
                    
                    CustomNavigationLink(title:"Order History"){
                        Text("")
                            .navigationTitle("Order History")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white).ignoresSafeArea()
                    }
                    
                    
                    CustomNavigationLink(title:"Cards"){
                        Text("")
                            .navigationTitle("Cards")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.white).ignoresSafeArea()
                    }
                                             
                 CustomNavigationLink(title:"Notification"){
                     Text("")
                         .navigationTitle("Notification")
                         .frame(maxWidth: .infinity, maxHeight: .infinity)
                         .background(Color.white).ignoresSafeArea()
                 }
                    
                }
                
                .padding(.horizontal,22)
                .padding(.vertical,20)
                
                
                
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(.white)
            
            )
        }
    }
    
    @ViewBuilder
    func CustomNavigationLink<Detail: View>(title: String, @ViewBuilder content: @escaping ()->Detail)->some View {
    
        NavigationLink{
            content()
        } label: {
            HStack{
                Text(title)
                    .font(.custom(customFont, size: 17))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                   
            }
            .foregroundColor(.black)
            .padding()
            .background(
                Color.white
                    .cornerRadius(12)
            )
            .padding(.horizontal)
            .padding(.top,10)
            
        }
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4) // Add a shadow for a raised effect

     
    }
    
    
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
