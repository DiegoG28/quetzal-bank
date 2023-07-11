//
//  UserViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation
import LocalAuthentication


class LoginViewModel: ObservableObject {
    private var accountService = AccountService()
    private var authService = AuthService()
    
    @Published var message: String = ""
    
    var session = UserSession.shared
    let defaults = UserDefaults.standard
    
    func login(user: UserLoginRequest) async {
        do {
            let response = try await authService.logInUser(user: user)
            DispatchQueue.main.async {
                if (response.access_token == nil) {
                    self.message = "Incorrect phone number or password"
                    return
                }
                
                self.session.token = response.access_token
                self.defaults.set(response.access_token, forKey: "token")
                self.session.isLoggedIn = true
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
            let response = try await accountService.getAccountData()
            DispatchQueue.main.async {
                self.session.account = response.data
                print(self.session.account ?? "")
            }
        } catch {
            DispatchQueue.main.async {
                self.message = "Error al obtener datos del usuario: \(error)"
                print("Error al obtener datos del usuario: \(error)")
            }
        }
    }
    
    func loginByFaceID() async {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let success = await withCheckedContinuation { continuation in
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Acceder con FaceID") { success, error in
                    if success {
                        continuation.resume(returning: true)
                    } else {
                        print("Auth failed: \(error?.localizedDescription ?? "No error")")
                        continuation.resume(returning: false)
                    }
                }
            }
            self.session.isLoggedIn = true
        }
        print("Biometric unavailable: \(error?.localizedDescription ?? "No error")")
    }
    
    func checkUserStatus() {
        if (self.session.isLoggedIn) {
            Task {
                await fetchAccountData()
            }
        }
    }
}
