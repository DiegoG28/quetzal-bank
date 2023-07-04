//
//  ContentView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isUserLoggedIn = false
    var body: some View {
        VStack {
            if (isUserLoggedIn) {
                BankView(isUserLoggedIn: $isUserLoggedIn)
            } else {
                LoginView(isUserLoggedIn: $isUserLoggedIn)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
