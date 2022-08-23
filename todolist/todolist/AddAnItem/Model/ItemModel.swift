//
//  ItemModel.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 17/08/22.
//

import SwiftUI

//immutable struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
        
    }
    
}
