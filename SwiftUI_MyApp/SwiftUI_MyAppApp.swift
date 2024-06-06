//
//  SwiftUI_MyAppApp.swift
//  SwiftUI_MyApp
//
//  Created by Josh on 16/04/24.
//

import SwiftUI

@main
struct SwiftUI_MyAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          HomeView()
        }
    }
}
