//
//  UltimateProjectApp.swift
//  UltimateProject
//
//  Created by Sergio Olivares on 11/2/20.
//

import SwiftUI

@main
struct UltimateProjectApp: App {
    // make an instance
      // state object struct with datacontroller inside
    @StateObject var dataController: DataControlller
    
    init() {
        // an instance of DataController(0
        let dataController = DataControlller()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
