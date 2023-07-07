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
    @State private var showRegisterView = false
    
    @Binding var isUserLoggedIn: Bool
    @Binding var emailText: String
    
    let gradient = LinearGradient(colors: [Color(.blue), Color(.purple)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)
    
    var body: some View {
        ZStack {
            QColor.background.ignoresSafeArea()
            Spacer()
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                

                TextField("", text: $user.phone, prompt:
                            Text("Phone number")
                    .foregroundColor(QColor.white).bodyFont)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom, 10)
                
                SecureField("", text: $user.phone, prompt:
                                Text("Password")
                    .foregroundColor(QColor.white).bodyFont)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom, 20)
                
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
                    showRegisterView = true
                } label: {
                    Text("Sign up").frame(maxWidth: .infinity)
                }
                .buttonStyle(GradientButton())
                
                
            }
            .padding()
            .navigationDestination(isPresented: $showRegisterView) {
                RegisterView()
            }
            Spacer()
        }
    }
}

