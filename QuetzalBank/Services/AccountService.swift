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
    
    func updateAccountData (accountData: UserUpdateRequest) async throws -> Void {
        guard let url = URL(string: APIConfig.baseUrl + "/users") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("Bearer \(session.token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(accountData)
        
        print(accountData)

        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        print(response)
        
        guard response is HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
    }
    
    func getMovements () async throws -> APIResponse<[MovementModel]> {
        guard let url = URL(string: APIConfig.baseUrl + "/transferences") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(session.token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)

        let response = try JSONDecoder().decode(APIResponse<[MovementModel]>.self, from: data)
        print(response)
        return response
    }
    
    func getMovementDetail(movementId: Int) async throws -> APIResponse<MovementDetailModel> {
        guard let url = URL(string: APIConfig.baseUrl + "/transferences/\(movementId)") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(session.token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, _) = try await URLSession.shared.data(for: request)

        let response = try JSONDecoder().decode(APIResponse<MovementDetailModel>.self, from: data)
        print(response)
        return response
    }
    
    func transfer (transferRequest: TransferRequest) async throws -> APIResponse<TransferResponse> {
        guard let url = URL(string: APIConfig.baseUrl + "/transferences") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Bearer \(session.token ?? "")", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(transferRequest)

        
        let (data, response) = try await URLSession.shared.data(for: request)

        
        guard response is HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        let decodedResponse = try JSONDecoder().decode(APIResponse<TransferResponse>.self, from: data)
        
        print(decodedResponse)
        
        return decodedResponse
    }

}
