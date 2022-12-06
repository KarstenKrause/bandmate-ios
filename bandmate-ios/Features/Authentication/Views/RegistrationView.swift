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
        GeometryReader { geo in
            NavigationView {
                VStack {
                    Text("Neues Konto erstellen").font(.title)
                    // MARK: Body
                    VStack(alignment: .leading) {
                        
                        IconTextField(icon: "person.fill", placeHolder: "Benutzername", text: $authVM.username)
                        Text(authVM.usernamePrompt).foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $authVM.email)
                            .padding(.top, 15)
                        Text(authVM.emailPrompt).foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        IconSecureField(icon: "lock.fill", placeHolder: "Passwort", text: $authVM.password)
                            .padding(.top, 15)
                        Text(authVM.passwordPrompt).foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        IconSecureField(icon: "lock.fill", placeHolder: "Passwort bestätigen", text: $authVM.confirmPassword)
                            .padding(.top, 15)
                        Text(authVM.confirmPasswordPrompt).foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        Button {
                            //TODO: implementation of the registration logic
                            print("signing up...")
                        } label: {
                            Text("Registrieren")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 50)
                                .background(Color(.blue))
                                .cornerRadius(25)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 30)
                        
                        
                    }
                    .padding(.leading, 38)
                    .padding(.trailing, 38)
                    .padding(.top, 38)
                    
                    
                    // MARK: - Footer
                    VStack {
                        HStack {
                            Text("Du hast schon ein Account?")
                            .font(.footnote)
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Anmelden")
                                    .font(.footnote)
                                    .foregroundColor(Color.blue)
                            }
                            
                        }
                    }
                    .padding(10)
                }
                .onTapGesture {
                    hideKeyboard()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static let previewAuthVM = AuthenticationViewModel()
    static var previews: some View {
        RegistrationView().environmentObject(previewAuthVM)
    }
}
