//
//  SplashView.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
        switch viewModel.uiState {
        case .loading:
            loadingView()
        case .goToHomeScreen:
            viewModel.homeView()
        case .error(let msg):
            loadingView(error: msg)
        }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
        .navigationBarHidden(false)
    }
}



extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .padding(100)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("to Do"), message: Text(error), dismissButton: .default(Text("Sair")) {
                        })
            }
        }
        }
    }
}









struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
        }
    }
}
