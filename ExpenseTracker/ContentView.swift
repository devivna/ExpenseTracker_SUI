//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Students on 28.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Home()
                .navigationBarHidden(true)
                    // .toolbar(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
