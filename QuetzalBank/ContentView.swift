//
//  ContentView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isUserLoggedIn = false
    @State private var emailText = ""

    var body: some View {
        ZStack {
            QColor.background.edgesIgnoringSafeArea(.all)
            if (isUserLoggedIn) {
                BankView(isUserLoggedIn: $isUserLoggedIn).padding()
            } else {
                LoginView(isUserLoggedIn: $isUserLoggedIn, emailText: $emailText).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
