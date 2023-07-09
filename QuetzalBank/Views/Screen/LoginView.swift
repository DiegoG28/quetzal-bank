//
//  LoginView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 03/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    @State private var user = UserLoginRequest(phone: "", password:  "")
    @State private var showRegisterView = false
    @State private var active = false
    
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
                
                SecureField("", text: $user.password, prompt:
                                Text("Password")
                    .foregroundColor(QColor.white).bodyFont)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.bottom, 20)
                
                Toggle(isOn: $active, label: {
                    Text("Use FaceID to log in").smallFont
                })
                .toggleStyle(CustomToggleStyle())
                
                Button {
                    Task {
                        await viewModel.login(user: user)
                        if (viewModel.accessToken != nil) {
                            isUserLoggedIn = true
                            await viewModel.fetchAccountData()
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

