//
//  ProfileView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = ProfileViewModel()
    @ObservedObject private var session = UserSession.shared
    
    @State private var isEditingName = false
    @State private var isEditingLastname = false
    @State private var isEditingEmail = false
    @State private var isEditingRFC = false
    @State private var isEditingPhone = false
    
    
    @State private var name = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var rfc = ""
    @State private var phone = ""
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            QColor.background.ignoresSafeArea()
            VStack(alignment: .leading){
                Text("Profile").titleFont.padding(.bottom,10)
                    .foregroundColor(QColor.white)
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                
                
                Group {
                    Text("Name:").bodyFont
                        .foregroundColor(QColor.white).padding(.bottom,10)
                    
                    if isEditingName {
                        TextField("", text: $name)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                        .onAppear {
                            name = session.account?.user.name ?? ""
                        }
                        .onReceive(session.$account) { account in
                            name = account?.user.name ?? ""
                        }
                        
                    } else {
                        Button(action: {
                            isEditingName = true
                        }) {
                            Text(session.account?.user.name ?? "").bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                            
                        }
                        .padding(.bottom,20)
                    }
                    
                    
                }
                
                Group {
                    Text("Last name:").bodyFont
                        .foregroundColor(QColor.white).padding(.bottom,10)
                    
                    if isEditingLastname {
                        TextField("", text: $lastname)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                        .onAppear {
                            lastname = session.account?.user.lastname ?? ""
                        }
                        .onReceive(session.$account) { account in
                            lastname = account?.user.lastname ?? ""
                        }
                        
                    } else {
                        Button(action: {
                            isEditingLastname = true
                        }) {
                            Text(session.account?.user.lastname ?? "").bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                            
                        }
                        .padding(.bottom,20)
                    }
                    
                    
                }
                
                Text("Email:").bodyFont
                    .foregroundColor(QColor.white).padding(.bottom,10)
                Group {
                    if isEditingEmail{
                        TextField("", text: $email)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                        .onAppear {
                            email = session.account?.user.email ?? ""
                        }
                        .onReceive(session.$account) { account in
                            email = account?.user.email ?? ""
                        }
                        
                    } else {
                        Button(action: {
                            isEditingEmail = true
                        }) {
                            Text(session.account?.user.email ?? "").bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                            
                        }
                        .padding(.bottom,20)
                    }
                }
                
                
                
                Group {
                    Text("RFC:").bodyFont
                        .foregroundColor(QColor.white).padding(.bottom,10)
                    
                    if isEditingRFC{
                        TextField("", text: $rfc)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                        .onAppear {
                            rfc = session.account?.user.rfc ?? ""
                        }
                        .onReceive(session.$account) { account in
                            rfc = account?.user.rfc ?? ""
                        }
                        
                    } else {
                        Button(action: {
                            isEditingRFC = true
                        }) {
                            Text(session.account?.user.rfc ?? "").bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                            
                        }
                        .padding(.bottom,20)
                    }
                }
                
                Group {
                    Text("Phone:").bodyFont
                        .foregroundColor(QColor.white).padding(.bottom,10)
                    if isEditingPhone{
                        TextField("", text: $phone)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
                        .onAppear {
                            phone = session.account?.user.phone ?? ""
                        }
                        .onReceive(session.$account) { account in
                            phone = account?.user.phone ?? ""
                        }
                        
                    } else {
                        Button(action: {
                            isEditingPhone = true
                        }) {
                            Text(session.account?.user.phone ?? "").bodyFont
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(QColor.white)
                                .padding(10)
                                .background(QColor.textLabelBackground)
                                .cornerRadius(10)
                            
                        }
                        .padding(.bottom,20)
                    }
                }
                
                Spacer()
                Button {
                    Task {
                        if (name.isEmpty) {
                            name = session.account?.user.name ?? ""
                        }
                        
                        if (lastname.isEmpty) {
                            lastname = session.account?.user.lastname ?? ""
                        }
                        
                        if (email.isEmpty) {
                            email = session.account?.user.email ?? ""
                        }
                        
                        if (rfc.isEmpty) {
                            rfc = session.account?.user.rfc ?? ""
                        }
                        
                        if (phone.isEmpty) {
                            phone = session.account?.user.phone ?? ""
                        }
                        
                        let user = UserUpdateRequest(name: self.name, lastname: self.lastname, email: self.email, rfc: self.rfc, phone: self.phone)
                        await viewModel.updateAccountData(accountData: user)
                        dismiss()
                    }
                } label: {
                    Text("Save").frame(maxWidth: .infinity)
                }
                .buttonStyle(MainButton())
                .padding(5)
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
