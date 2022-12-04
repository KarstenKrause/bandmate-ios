//
//  RegistrationView.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 04.12.22.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    VStack {
                        Text("Bandmate")
                            .font(.title)
                            .bold()
                            .padding()
                            .foregroundColor(.white)
                        Text("Vernetze dich mit Bands und Musikern aus deiner Umgebung.")
                            .font(.system(size:14))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(width: geo.size.width, height: geo.size.height / 3)
                    .background(Color.blue)
                    .ignoresSafeArea()
                    
                    VStack(alignment: .leading) {
                        IconTextField(icon: "person.fill", placeHolder: "Benutzername", text: $authVM.username)
                        //Text("gh").foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $authVM.email)
                            .padding(.top, 20)
                        //Text("dfwe").foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        IconSecureField(icon: "lock.fill", placeHolder: "Passwort", text: $authVM.password)
                            .padding(.top, 20)
                        //Text("dfwe").foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        IconSecureField(icon: "lock.fill", placeHolder: "Passwort bestätigen", text: $authVM.password)
                            .padding(.top, 20)
                        //Text("dfwe").foregroundColor(.red).font(.system(size: 12)).padding(.leading, 20)
                        
                        Button {
                            //TODO: implementation of the registration logic
                            print("signing up...")
                        } label: {
                            Text("Registrieren")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 40)
                                .background(Color(.blue))
                                .cornerRadius(25)
                                .foregroundColor(.white)
                        }
                        .padding(.top, 24)
                    }
                    .padding(38)
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static let previewAuthVM = AuthenticationViewModel()
    static var previews: some View {
        RegistrationView().environmentObject(previewAuthVM)
    }
}
