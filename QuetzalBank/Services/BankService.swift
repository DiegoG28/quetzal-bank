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
        
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "token")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, _) = try await URLSession.shared.data(for: request)

    
        let response = try JSONDecoder().decode([Bank].self, from: data)
        return response
    }
}
