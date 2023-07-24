//
//  DashboardView.swift
//  QuetzalBank
//
//  Created by IMac_10_Invitado on 06/07/23.
//

import SwiftUI

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
    @ObservedObject private var session = UserSession.shared
    @ObservedObject private var viewModel = LoginViewModel()
    
    @State private var isRefreshing = false
    @State private var showMovementsView = false
    @State private var showTransferView = false
    @State private var showProfileView = false
    @State private var showReceiveView = false


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
        ZStack {
            QColor.background.ignoresSafeArea()
            // PULL TO REFESH
            PullToRefresh(isRefreshing: $isRefreshing) {
                    }
                    .onAppear {
                        
                        Task {
                            await viewModel.fetchAccountData() // Cargar los datos cuando se abre la vista
                        }
                        
                    }
                    .onChange(of: isRefreshing) { newValue in
                        if newValue {
                            Task {
                                await viewModel.fetchAccountData() // Cargar los datos cuando se refresca
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    isRefreshing = false // Detener el refresco después de 1 segundo
                                }
                            }
                            
                        }
                    }
            // VIEW CONTENT
            VStack {
                HStack{
                    VStack (alignment: .leading){
                        Button (action: {
                            showProfileView = true
                        }) {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 47, height: 47)
                        }
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
                                Text(session.account?.card[0].card.splitCard(every: 4).joined(separator: " ") ?? "0000 0000 0000 0000")
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
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .background(QColor.white)
                    .clipShape(RoundedCorner(corners: [.bottomLeft , .bottomRight], radius: 16))
                }.padding(.bottom, 10)
                
                //Botones
                HStack {
                    VStack {
                        Button ( action: {
                            showTransferView = true
                        }) {
                            Image(systemName: "arrow.up")
                        }.buttonStyle(IconButton())
                        Text("Transfer").smallFont.foregroundColor(QColor.white)
                    }
                    Spacer()
                    VStack {
                        Button ( action: {
                            showReceiveView = true
                        }) {
                            Image(systemName: "arrow.down")
                        }.buttonStyle(IconButton())
                        Text("Receive").smallFont.foregroundColor(QColor.white)
                    }
                    Spacer()
                    VStack {
                        Button ( action: {
                            showMovementsView = true
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
                Button {
                    session.isLoggedIn = false
                } label: {
                    Text("Sign out").frame(maxWidth: .infinity)
                }
                .buttonStyle(MainButton())
                .padding(5)
            }
            .offset(y: isRefreshing ? 15 : 0)
            .animation(.linear(duration: 0.1), value: isRefreshing)

            .padding()
            .navigationDestination(isPresented: $showMovementsView) {
                MovementsView()
            }
            .navigationDestination(isPresented: $showTransferView) {
                TransferView()
            }
            .navigationDestination(isPresented: $showProfileView) {
                ProfileView()
            }
            .navigationDestination(isPresented: $showReceiveView) {
                ReceiveView()
            }
        }
    
    }
}

struct PullToRefresh: View {
    @Binding var isRefreshing: Bool
    let onRefresh: () -> Void
    
    var body: some View {
        VStack {
            if isRefreshing {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: QColor.errorText))
            }
            ScrollView {
                VStack {
                    Color.clear.frame(height: 1)
                }
                .offset(y: isRefreshing ? 50 : 0)
            }
            .coordinateSpace(name: "scroll")
            .gesture(DragGesture(coordinateSpace: .named("scroll"))
                        .onChanged(onChanged)
                        .onEnded(onEnded))
        }
    }
    
    private func onChanged(drag: DragGesture.Value) {
        if drag.startLocation.y < drag.location.y {
            isRefreshing = true
        }
    }
    
    private func onEnded(drag: DragGesture.Value) {
        onRefresh()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
