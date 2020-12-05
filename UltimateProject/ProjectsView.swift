//
//  ProjectsView.swift
//  UltimateProject
//
//  Created by Sergio Olivares on 11/3/20.
//

// show projects that are open or close
import SwiftUI

struct ProjectsView: View {
    // to open or close
    let showCloseProjects: Bool
    
    // using struct, but like property wrapper
    let projects: FetchRequest<Project>
    
    init(showCloseProjects: Bool) {
        self.showCloseProjects = showCloseProjects
        
        projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [
                                            NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)], predicate: NSPredicate(format: "closed = %d", showCloseProjects))
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(projects.wrappedValue) { project in
                    Section(header: Text(project.title ?? "")) {
                                ForEach(project.items?.allObjects as? [Item] ?? []) { item in
                                Text(item.title ?? "")
                                }
                    }
                }
            }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle(showCloseProjects ? "Closed Projects" : "Open Projects")
        }
    }
}

struct ProjectsView_Previews: PreviewProvider {
    
    static var  dataController = DataControlller.preview
    
    static var previews: some View {
        ProjectsView(showCloseProjects: false)
            // copy from UltimateProjectApp
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
