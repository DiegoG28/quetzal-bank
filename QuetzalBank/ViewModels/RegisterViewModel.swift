//
//  RegisterViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 08/07/23.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var errors: [String: String] = [:]
    @Published var successRegister = false

    private var authService = AuthService()
    
    func register(user: UserRegisterRequest) async {
        do {
            if (!userDataIsValid(user)) {
                return
            }
            let response = try await authService.registerUser(user: user)
            DispatchQueue.main.async {
                if (response.status == "Success") {
                    self.successRegister = true
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.message = "Error al registrarse: \(error)"
            }
        }
    }
    
    func userDataIsValid(_ user: UserRegisterRequest) -> Bool {
        var errors: [String: String] = [:]
        if (user.rfc.count != 13) {
            errors["rfc"] = "The RFC must contain 13 characters"
        }
        if (user.name.count > 50 || user.name.isEmpty) {
            errors["name"] = "The name must have 50 or fewer characters"
        }
        if (user.lastname.count > 50 || user.lastname.isEmpty) {
            errors["lastname"] = "The last name must have 50 or fewer characters"
        }
        if(!isValidEmailAddr(strToValidate: user.email)) {
            errors["email"] = "The email is invalid"
        }
        if(user.phone.count != 10) {
            errors["phone"] = "The phone number must contain 10 digits"
        }
        if(user.password.count < 8) {
            errors["password"] = "The password must contain a minimum of 8 characters"
        }
        
        DispatchQueue.main.async {
            self.errors = errors
        }
        
        if (errors.count > 0) {
            return false
        }
        return true
    }


    
    func isValidEmailAddr(strToValidate: String) -> Bool {
      let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1

      let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)  // 2

      return emailValidationPredicate.evaluate(with: strToValidate)  // 3
    }
}
