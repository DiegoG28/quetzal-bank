//
//  UserViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var user: UserModel?
    @Published var message: String = ""
    @Published var errors: [String] = []
    @Published var accessToken: String?
    @Published var account: AccountModel?
    let defaults = UserDefaults.standard
    private var userService = UserService()
    
    func registerUser(user: UserRegisterRequest) async {
        do {
            DispatchQueue.main.async {
                self.errors = []
            }
            if (!userDataIsValid(user)) {
                return
            }
            let response = try await userService.registerUser(user: user)
            DispatchQueue.main.async {
                self.user = response.data
                self.message = response.message ?? "Usuario registrado"
            }
        } catch {
            DispatchQueue.main.async {
                self.message = "Error al registrarse: \(error)"
            }
        }
    }
    
    func logInUser(user: UserLoginRequest) async {
        do {
            let response = try await userService.logInUser(user: user)
            DispatchQueue.main.async {
                self.message = response.message ?? "Se inició sesión correctamente"
                self.accessToken = response.access_token
                self.defaults.set(self.accessToken, forKey: "token")
            }
        } catch {
            DispatchQueue.main.async {
                self.message = "Error al registrarse: \(error)"
                print("Error al registrarse: \(error)")
            }
        }
    }
    
    func fetchAccountData() async {
        do {
            let response = try await userService.getAccountData()
            DispatchQueue.main.async {
                self.account = response.data
                print(self.account ?? "")
            }
        } catch {
            DispatchQueue.main.async {
                self.message = "Error al obtener datos del usuario: \(error)"
                print("Error al obtener datos del usuario: \(error)")
            }
        }
    }
    
    func userDataIsValid(_ user: UserRegisterRequest) -> Bool {
        var errors: [String] = []
        if (user.rfc.count != 13) {
            errors.append("El RFC debe contener 13 caracteres")
        }
        if (user.name.count > 50) {
            errors.append("El nombre debe tener 50 o menos caracteres")
        }
        if (user.lastname.count > 50) {
            errors.append("El apellido debe tener 50 o menos caracteres")
        }
        if(!isValidEmailAddr(strToValidate: user.email)) {
            errors.append("El email es inválido")
        }
        if(user.phone.count != 10) {
            errors.append("El teléfono celular debe contener 10 dígitos")
        }
        if(user.password.count < 8) {
            errors.append("La contraseña debe contener mínimo 8 caracteres")
        }
        if (errors.count > 0) {
            DispatchQueue.main.async {
                self.errors = errors
            }
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
