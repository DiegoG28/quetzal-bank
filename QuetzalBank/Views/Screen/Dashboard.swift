//
//  DashboardView.swift
//  QuetzalBank
//
//  Created by IMac_10_Invitado on 06/07/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack{
            QColor.background.ignoresSafeArea()
            VStack {
                HStack{
                    VStack{
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 47, height: 47)
                        Text("Welcome, Itzel").smallFont
                    }
                    Spacer()
                    VStack {
                        Text("Balance").smallFont
                        Text("$35,000.00").subtitleFont
                    }
                }
                //Card
                VStack {
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Image(systemName: "eye.slash").foregroundColor(QColor.white)
                            }
                            HStack{
                                Spacer()
                                Text("$50,000.00")
                                    .titleFont
                            }
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("0000 0000 0000 0000")
                                        .bodyFont
                                }
                                HStack {
                                    Text("00/00")
                                        .bodyFont
                                    Text("000").bodyFont
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .padding()
                    HStack{
                        Text("Itzel Aixa Ramon Alonzo").padding(10)
                        Spacer()
                    }
                    .background(QColor.white)
                }
                .background(QColor.gradientText)
                
                //Botones
                HStack {
                    VStack {
                        Button ( action: {
                        }) {
                            Image(systemName: "arrow.up")
                        }.buttonStyle(IconButton())
                        Text("Transfer").smallFont
                    }
                    Spacer()
                    VStack {
                        Button ( action: {
                        }) {
                            Image(systemName: "arrow.down")
                        }.buttonStyle(IconButton())
                        Text("Receive").smallFont
                    }
                    Spacer()
                    VStack {
                        Button ( action: {
                        }) {
                            Image(systemName: "arrow.left.arrow.right")
                        }.buttonStyle(IconButton())
                        Text("Movements").smallFont
                    }
                }
                //Movimientos recientes
                VStack {
                        HStack{
                            VStack(alignment: .leading){
                                Text("AppleStore").smallFont
                                Text("5:09").smallFont
                            }
                            Spacer()
                            Text("-$9,546.00").smallFont
                        }
                        .padding(10)
                        .cornerRadius(8)
                        .background(QColor.textFieldBackground)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("AppleStore").smallFont
                            Text("5:09").smallFont
                        }
                        Spacer()
                        Text("-$9,546.00").smallFont
                    }
                    .padding(10)
                    .cornerRadius(8)
                    .background(QColor.textFieldBackground)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("AppleStore").smallFont
                            Text("5:09").smallFont
                        }
                        Spacer()
                        Text("-$9,546.00").smallFont
                    }
                    .padding(10)
                    .cornerRadius(8)
                    .background(QColor.textFieldBackground)
                }
                Spacer()
            }.padding()
        }
    
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
