//
//  RegisterView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var user = UserRegisterRequest(name: "Diego", lastname: "Gutiérrez", email: "diegogutcat28@gmail.com", rfc: "dfdlpokiopqw1", phone: "9984186557", password: "dfsdfad", id_bank: 8)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            QColor.background.ignoresSafeArea()
            VStack {
                Image("vector-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 125, height: 125)
                    .padding(.bottom, 20)
                
                Group {
                    Text("Sign up").titleFont.padding(.bottom, 10)            .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("We are excited that you want to be part of our bank! Please tell us more about yourself.").bodyFont.padding(.bottom, 20)            .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Group {
                    TextField("", text: $user.name, prompt:
                                Text("Name")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                    
                    TextField("", text: $user.lastname, prompt:
                                Text("Last name")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                    
                    TextField("", text: $user.email, prompt:
                                Text("Email")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                    
                    TextField("", text: $user.rfc, prompt:
                                Text("RFC")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                    
                    TextField("", text: $user.phone, prompt:
                                Text("Phone number")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.bottom, 10)
                    
                    SecureField("", text: $user.password, prompt:
                                    Text("Password")
                        .foregroundColor(.white).bodyFont)
                    .textFieldStyle(CustomTextFieldStyle())
                }
                
                Spacer()
                
                Button {
                    Task {
                        await viewModel.registerUser(user: user)
                    }                } label: {
                    Text("Continue").frame(maxWidth: .infinity)
                }
                .buttonStyle(MainButton())
            }
            .padding()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
