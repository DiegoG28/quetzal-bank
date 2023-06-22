//
//  APIService.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 21/06/23.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func get<T: Decodable>(path: String) async throws -> T {
        guard let url = URL(string: APIConfig.baseUrl + path) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(T.self, from: data)
                
        return response
    }
}
