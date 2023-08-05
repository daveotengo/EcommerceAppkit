//
//  HomeViewModel.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 28/07/2023.
//

import SwiftUI

//Using Combine to monitor search field and if user leaves for .5 seconds then starts searching
//to avoid memory issues
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
    @Published var products : [Product] = [
        
        
        
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6: Red", price:"$359", productImage: "apple-watch"),
        
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear: Black", price:"$180", productImage: "headphones2"),
        
        Product (type: .Wearable, title: "Apple Watch", subtitle: "Series 4: Black", price:"$250", productImage: "apple-watch"),
        
        Product (type: .Phones, title: "iPhone 13", subtitle: "A15 - Pink", price: "$699", productImage: "iphone-mac"),
        
        Product (type: .Phones, title: "iPhone 12", subtitle: "A14 - Blue", price: "$599", productImage: "iphone"),
        
        Product (type: .Phones, title: "iPhone 11", subtitle: "A13 - Purple", price: "$499", productImage: "iphonex"),
            
        Product (type: .Phones, title: "iPhone SE 2", subtitle: "A13 - White", price: "$399", productImage: "ear-iphone"),
            
        Product (type: .Laptops, title: "MacBook Air", subtitle: "MI - Gold", price: "$999", productImage: "macbook"),
            
        Product (type: .Laptops, title:"MacBook Pro", subtitle: "M1 - Space Grey", price:"$1299", productImage: "join-computer"),
            
        Product (type: .Tablets, title: "iPad Pro", subtitle: "MI - Silver", price: "$999", productImage: "imac"),
            
        Product (type: .Tablets, title: "iPad Air 4" , subtitle: "A14 - Pink", price: "$699", productImage: "macbook3"),
            
        Product (type: .Tablets, title: "iPad Mini", subtitle: "A15 - Grey", price: "$599", productImage: "ps3-controllers"),
     
        Product (type: .Laptops, title: "iMac", subtitle: "MI - Purple", price: "S1599",productImage: "headphones"),
            
        //----------------------------------------
            
        Product(type: .Wearable, title: "Fitbit Charge 4", subtitle: "Fitness Tracker", price: "$149", productImage: "headphones2"),

        Product(type: .Wearable, title: "Garmin Venu 2", subtitle: "Smartwatch", price: "$399", productImage: "headphones3"),

        Product(type: .Wearable, title: "Xiaomi Mi Band 6", subtitle: "Activity Tracker", price: "$45", productImage: "headphones4"),

        Product(type: .Phones, title: "Samsung Galaxy S21", subtitle: "Snapdragon 888 - Grey", price: "$799", productImage: "microphone"),

        Product(type: .Phones, title: "Google Pixel 6", subtitle: "5G - White", price: "$699", productImage: "micro-phone"),

        Product(type: .Phones, title: "OnePlus 9", subtitle: "Snapdragon 888 - Blue", price: "$699", productImage: "photo-camera"),

        Product(type: .Laptops, title: "Dell XPS 13", subtitle: "Intel Core i7 - Silver", price: "$1299", productImage: "xbox-controllers"),

        Product(type: .Laptops, title: "HP Spectre x360", subtitle: "Intel Core i5 - Rose Gold", price: "$1099", productImage: "motherboard"),

        Product(type: .Tablets, title: "Samsung Galaxy Tab S7", subtitle: "Snapdragon 865 - Black", price: "$649", productImage: "mic"),

        Product(type: .Tablets, title: "Amazon Kindle Paperwhite", subtitle: "E-Reader", price: "$119", productImage: "keyboard")
    
    ]
    
    @Published var filterProducts: [Product] = []
    
    @Published var showMoreProductsOnType: Bool = false
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: {str in
                if str != ""{
                    self.filterProductBySearch()
                }else{
                    self.searchedProducts = nil
                }
                
            })
    }
    
    func filterProductByType(){
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
                .lazy
                .filter{product  in
                    return product.type == self.productType
                }
                .prefix(4)
            DispatchQueue.main.async {
                self.filterProducts = result.compactMap({ product in
                    
                    return product
                    
                })
            }
        }
    }
    
    
    func filterProductBySearch(){
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
                .lazy
                .filter{product  in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }
            
            
            DispatchQueue.main.async {
                self.searchedProducts = result.compactMap({ product in
                    
                    return product
                    
                })
            }
        }
    }
    
}


