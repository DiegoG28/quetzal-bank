//
//  ButtonStyle.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct MainButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(QColor.white)
            .padding(10)
            .background(configuration.isPressed ? QColor.buttonBackgroundPressed : QColor.buttonBackground)
            .cornerRadius(7)
            .font(.NunitoRegular(size: 18))
    }
}
