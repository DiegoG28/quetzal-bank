//
//  LoginView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 03/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var user = UserLogInModel(phone: "9984186557", password:  "")
    @Binding var isUserLoggedIn: Bool
    var body: some View {
        VStack {
            TextField("Teléfono", text: $user.phone)
            TextField("Contraseña", text: $user.password)
            Button("Iniciar sesión") {
                Task {
                    await viewModel.logInUser(user: user)
                    if (viewModel.accessToken != nil) {
                        isUserLoggedIn = true
                    }
                }
            }
            Text(viewModel.message)
        }
    }
}

