//
//  CustomTextField.swift
//  QuetzalBank
//
//  Created by Diego Gutiérrez on 04/07/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool?

    var body: some View {
        if isSecure != nil {
            SecureField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.white).bodyFont)
                .padding(10)
                .background(QColor.textFieldBackground)
                .foregroundColor(QColor.white)
                .cornerRadius(7)
                .font(.NunitoRegular(size: 16))
        } else {
            TextField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.white).bodyFont)
                .padding(10)
                .background(QColor.textFieldBackground)
                .foregroundColor(QColor.white)
                .cornerRadius(7)
                .font(.NunitoRegular(size: 16))

        }
    }
}

