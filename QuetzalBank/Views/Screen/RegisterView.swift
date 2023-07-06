//
//  RegisterView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 19/06/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var user = UserRegisterModel(name: "Diego", lastname: "Gutiérrez", email: "diegogutcat28@gmail.com", rfc: "dfdlpokiopqw1", phone: "9984186557", password: "dfsdfad", id_bank: 8)
    
    var body: some View {
        VStack {
            TextField("Nombre", text: $user.name)
            TextField("Apellido", text: $user.lastname)
            TextField("Email", text: $user.email)
            TextField("RFC", text: $user.rfc)
            TextField("Teléfono", text: $user.phone)
            SecureField("Contraseña", text: $user.password)
            Button("Registrar") {
                Task {
                    await viewModel.registerUser(user: user)
                }
            }
            Text(viewModel.message)
            
            ForEach(viewModel.errors, id: \.self) { error in
                Text(error)
            }
        }
        .padding()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
