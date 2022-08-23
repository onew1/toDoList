//
//  HomeView.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI


struct HomeView: View {
    
    @EnvironmentObject var viewModel: HomeListViewModel
    var body: some View {
        ZStack {
            if viewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                ForEach(viewModel.items) { item in
                ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                viewModel.updateItem(item: item)
                            }
                        }
            }
                .onDelete(perform: viewModel.deleteItem)
                .onMove(perform: viewModel.moveItem)

            }
        }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Afazeres"))
        .navigationBarHidden(false)
        .toolbar {
                 ToolbarItem(placement: .navigationBarLeading) {
                     EditButton()
                 }
                 ToolbarItem(placement: .navigationBarTrailing) {
                     NavigationLink("Add", destination: AddView())
                         .navigationBarHidden(false)
    }
    }

}
}














struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomeView()
            }
            .preferredColorScheme(.light)
            .environmentObject(HomeListViewModel())
            NavigationView {
                HomeView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(HomeListViewModel())
        }
    }
}

