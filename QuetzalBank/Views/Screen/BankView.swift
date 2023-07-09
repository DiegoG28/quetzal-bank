//
//  BankBiew.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct BankView: View {
    @StateObject private var viewModel = BankViewModel()
    
    var session = UserSession.shared
    let defaults: UserDefaults = UserDefaults()
    
    var body: some View {
        List(viewModel.banks, id: \.id) { bank in
            Text(bank.name)
        }.task {
            await viewModel.fetchBanks()
        }
        
        Button("Salir") {
            session.isLoggedIn = false
        }
    }
}
