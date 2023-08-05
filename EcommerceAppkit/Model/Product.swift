//
//  Product.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 28/07/2023.
//

import Foundation

struct Product: Identifiable, Hashable{
    var id = UUID()
    var type: ProductType
    var title: String
    var subtitle: String
    var price: String
    var productImage: String
}

enum ProductType: String, CaseIterable, Hashable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

//func hash(into hasher: inout Hasher) {
//        // Combine the hash values of the properties to create a unique hash for each instance
//        hasher.combine(id)
//        hasher.combine(type)
//        hasher.combine(price)
//        hasher.combine(subtitle)
//        hasher.combine(productImage)
//        // Add other properties if needed
//    }
