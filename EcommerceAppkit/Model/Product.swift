//
//  Product.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 28/07/2023.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var type: ProductType
    var title: String
    var subtitle: String
    var price: String
    var productImage: String
}

enum ProductType: String, CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}
