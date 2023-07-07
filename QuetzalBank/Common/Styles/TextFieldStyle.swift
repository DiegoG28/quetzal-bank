//
//  TextFieldStyle.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 06/07/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(QColor.textFieldBackground)
            .foregroundColor(QColor.white)
            .cornerRadius(7)
            .font(.NunitoRegular(size: 16))
    }
}
