//
//  StaggeredGrid.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 01/08/2023.
//

import SwiftUI

struct StaggeredGrid<Content: View, T: Identifiable>: View where T: Hashable
{
    var content: (T) -> Content
    var list: [T]
    var columns: Int
    var showIndicators: Bool
    var spacing: CGFloat

//struct StaggeredGrid<Content: View, T: Identifiable & Hashable>: View {
//    var content: (T) -> Content
//    var list: [T]
//    var columns: Int
//    var showIndicators: Bool
//    var spacing: CGFloat
    
    init(showIndicators: Bool = false, spacing: CGFloat = 10, columns: Int, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
         self.content = content
         self.list =  list
         self.spacing = spacing
         self.columns = columns // Initialize the columns property here
         self.showIndicators = showIndicators
     }

    
    func setUpList() -> [[T]] {        //creating empty sub array of column count...
        var gridArray: [[T]] = Array(repeating: [] , count: columns)
        
        //splitting array for VStack
        var currentIndex = 0
        for object in list{
            gridArray[currentIndex].append(object)
            
            // increasing index count
            // and resetting if overbounds the columns count...
            if currentIndex == (columns - 1){
                currentIndex = 0
            }
            else{
                currentIndex += 1
            }
        }
        
        return gridArray
        
    }
    
    var body : some View {
        //ScrollView(.vertical, showsIndicators: showIndicators){
            HStack(alignment: .top, spacing: 20 ){
                
                ForEach(setUpList(), id: \.self){ columnsData in
                    
                    LazyVStack(spacing: spacing){
                        
                        ForEach(columnsData){ object in
                            content(object)
                            
                        }
                        
                    }
                    .padding(.top, getIndex(values: columnsData) == 1 ? 80 : 0)
                    
                }
                
            }
            .padding(.vertical)
       // }
    }
    
    func getIndex(values: [T]) -> Int {
        let index = setUpList().firstIndex{ t in
            
            return t == values
            
        } ?? 0
        
        return index
    }
    
}

struct StaggeredGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
