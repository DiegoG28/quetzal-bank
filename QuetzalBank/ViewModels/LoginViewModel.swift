//
//  UserViewModel.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import Foundation
import LocalAuthentication


class LoginViewModel: ObservableObject {
    @Published var account: AccountModel?
    @Published var message: String = ""
    @Published var accessToken: String?
    @Published var isUserLogged: Bool = false
    
    let defaults = UserDefaults.standard
    
    private var accountService = AccountService()
    private var authService = AuthService()
    
    func login(user: UserLoginRequest) async {
        do {
            let response = try await authService.logInUser(user: user)
            DispatchQueue.main.async {
                if (response.access_token == nil) {
                    self.message = "Incorrect credentials."
                    return
                }
                
                self.accessToken = response.access_token
                self.isUserLogged = true
                self.defaults.set(self.accessToken, forKey: "token")
                print(self.isUserLogged)
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
    
    func loginByFaceID() async -> Bool {
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
            return success
        }
        print("Biometric unavailable: \(error?.localizedDescription ?? "No error")")
        return false
    }
    
    func checkUserStatus(isUserLoggedIn: inout Bool) {
        print("Checking status")
        print(self.isUserLogged)
        if (self.isUserLogged) {
            isUserLoggedIn = true
            Task {
                await fetchAccountData()
            }
        }
    }
}
