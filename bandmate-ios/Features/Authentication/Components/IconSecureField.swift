//
//  PasswordTextField.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 16.11.22.
//

import SwiftUI

struct IconSecureField: View {
    let icon: String
    let placeHolder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: self.icon).foregroundColor(.gray)
            SecureField(self.placeHolder, text: $text)
        }
        .padding()
        .background(Color.white)
        .mask(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(height: 40)
        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke().fill(.black.opacity(0.1))).frame(height: 40)
    }
}

struct PasswordTextField_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        IconSecureField(icon: "lock.fill", placeHolder: "Passwort", text: $text)
    }
}
