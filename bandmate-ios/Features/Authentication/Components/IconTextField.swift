//
//  EmailTextField.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 16.11.22.
//

import SwiftUI

struct IconTextField: View {
    let icon: String
    let placeHolder: String
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: self.icon).foregroundColor(.gray)
            TextField(self.placeHolder, text: $text)
                .disableAutocorrection(true)
                .autocapitalization(.none)
        }
        .padding()
        .background(Color("CustomPrimary"))
        .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .frame(height: 55)
        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous)
        .stroke()
        .fill(.gray.opacity(0.4)))
        .frame(height: 50)
        
    }
}

struct EmailTextField_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $text)
    }
}
