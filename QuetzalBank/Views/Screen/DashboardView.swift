//
//  DashboardView.swift
//  QuetzalBank
//
//  Created by IMac_10_Invitado on 06/07/23.
//

import SwiftUI

extension String {
    func split(every chunkSize: Int) -> [String] {
        stride(from: 0, to: self.count, by: chunkSize).map {
            let start = self.index(self.startIndex, offsetBy: $0)
            let end = self.index(start, offsetBy: chunkSize, limitedBy: self.endIndex) ?? self.endIndex
            return String(self[start..<end])
        }
    }
}

struct RoundedCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        return Path(path.cgPath)
    }
}

struct DashboardView: View {
    @ObservedObject var session = UserSession.shared
    let numberFormatter: NumberFormatter
    let gradient = LinearGradient(colors: [Color(.blue), Color(.purple)],
                                  startPoint: .topLeading,
                                  endPoint: .bottomTrailing)

    init() {
            numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
    }

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
                        Text("Welcome, \(session.account?.user.name ?? "")").smallFont.foregroundColor(QColor.white)
                    }
                    Spacer()
                    VStack {
                        Text("Balance").smallFont.foregroundColor(QColor.white)
                        Text("$\(numberFormatter.string(from: NSNumber(value: session.account?.balance ?? 0)) ?? "0.00")")
                            .subtitleFont
                    }
                }
                //Card
                VStack {
                    //Encierra todo
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "eye.slash").foregroundColor(QColor.white)
                        }.padding(.bottom, 5)
                        HStack{
                            Spacer()
                            Text("$\(numberFormatter.string(from: NSNumber(value: session.account?.balance ?? 0)) ?? "0.00")")
                                .titleFont
                        }
                        VStack(alignment: .leading) {
                                Text(session.account?.card[0].card.split(every: 4).joined(separator: " ") ?? "0000 0000 0000 0000")
                                    .bodyFont
                                    .foregroundColor(QColor.white)
                            HStack {
                                Text("12/28")
                                    .bodyFont
                                    .foregroundColor(QColor.white)
                                    .padding(.trailing, 40)
                                Text("543")
                                    .bodyFont
                                    .foregroundColor(QColor.white)
                                Spacer()
                            }
                        }
                        
                    }
                    .padding()
                    .background(gradient)
                    .clipShape(RoundedCorner(corners: [.topLeft , .topRight], radius: 16))
                    
                    HStack {
                        let name = session.account?.user.name ?? "Itzel Aixa"
                        let lastName = session.account?.user.lastname ?? "Ramon Alonzo"
                        
                        Text("\(name) \(lastName)")
                            .padding(10)
                        
                        Spacer()
                    }
                    .background(QColor.white)
                    .clipShape(RoundedCorner(corners: [.bottomLeft , .bottomRight], radius: 16))
                }.padding(.bottom, 10)
                
                //Botones
                HStack {
                    VStack {
                        Button ( action: {
                        }) {
                            Image(systemName: "arrow.up")
                        }.buttonStyle(IconButton())
                        Text("Transfer").smallFont.foregroundColor(QColor.white)
                    }
                    Spacer()
                    VStack {
                        Button ( action: {
                        }) {
                            Image(systemName: "arrow.down")
                        }.buttonStyle(IconButton())
                        Text("Receive").smallFont.foregroundColor(QColor.white)
                    }
                    Spacer()
                    VStack {
                        Button ( action: {
                        }) {
                            Image(systemName: "arrow.left.arrow.right")
                        }.buttonStyle(IconButton())
                        Text("Movements").smallFont.foregroundColor(QColor.white)
                    }
                }
                //Movimientos recientes
                VStack {
                        HStack{
                            VStack(alignment: .leading){
                                Text("AppleStore").smallFont.foregroundColor(QColor.white)
                                Text("5:09").smallFont.foregroundColor(QColor.white)
                            }
                            Spacer()
                            Text("-$9,546.00").smallFont.foregroundColor(QColor.white)
                        }
                        .padding(10)
                        .cornerRadius(8)
                        .background(QColor.textFieldBackground)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("AppleStore").smallFont.foregroundColor(QColor.white)
                            Text("5:09").smallFont.foregroundColor(QColor.white)
                        }
                        Spacer()
                        Text("-$9,546.00").smallFont.foregroundColor(QColor.white)
                    }
                    .padding(10)
                    .cornerRadius(8)
                    .background(QColor.textFieldBackground)
                    HStack{
                        VStack(alignment: .leading) {
                            Text("AppleStore").smallFont.foregroundColor(QColor.white)
                            Text("5:09").smallFont.foregroundColor(QColor.white)
                        }
                        Spacer()
                        Text("-$9,546.00").smallFont.foregroundColor(QColor.white)
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
