//
//  AuthenticationViewModel.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 14.11.22.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
}
