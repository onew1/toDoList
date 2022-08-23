//
//  SplashViewModel.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI

class SplashViewModel: ObservableObject {

    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            self.uiState = .goToHomeScreen
        }
    }
}

    
extension SplashViewModel {
    func  homeView() -> some View {
        return SplashViewRouter.makeHomeView()
    }
}
