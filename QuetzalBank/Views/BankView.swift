//
//  BankBiew.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct BankView: View {
    @StateObject private var viewModel = BankViewModel()
    
    var body: some View {
        List(viewModel.banks, id: \.id) { bank in
            Text(bank.name)
        }.task {
            await viewModel.fetchBanks()
        }
    }
}

struct BankView_Previews: PreviewProvider {
    static var previews: some View {
        BankView()
    }
}
