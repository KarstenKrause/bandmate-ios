//
//  LoginView.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 14.11.22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    
                    // MARK: - Header
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
                    
                    // MARK: - Body
                    VStack(spacing: 24) {
                        
                        
                        IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $authVM.email)
                        IconSecureField(icon: "lock.fill", placeHolder: "Passwort", text: $authVM.password)
                        
                        Button {
                            //TODO: implementation of the login logic
                            print("login")
                        } label: {
                            Text("Anmelden")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 40)
                                .background(Color(.blue))
                                .cornerRadius(25)
                                .foregroundColor(.white)
                        }
                        
                        Text(authVM.errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                        
                        Spacer()
                        
                        
                        
                    }
                    .padding(38)
                    
                    // MARK: - Footer
                    VStack {
                        HStack {
                            VStack {
                                Divider()
                            }
                            
                            Text("ODER").foregroundColor(.gray).font(.system(size:12))
                            VStack {
                                Divider()
                            }
                        }
                        
                        Text("Registrieren mit Email, Apple oder Google").font(.system(size:12)).foregroundColor(.gray)
                        HStack {
                            
                            Button {
                                print("to SignupView")
                            } label: {
                                Image(systemName: "envelope")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32.0, height: 32.0)
                                    .foregroundColor(Color(.gray))
                            }
                            
                            Spacer()
                            
                            Button {
                                print("to SignupView")
                            } label: {
                                Image(systemName: "apple.logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32.0, height: 32.0)
                                    .foregroundColor(Color(.gray))
                            }
                            Spacer()
                            Button {
                                print("to SignupView")
                            } label: {
                                Image(systemName: "g.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32.0, height: 32.0)
                                    .foregroundColor(Color(.gray))
                            }

                        }
                        
                        
                    }
                    .padding(.leading, 38)
                    .padding(.trailing, 38)
                    
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static let previewAuthVM = AuthenticationViewModel()
    static var previews: some View {
        LoginView().environmentObject(previewAuthVM)
    }
}
