//
//  BankService.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

class BankService {
    func getBanks() async throws -> [Bank] {
        let path = "/banks"
        let banks = try await APIService.shared.get(path: path)
    }
}
