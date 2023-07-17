//
//  AuthService.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 08/07/23.
//

import Foundation

class AuthService {
    
    func registerUser(user: UserRegisterRequest
    ) async throws -> APIResponse<UserModel> {

            guard let url = URL(string: APIConfig.baseUrl + "/users") else {
                throw URLError(.badURL)
            }
        
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(user)
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                throw URLError(.badServerResponse)
            }

            let decodedResponse = try JSONDecoder().decode(APIResponse<UserModel>.self, from: data)
            return decodedResponse
    }
    
    func logInUser(user: UserLoginRequest
    ) async throws -> APIResponse<UserModel> {
        guard let url = URL(string: APIConfig.baseUrl + "/auth/login") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(user)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard response is HTTPURLResponse else {
                throw URLError(.badServerResponse)
        }
        
        /* guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        } */

        let decodedResponse = try JSONDecoder().decode(APIResponse<UserModel>.self, from: data)
        print(decodedResponse)
        return decodedResponse
    }
}
