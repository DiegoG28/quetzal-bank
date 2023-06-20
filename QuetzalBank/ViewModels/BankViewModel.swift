//
//  BankViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

class BankViewModel: ObservableObject {
    @Published var banks = [Bank]()
    private var bankService = BankService()
    
    func fetchBanks() async {
        do {
            let banks = try await bankService.getBanks()
            DispatchQueue.main.async {
                self.banks = banks
            }
        } catch {
            print("Error al obtener los datos: \(error)")
        }
    }
}
