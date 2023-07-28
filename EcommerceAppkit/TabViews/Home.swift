//
//  Home.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 28/07/2023.
//

import SwiftUI

struct Home: View {
    let customFont = "Raleway-Regular"
    @StateObject var homeData: HomeViewModel = HomeViewModel()
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            
            VStack(spacing: 15){
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                Capsule()
                    .strokeBorder(Color.gray, lineWidth: 0.8)
                )
                .frame(width: getRect().width / 1.6 )
                .padding(.horizontal, 25)
                
                Text("Order online\ncollect in store")
                    .font(.custom(customFont, size: 28).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                // Products Tab
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 18){
                        ForEach(ProductType.allCases, id: \.self){type in
                            ProductTypeView(type: type)
                            
                        }
                    }
                    .padding(.horizontal, 25)
                }
                .padding(.top, 28)
                
                // Products Page
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 25){
                        ForEach(homeData.filterProducts){product in
                            // Procuct Card View
                            ProductCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.top, 30)
                
                //See more button
                
                Button{
                    homeData.showMoreProductsOnType.toggle()
                } label: {
                    Label{
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("See more")
                    }
                    .font(.custom(customFont, size: 15).bold())
                    .foregroundColor(.purple)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top, 10)
                

            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.quaternary)
        .onChange(of: homeData.productType){ newValue in
            homeData.filterProductType()
        }
        // Preview Issue
        
        .sheet(isPresented: $homeData.showMoreProductsOnType){
            
        } content: {
            MoreProductsView()
        }
    }
    
    @ViewBuilder
    func ProductCardView(product: Product)->some View{
        VStack(spacing: 10){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 2.5, height: getRect().width / 2.5)
            //moving image to the top
                .offset(y: -20)
                .padding(.bottom, -80)
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold )
                .foregroundColor(.purple)
                .padding(.top, 5)
               
        }
        .padding(.horizontal,20)
        .padding(.bottom, 22)
        .background(
            Color.white
                .cornerRadius(25)
        )
    }
    
    @ViewBuilder
    func ProductTypeView(type: ProductType)-> some View {
        Button{
            
            withAnimation{
                homeData.productType = type
            }
            
        } label: {
            Text(type.rawValue)
                .font(.custom(customFont, size: 15))
                .fontWeight(.semibold)
                .foregroundColor(homeData.productType == type ? .cyan : .gray)
                .padding(.bottom, 10)
                .overlay(
                    ZStack{
                        if homeData.productType == type {
                            Capsule()
                                .fill(Color(.purple))
                                .frame(height: 2)
                        }
                    }
                    , alignment: .bottom
                )
            
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



//Exteding View to get sceenbounds
//Already declared
//extension View{
//
//    func getRect()->CGRect{
//        return UIScreen.main.bounds
//    }
//
//}
