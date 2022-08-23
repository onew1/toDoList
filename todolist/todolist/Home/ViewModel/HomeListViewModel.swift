//
//  HomeListView.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI

class HomeListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            ItemModel(title: "primeiro item", isCompleted: false),
//            ItemModel(title: "2ndo item", isCompleted: true),
//            ItemModel(title: "terceiro!", isCompleted: false),]
//        items.append(contentsOf: newItems)
        // unwrappei o data para que nao seja possivel nao resultar em vazio
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}


//extension HomeListViewModel {
//    func  addView() -> some View {
//        return HomeListVMRouter.makeListView()
//    }
//}
