//
//  UserService.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

class AccountService {
    
    var session = UserSession.shared
    
    func getAccountData () async throws -> APIResponse<AccountModel> {
        guard let url = URL(string: APIConfig.baseUrl + "/accounts/me") else {
            throw URLError(.badURL)
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(session.token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let response = try JSONDecoder().decode(APIResponse<AccountModel>.self, from: data)
        return response
    }
    
    func getMovements () async throws -> APIResponse<MovementModel> {
        guard let url = URL(string: APIConfig.baseUrl + "/transferences") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(session.token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)

        let response = try JSONDecoder().decode(APIResponse<MovementModel>.self, from: data)
        return response
    }
    
}
