//
//  PantallaRecibir.swift
//  QuetzalBank
//
//  Created by imac 07 on 25/05/23.
//

import SwiftUI

struct PantallaRecibir: View {
    @State var Beneficiary: String?
    @State  var CLABE: String?
    var body: some View {
            ZStack(alignment: .topLeading) {
                QColor.background.ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("Receive").titleFont.padding(.bottom,10)
                        .foregroundColor(QColor.white)
                    Text("These are the data you must share to receive money to this account:").bodyFont.padding(.bottom,20)
                        .foregroundColor(QColor.white)
                    Text("Beneficiary:").bodyFont
                        .foregroundColor(QColor.white).padding(.bottom,10)
                    Button(action: {
                        
                    }) {
                        Text("Alex Francisco Torres Hernandez").bodyFont
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(QColor.white)
                            .padding(10)
                            .background(QColor.textLabelBackground)
                            .cornerRadius(10)
                          
                    }
                    .padding(.bottom,20)
                    Text("CLABE:").bodyFont.padding(10)
                        .foregroundColor(QColor.white)
                    Button(action: {
                        
                    }) {
                        Text("1234567890123456678").bodyFont
                            .frame(maxWidth: .infinity, alignment: .leading)
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

struct PantallaRecibir_Previews: PreviewProvider {
    static var previews: some View {
        PantallaRecibir()
    }
}
