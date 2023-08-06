//
//  SearchView.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 01/08/2023.
//

import SwiftUI

struct SearchView: View {
    
    //var animation: Namespace.ID
    let customFont = "Raleway-Regular"

    @EnvironmentObject var homeData: HomeViewModel
    
    // Activating Text Field with the help of focus state
    @FocusState var startTF: Bool
    var body: some View {
        VStack(spacing: 0){
            // Searh Bar
            HStack(spacing: 20){
                
                //Close Button
                Button{
                    withAnimation{
                        homeData.searchActivated = false
                    }
                    homeData.searchText = ""
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                        .foregroundColor( .black.opacity(0.7))
                }
                
                //Search Bar
                
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.purple, lineWidth: 1.5)
                )
                //.matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
            .padding(.bottom, 10)
            
        // Showing Progress if Searching
            
            if let products = homeData.searchedProducts{
                if products.isEmpty{
                    
                    //No Results Found
                    VStack(spacing: 10){
                        Image("Notfount")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.top, 60)
                        Text("Item Not Found")
                            .font(.custom(customFont, size: 22).bold())
                        
                        Text("Try a more generic search term or try looking for alternative products.")
                            .font(.custom(customFont, size: 16 ) )
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                    }
                    .padding( )
                    
                }else{
                    // Filter Results
                    ScrollView(.vertical, showsIndicators: false){
                        
                        if products.count == nil{
                            Text("Found \(homeData.products.count) results")
                                .font(.custom(customFont, size: 24).bold())
                                .padding(.vertical)
                        }
                        
                        //Staggered Grid
                        VStack(spacing: 0){
                            
                            //Found Text ...
                            Text("Found \(products.count) results")
                                .font(.custom(customFont, size: 24).bold())
                                .padding(.vertical)
                            
                            //Staggered Grid
                            
                            StaggeredGrid( spacing: 20,columns: 2, list: products) { product in
                            
                            //Card View ..
                              
                                    ProductCardView(product: product)
                                    //.padding()
                                    
                            
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()

                            
                        }
                        .padding()
                        
                        
                    }
                }
            }else{
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1 )
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background(
            Color(.quaternaryLabel)
                .ignoresSafeArea()
        )
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                startTF = true
            }
        }
    }
    
    @ViewBuilder
    func ProductCardView(product: Product)->some View{
        VStack(spacing: 0){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 3.5, height: getRect().width / 3.5)
                //moving image to the top
                //.offset(y: -10)
                //.padding(.bottom, -10)
            
            Text(product.title)
                .font(.custom(customFont, size: 18))
                .fontWeight(.semibold)
                //.padding(.top,5)
            
            Text(product.subtitle)
                .font(.custom(customFont, size: 14))
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.custom(customFont, size: 16))
                .fontWeight(.bold )
                .foregroundColor(.purple)
                .padding(.top, 5)
               
        }
        .padding()
        .padding(.horizontal,10)
        .padding(.bottom, 22)
//        .background(
//            Color.white
//                .cornerRadius(25)
//        )
        //.padding(.top, 10)
        
        .background(
               Color.white
                   .cornerRadius(25)
                   .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4) // Add a shadow for a raised effect
           )
    }
    
    
}

struct SearchView_Preview : PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(HomeViewModel())
    }
}
