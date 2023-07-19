//
//  LotusApp.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI

@main
struct LotusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
