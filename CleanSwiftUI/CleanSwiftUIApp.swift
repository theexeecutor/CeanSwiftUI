//
//  CleanSwiftUIApp.swift
//  CleanSwiftUI
//
//  Created by Bhabani Shankar on 22/05/26.
//

import SwiftUI
import CoreData

@main
struct CleanSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
