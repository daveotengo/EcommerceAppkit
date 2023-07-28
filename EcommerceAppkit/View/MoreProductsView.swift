//
//  MoreProductsView.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 28/07/2023.
//

import SwiftUI

struct MoreProductsView: View {
    let customFont = "Raleway-Regular"
    
    var body: some View {
        VStack{
            Text("More Products")
                .font(.custom(customFont, size: 24))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity,
                       alignment: .topLeading)
                .background(.quaternary).ignoresSafeArea()
            
        }
    }
}

struct MoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductsView()
    }
}
