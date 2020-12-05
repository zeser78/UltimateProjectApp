//
//  ContentView.swift
//  UltimateProject
//
//  Created by Sergio Olivares on 11/2/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        Text("Home")
                }
            ProjectsView(showCloseProjects: false)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            ProjectsView(showCloseProjects: true)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var  dataController = DataControlller.preview
    
    static var previews: some View {
        ContentView()
            // copy from UltimateProjectApp
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
