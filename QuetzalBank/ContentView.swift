//
//  ContentView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var session = UserSession.shared
    
    var body: some View {
        ZStack {
            if (session.isLoggedIn) {
                DashboardView()
            } else {
                NavigationStack {
                    LoginView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
