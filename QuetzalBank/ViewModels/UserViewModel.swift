//
//  UserViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var message: String = ""
    private var userService = UserService()
    
    func registerUser(user: User) async {
        do {
            let response = try await userService.registerUser(user: user)
            DispatchQueue.main.async {
                self.user = response.data
                self.message = response.message
            }
        } catch {
            DispatchQueue.main.async {
                self.message = "Error al registrarse: \(error)"
            }
        }
    }
}
