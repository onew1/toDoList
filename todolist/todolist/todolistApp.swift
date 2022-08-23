//
//  todolistApp.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI

@main
struct todolistApp: App {
    
    @StateObject var listViewModel: HomeListViewModel = HomeListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
