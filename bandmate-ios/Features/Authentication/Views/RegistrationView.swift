//
//  RegistrationView.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 04.12.22.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Neues Konto erstellen").font(.title)
                
                // MARK: Form
                VStack(alignment: .leading) {
                    IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $authVM.email)
                        .padding(.top, 15)
                    
                    Text(authVM.emailPrompt)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .padding(.leading, 20)
                    
                    IconSecureField(icon: "lock.fill", placeHolder: "Passwort", text: $authVM.password)
                        .padding(.top, 15)
                    
                    Text(authVM.passwordPrompt)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .padding(.leading, 20)
                    
                    IconSecureField(icon: "lock.fill", placeHolder: "Passwort bestätigen", text: $authVM.confirmPassword)
                        .padding(.top, 15)
                    
                    Text(authVM.confirmPasswordPrompt)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                        .padding(.leading, 20)
                    
                    SignupButton()
                }
                .padding(.leading, 38)
                .padding(.trailing, 38)
                .padding(.top, 38)
                
                // MARK: Navigation
                VStack {
                    HStack {
                        Text("Du hast schon ein Account?")
                            .font(.footnote)
                        Button {
                            self.dismiss()
                        } label: {
                            Text("Anmelden")
                                .font(.footnote)
                                .foregroundColor(Color.blue)
                        }
                    }
                }
                .padding(10)
            }
        }
        .navigationBarHidden(true)
        
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    // MARK: - Methods
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    // MARK: Signup Button
    private func SignupButton() -> some View {
        SubmitButton(isLoading: authVM.isLoading, buttonText: "Registrieren", action: {
            //TODO: implementation of the registration logic
            print("signing up...")
            authVM.signUp()
        })
        .opacity(authVM.registrationInputsFilled ? 1.0 : 0.6)
        .disabled(!authVM.registrationFormValid())
        .padding(.top, 30)
    }
    
}

// MARK: - Preview Provider
struct RegistrationView_Previews: PreviewProvider {
    static let previewAuthVM = AuthenticationViewModel()
    static var previews: some View {
        RegistrationView().environmentObject(previewAuthVM)
    }
}
