//
//  CustomeCorners.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 27/07/2023.
//

import SwiftUI

struct CustomeCorners: Shape {
    
    var corners : UIRectCorner
    var radius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path =  UIBezierPath(roundedRect: rect,byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath )
    }
  
}

