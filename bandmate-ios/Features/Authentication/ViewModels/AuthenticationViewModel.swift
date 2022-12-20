//
//  AuthenticationViewModel.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 14.11.22.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    
    // MARK: - Computed Properties
    var usernamePrompt: String {
        if usernameValid() || username.isEmpty {
            return ""
        } else {
            return "Der Nutzername ist zu kurz."
        }
    }
    
    var emailPrompt: String {
        if emailValid() || email.isEmpty {
            return ""
        } else {
            return "Dies ist keine gültige Email Adresse."
        }
    }
    
    var passwordPrompt: String {
        if passwordValid() || password.isEmpty {
            return ""
        } else {
            return "Das eingegebene Passwort ist zu kurz."
        }
    }
    
    var confirmPasswordPrompt: String {
        if passwordsMatch() || confirmPassword.isEmpty {
            return ""
        } else {
            return "Die Passwörter stimmen nicht überein."
        }
    }
    
    var loginInputsFilled: Bool {
        if email.isEmpty || password.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var registrationInputsFilled: Bool {
        if email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            return false
        } else {
            return true
        }
    }
    // MARK: - Validation Methods
    
    /// Checks if a given username  is valid or not.
    /// A given username must be at least 3 characters up to 40 characters long.
    /// - Returns: True if username  is valid.
    func usernameValid() -> Bool {
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", "^.{3,40}$")
        return usernameTest.evaluate(with: username)
    }
    
    /// Checks if a given email address  is valid or not.
    /// - Returns: True if email address is valid.
    func emailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    /// Checks if a given password is valid or not.
    /// A given password must be at least 8 characters long.
    /// - Returns: True if password is valid.
    func passwordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^.{8,40}$")
        return passwordTest.evaluate(with: password)
    }
    
    /// Checks the entry of two passwords inputs.
    /// - Returns: True if the password matches the confirm password
    func passwordsMatch() -> Bool {
        return password == confirmPassword
    }
    
    /// Checks whether all registration entries are valid and complete.
    /// - Returns: True if all entries are valid.
    func registrationFormValid() -> Bool {
        if passwordsMatch() && passwordValid() && emailValid() {
            return true
        }
        return false
    }
    
    func loginFormValid() -> Bool {
        if passwordsMatch() && emailValid() {
            return true
        }
        return false
    }
    
    func signIn() {
        isLoading = true
        
        // TODO: Replacing the Timer with the actual database login method
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            self.isLoading = false
            self.clearUserInputs()
        }
    }
    
    func signUp() {
        isLoading = true
        
        // TODO: Replacing the Timer with the actual database registration method
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            self.isLoading = false
            self.clearUserInputs()
        }
    }
    
    /// Clears all filled user inputs
    func clearUserInputs() {
        self.username = ""
        self.email = ""
        self.password = ""
        self.confirmPassword = ""
    }
    
    
}
