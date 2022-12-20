//
//  ContentView.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 13.11.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var authVM: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
