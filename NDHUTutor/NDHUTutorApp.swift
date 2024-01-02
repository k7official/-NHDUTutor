//
//  NDHUTutorApp.swift
//  NDHUTutor
//
//  Created by Muhle Musa Khumalo on 2023/12/21.
//

import SwiftUI

@main
struct NDHUTutorApp: App {
    let persistenceController = PersistenceController.shared
    
    @State private var isAuthenticated = false
    var body: some Scene {
        WindowGroup {
            if isAuthenticated {
                TabView_()
            }else {
                ContentView(isAuthenticated: $isAuthenticated)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
