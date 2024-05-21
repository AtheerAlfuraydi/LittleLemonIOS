//
//  LittleLemonIOSApp.swift
//  LittleLemonIOS
//
//  Created by أثير on 11/11/1445 AH.
//

import SwiftUI

@main
struct LittleLemonIOSApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
           Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
