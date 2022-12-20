//
//  LoginView.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 14.11.22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    @State private var showRegistrationSheet = false

    // MARK: body
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack {
                    
                    // MARK:  Header
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
                    
                    // MARK: Form
                    VStack(alignment: .leading) {
                        IconTextField(icon: "envelope.fill", placeHolder: "Email", text: $authVM.email)
                            
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
                        
                        LoginButton()
                            .padding(.top, 15)
                        
                        Text(authVM.errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                        
                    }
                    .padding(38)
                    
                    Spacer()
                    
                    // MARK:  Registration Buttons
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
                        
                        Text("Registrieren mit Email, Apple oder Google").font(.system(size:12)).foregroundColor(.gray).padding(.bottom, 10)
                        
                        HStack {
                            Button {
                                toggleRegistrationSheet()
                            } label: {
                                Image(systemName: "envelope")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 32.0, height: 32.0)
                                    .foregroundColor(Color(.gray))
                            }
                            .sheet(isPresented: $showRegistrationSheet) {
                                RegistrationView()
                                    .presentationDetents([.fraction(0.77)])
                                    .presentationDragIndicator(.visible)
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
                    .padding(38)
                    
                }
                .frame(minHeight: geo.size.height)
                .ignoresSafeArea() 
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    // MARK: - Methods
    
    private func toggleRegistrationSheet() {
        showRegistrationSheet.toggle()
    }
    
    // MARK: Login Button
    private func LoginButton() -> some View {
        SubmitButton(isLoading: authVM.isLoading, buttonText: "Anmelden", action: {
            //TODO: implementation of the login logic
            print("login...")
            authVM.signIn()
        })
        .opacity(authVM.loginInputsFilled ? 1.0 : 0.6)
        .disabled(!authVM.loginFormValid())
    }
}

// MARK: Preview Provider
struct LoginView_Previews: PreviewProvider {
    static let previewAuthVM = AuthenticationViewModel()
    static var previews: some View {
        LoginView().environmentObject(previewAuthVM)
    }
}
