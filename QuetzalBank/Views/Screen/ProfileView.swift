//
//  ProfileView.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            QColor.background.ignoresSafeArea()
            VStack(alignment: .leading){
                Text("Profile").titleFont.padding(.bottom,10)
                    .foregroundColor(QColor.white)
                
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                
                Text("Name:").bodyFont
                    .foregroundColor(QColor.white).padding(.bottom,10)
                Button(action: {
                    
                }) {
                    Text("Itzel Aixa Ramon Alonzo").bodyFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(QColor.white)
                        .padding(10)
                        .background(QColor.textLabelBackground)
                        .cornerRadius(10)
                      
                }
                .padding(.bottom,20)
                
                Text("Email:").bodyFont
                    .foregroundColor(QColor.white).padding(.bottom,10)
                Button(action: {
                    
                }) {
                    Text(verbatim: "itzelramonf@gmail.com")
                        .bodyFont
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(QColor.textLabelBackground)
                        .cornerRadius(10)
                      
                }
                .padding(.bottom,20)
                
                Text("RFC:").bodyFont
                    .foregroundColor(QColor.white).padding(.bottom,10)
                Button(action: {
                    
                }) {
                    Text("RAAI011218M23").bodyFont
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(QColor.white)
                        .padding(10)
                        .background(QColor.textLabelBackground)
                        .cornerRadius(10)
                      
                }
                .padding(.bottom,20)
                
                Text("Phone:").bodyFont
                    .foregroundColor(QColor.white).padding(.bottom,10)
                Button(action: {
                    
                }) {
                    Text("9982133028").bodyFont
                        //.frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(QColor.white)
                        .padding(10)
                        .background(QColor.textLabelBackground)
                        .cornerRadius(10)
                      
                }
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
