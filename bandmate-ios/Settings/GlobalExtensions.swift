//
//  GlobalExtensions.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 07.12.22.
//

import Foundation
import SwiftUI


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
