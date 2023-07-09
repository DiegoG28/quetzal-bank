//
//  RegisterView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @State private var user = UserRegisterRequest(name: "Diego", lastname: "Gutiérrez", email: "diegogutcat29@gmail.com", rfc: "dfdlpokiopqw2", phone: "9984186558", password: "dfsdfad", id_bank: 2)
    @State var successRegister = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            QColor.background.ignoresSafeArea()
            VStack {
                /*Image("vector-logo")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 125, height: 125)
                 .padding(.bottom, 20)*/
                
                Group {
                    Text("Sign up").titleFont.padding(.bottom, 10)            .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("We are excited that you want to be part of our bank! Please tell us more about yourself.").bodyFont.padding(.bottom, 20)            .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(QColor.white)
                }
                
                Group {
                    
                    Group {
                        if let error = viewModel.errors["name"] {
                            Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("", text: $user.name, prompt:
                                    Text("Name")
                            .foregroundColor(.white).bodyFont)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        if let error = viewModel.errors["lastname"] {
                            Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("", text: $user.lastname, prompt:
                                    Text("Last name")
                            .foregroundColor(.white).bodyFont)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        if let error = viewModel.errors["email"] {
                            Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("", text: $user.email, prompt:
                                    Text("Email")
                            .foregroundColor(.white).bodyFont)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        if let error = viewModel.errors["rfc"] {
                            Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("", text: $user.rfc, prompt:
                                    Text("RFC")
                            .foregroundColor(.white).bodyFont)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        if let error = viewModel.errors["phone"] {
                            Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("", text: $user.phone, prompt:
                                    Text("Phone number")
                            .foregroundColor(.white).bodyFont)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                    }
                    
                    Group {
                        if let error = viewModel.errors["password"] {
                            Text(error).smallFont.foregroundColor(QColor.errorText).padding(.bottom, 5).frame(maxWidth: .infinity, alignment: .leading)
                        }
                        SecureField("", text: $user.password, prompt:
                                        Text("Password")
                            .foregroundColor(.white).bodyFont)
                        .textFieldStyle(CustomTextFieldStyle())
                    }
                    
                }
                
                Spacer()
                
                Button {
                    Task {
                        await viewModel.register(user: user)
                        if (viewModel.successRegister) {
                            successRegister = true
                        }
                    }                } label: {
                        Text("Continue").frame(maxWidth: .infinity)
                    }
                    .buttonStyle(MainButton())
            }
            .padding()
            .navigationDestination(isPresented: $successRegister) {
                LoginView()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
