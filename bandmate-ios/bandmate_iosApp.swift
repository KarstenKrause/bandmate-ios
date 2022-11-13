//
//  bandmate_iosApp.swift
//  bandmate-ios
//
//  Created by Karsten Krause on 13.11.22.
//

import SwiftUI

@main
struct bandmate_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
