//
//  HomeView.swift
//  UltimateProject
//
//  Created by Sergio Olivares on 11/3/20.
//

// first view to see on the app
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataControlller
    
    var body: some View {
        NavigationView {
            VStack {
                Button ("Add Data") {
                    dataController.deleteAll()
                    try? dataController.createSampledata()
                    
                }
            }
            .navigationTitle("Home")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
