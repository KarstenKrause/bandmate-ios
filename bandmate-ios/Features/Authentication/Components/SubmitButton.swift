//
//  SubmitButton.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 20.12.22.
//

import SwiftUI

struct SubmitButton: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    var isLoading: Bool
    let buttonText: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            if !authVM.isLoading {
                Text(buttonText)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(.blue))
                    .cornerRadius(25)
                    .foregroundColor(.white)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color(.blue))
                    .cornerRadius(25)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static let previewAuthVM = AuthenticationViewModel()
    static var previews: some View {
        SubmitButton(isLoading: previewAuthVM.isLoading, buttonText: "Test") {
            print("test")
        }
        .environmentObject(previewAuthVM)
    }
}
