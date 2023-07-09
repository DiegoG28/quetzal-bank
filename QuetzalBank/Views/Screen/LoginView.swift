//
//  LoginView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 03/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @ObservedObject private var registerViewModel = RegisterViewModel()

    
    @State private var user = UserLoginRequest(phone: "", password:  "")
    @State private var showRegisterView = false
    @State private var allowFaceID = false
    
    var defaults = UserDefaults.standard
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
                
                
                if !viewModel.message.isEmpty {
                    Text(viewModel.message).bodyFont.foregroundColor(QColor.errorText)
                }
                
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
                
                if defaults.object(forKey: "token") != nil {
                    Toggle(isOn: $allowFaceID, label: {
                        Text("Use FaceID to log in").smallFont.foregroundColor(QColor.white)
                    })
                    .toggleStyle(CustomToggleStyle())
                }
                
                Button {
                    print(allowFaceID)
                    if (allowFaceID) {
                        defaults.set(allowFaceID, forKey: "allowFaceID")
                        Task {
                            await viewModel.loginByFaceID()
                            viewModel.checkUserStatus()
                        }
                    } else {
                        defaults.removeObject(forKey: "allowFaceID")
                        Task {
                            await viewModel.login(user: user)
                            viewModel.checkUserStatus()
                        }
                    }
                } label: {
                    Text("Sign in").frame(maxWidth: .infinity)
                }
                .buttonStyle(MainButton())
                .padding(5)
                Text("Forgot your password?").smallFont.padding(.bottom, 30).foregroundColor(QColor.white)
                
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
        }.onAppear {
            allowFaceID = defaults.bool(forKey: "allowFaceId")
        }
    }
}

