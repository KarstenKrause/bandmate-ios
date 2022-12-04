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
        .background(Color.white)
        .frame(height: 40)
        .mask(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke().fill(.black.opacity(0.1)))
        
    }
}

struct EmailTextField_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $text)
    }
}
