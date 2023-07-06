//
//  LoginView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 03/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var user = UserLogInModel(phone: "", password:  "")
    @Binding var isUserLoggedIn: Bool
    @Binding var emailText: String
    
    let gradient = LinearGradient(colors: [Color(.blue), Color(.purple)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            Spacer()            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                CustomTextField(text: $user.phone, placeholder: "Phone number").padding(.bottom, 10)
                CustomTextField(text: $user.password, placeholder: "Password", isSecure: true).padding(.bottom, 20)
                
                Button {
                    Task {
                        await viewModel.logInUser(user: user)
                        if (viewModel.accessToken != nil) {
                            isUserLoggedIn = true
                        }
                    }
                } label: {
                    Text("Iniciar sesión").frame(maxWidth: .infinity)
                }
                .buttonStyle(MainButton())
                .padding(5)
                Text("Forgot your password?").smallFont.padding(.bottom, 30)
                
                Button {
                    
                } label: {
                    Text("Sign up").frame(maxWidth: .infinity)
                }
                .buttonStyle(GradientButton())
                
                
            }
            Spacer()
        }
    }
}

