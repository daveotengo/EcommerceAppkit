//
//  ContentView.swift
//  EcommerceAppkit
//
//  Created by David Oteng on 26/07/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status {
                MainPage()
            }else{
                OnBoardingPage()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
