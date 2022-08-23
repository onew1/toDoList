//
//  SplashViewRouter.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI

enum SplashViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeListViewModel()
        return HomeView(viewModel: viewModel)
    }
}
