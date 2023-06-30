//
//  BankService.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

class BankService {
    func getBanks() async throws -> [Bank] {
        guard let url = URL(string: APIConfig.baseUrl + "/banks") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode([Bank].self, from: data)
        return response
    }
}
